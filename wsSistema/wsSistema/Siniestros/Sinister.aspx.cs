using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.IO.Compression;
using Ionic.Utils.Zip;
using Ionic.Zip;

public partial class Siniestros_Sinister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["v"] != null)
            {
                switch (Convert.ToChar(Request.QueryString["v"].ToString()))
                {

                    case '0':

                        mvwSiniestros.ActiveViewIndex = 0;
                        lblidSiniestro.Text = "0";
                        break;

                    case '1':

                        mvwSiniestros.ActiveViewIndex = 1;
                        TraeSiniestros();

                        break;
                }
            }
        }
    }

    protected void btnAgregarPoliza_Click(object sender, EventArgs e)
    {

    }

    private void TraeSiniestros()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetSinister", 0,0);
        gvSiniestros.DataSource = tbl;
        gvSiniestros.DataBind();
    }

    protected void btnGuardarInformacion_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SaveSinister", lblidSiniestro.Text, txtNumSiniestro.Text, txtNumReporte.Text, lblidPoliza.Text, txtNombreCodunctor.Text, txtTelCOnductor.Text, txtNombreReportante.Text, txtTelReportante.Text, ddlTipoEmergencia.SelectedValue.ToString(), txtDescripcionSiniestro.Text, txtFecSiniestro.Text, txtHoraSiniestro.Text, txtFecReporte.Text, txtHoraReporte.Text, 1, 1);

        if (tbl.Rows.Count > 0)
        {
            lblidSiniestro.Text = tbl.Rows[0][0].ToString();

            Response.Write("<script>alert('" + tbl.Rows[0]["msj"].ToString() + "')</script>");
        }

    }

    protected void txtPoliza_TextChanged(object sender, EventArgs e)
    {
        TraePoliza();
    }

    private void TraePoliza()
    {
        if (txtPoliza.Text != "" && txtInciso.Text != "")
        {
            DatosSql sql = new DatosSql();
            DataTable tbl = sql.TraerDataTable("sp_GetPolicyID", txtPoliza.Text, txtInciso.Text);

            if (tbl.Rows.Count > 0)
            {
                txtCliente.Text = tbl.Rows[0]["Name_RS"].ToString();
                ddlCia.SelectedValue = tbl.Rows[0]["Cia_ID"].ToString();
                lblidPoliza.Text = tbl.Rows[0]["Policy_ID"].ToString();
                TraeDatoVehiculo();

            }
        }
    }

    private void TraeDatoVehiculo()
    {
        if (lblidPoliza.Text != "0")
        {
            DatosSql sql = new DatosSql();
            DataTable tbl = sql.TraerDataTable("sp_GetPolicyxID", lblidPoliza.Text);

            if (tbl.Rows.Count > 0)
            {
                DataRow dr = tbl.Rows[0];

                txtVIN.Text = dr["VIN"].ToString();
                txtNumMotor.Text = dr["Motor"].ToString();
                txtNumPlaca.Text = dr["License_Plate"].ToString();
                txtClaveCia.Text = dr["Cve_Cia"].ToString();
                txtMarca.Text = dr["Make"].ToString();
                txtDescripcionVehiculo.Text = dr["Subtype"].ToString();
                txtModelo.Text = dr["Model"].ToString();
              
               
            }
        }
    }

    protected void txtInciso_TextChanged(object sender, EventArgs e)
    {
        TraePoliza();
    }

    protected void btnUbicacion_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 0;
        String Carpeta = "PRM-SIN-" + lblidPoliza.Text + "-" + lblidSiniestro.Text;
        TraeDocumentosImagenes(Carpeta,"Principal");
    }

    protected void btnVehiculo_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 1;
    }

    protected void btnGuardarUbicacion_Click(object sender, EventArgs e)
    {

    }

    protected void btnEvidencia_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 2;
    }

    protected void rptFotografias_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        String Valor = e.CommandArgument.ToString();
        String path2 = Server.MapPath("~/Siniestros/");

        System.IO.File.Delete(path2 + Valor);

        String Carpeta = "PRM-SIN-" + lblidPoliza.Text + "-" + lblidSiniestro.Text;

        TraeDocumentosImagenes(Carpeta, "Principal");
    }

    protected void btnSubirArchivos_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        Boolean fileOK = false;
        String path = Server.MapPath("~/Siniestros/Comprimidos/");
        String path2 = Server.MapPath("~/Siniestros/Fotografias/");

        if (fuSubirArchivos.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(fuSubirArchivos.FileName).ToLower();
            String[] allowedExtensions = { ".zip", ".jpg", ".png", ".gif", ".pdf" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
        }

        String Mensaje = "";

        if (fileOK)
        {
            try
            {
                fuSubirArchivos.SaveAs(path + fuSubirArchivos.FileName);


                String Carpeta = "PRM-SIN-" + lblidPoliza.Text + "-" + lblidSiniestro.Text;

                if (!Directory.Exists(path2 + Carpeta + "/"))
                {
                    DirectoryInfo di = Directory.CreateDirectory(path2 + Carpeta + "/");

                    sql.Ejecutar("sp_SaveSinisterEvidence", 0, lblidSiniestro.Text, fuSubirArchivos.FileName, Carpeta, 1);


                }

                if (!Directory.Exists(path2 + Carpeta + "/Principal"))
                {
                    DirectoryInfo di2 = Directory.CreateDirectory(path2 + Carpeta + "/Principal");

                }


                if (System.IO.Path.GetExtension(fuSubirArchivos.FileName).ToLower() == ".zip")
                {
                    Ionic.Utils.Zip.ZipFile zipSalida = Ionic.Utils.Zip.ZipFile.Read(path + fuSubirArchivos.FileName);
                    zipSalida.ExtractAll(path2 + Carpeta + "/Principal");
                }
                else
                {
                    fuSubirArchivos.SaveAs(path2 + Carpeta + "/Principal/" + fuSubirArchivos.FileName);
                }

                Mensaje = "Se ha subido con exito los documentos :D";
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);

                TraeDocumentosImagenes(Carpeta, "Principal");

                System.IO.File.Delete(path + fuSubirArchivos.FileName);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"Ha ocurrido un error D:\", \"error\");", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"No es un archivo valido debe ser con extencion .zip\", \"error\");", true);
        }
    }

    private void TraeDocumentosImagenes(String Carpeta, String SubCarpeta)
    {
        DataTable tbl = new DataTable();
        tbl.Columns.Add("Ruta");
        tbl.Columns.Add("Imagen");

        String path2 = Server.MapPath("~/Siniestros/Fotografias/");

        DirectoryInfo di = Directory.CreateDirectory(path2 + Carpeta + "/" + SubCarpeta);

        foreach (var fi in di.GetFiles())
        {

            if (fi.Extension.ToLower() == ".pdf")
            {
                tbl.Rows.Add("Fotografias/" + Carpeta + "/" + SubCarpeta + "/" + fi.Name, "../images/icons/imgpdf.png");
            }
            else
            {
                tbl.Rows.Add("Fotografias/" + Carpeta + "/" + SubCarpeta + "/" + fi.Name, "Fotografias/" + Carpeta + "/Principal/" + fi.Name);
            }

        }

        rptFotografias.DataSource = tbl;
        rptFotografias.DataBind();
    }

    protected void btnDescargarImagenes_Click(object sender, EventArgs e)
    {
        String Carpeta = "PRM-SIN-" + lblidPoliza.Text + "-" + lblidSiniestro.Text;
        String path2 = Server.MapPath("~/Siniestros/Fotografias/");

        String Nombre = "FOTOS_" + DateTime.Now.ToString("ddMMyyyyHHmmss") + ".zip";

        ComprimirFolder(path2 + Carpeta + "/Principal", Nombre);



        Descargar("Comprimidos/" + Nombre);
    }

    static public Boolean ComprimirFolder(string Ruta, string Nombre)
    {

        try
        {
            using (Ionic.Zip.ZipFile zip = new Ionic.Zip.ZipFile())
            {
                zip.AddDirectory(Ruta);
                String Rut = HttpContext.Current.Server.MapPath("Comprimidos/" + Nombre);
                zip.Save(Rut);

            }

            return true;
        }
        catch (Exception ex)
        {
            return false;

        }

    }


    static public void Descargar(string Ruta)
    {
        FileInfo toDownload =
                   new System.IO.FileInfo(HttpContext.Current.Server.MapPath(Ruta));

        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.AddHeader("Content-Disposition",
                   "attachment; filename=" + toDownload.Name);
        HttpContext.Current.Response.AddHeader("Content-Length",
                   toDownload.Length.ToString());
        HttpContext.Current.Response.ContentType = "application/octet-stream";
        HttpContext.Current.Response.WriteFile(Ruta);
        HttpContext.Current.Response.End();
    }

    private void traeEdoMunColXCP()
    {
        String cp = txtCodigoPostal.Text;

        wsCodigosPostales.ServiceSoap wsCod = new wsCodigosPostales.ServiceSoapClient();

        cp = ("00000" + cp).Substring(cp.Length, 5);

        try
        {
            DataTable tblCP = wsCod.TblColonias(cp);

            txtEntidadFederativaS.Text = tblCP.Rows[0]["Estado"].ToString();
            txtMunicipioS.Text = tblCP.Rows[0]["Municipio"].ToString();


            ddlColoniaS.DataSource = tblCP;
            ddlColoniaS.DataTextField = "Colonia";
            ddlColoniaS.DataValueField = "Colonia";
            ddlColoniaS.DataBind();

            txtCodigoPostal.Text = cp;
        }
        catch (Exception exx)
        {

        }
    }


    protected void btnBuscarUbicacion_Click(object sender, EventArgs e)
    {
        String direccion = "https://www.google.com/maps/embed/v1/place?key=AIzaSyBErAFMiN6lqMbr4GPnw1EAZhLKcg3sTSs&q=";


        try
        {

            if (txtCalleNumeroS.Text != string.Empty)
            {
               
                direccion+= txtCalleNumeroS.Text.Replace(" ", "+") + "," + "+";
            }
            if (ddlColoniaS.SelectedValue.ToString() != string.Empty)
            {
               
                direccion += ddlColoniaS.SelectedValue.ToString().Replace(" ", "+") + "," + "+";
            }
            if (txtEntidadFederativaS.Text != string.Empty)
            {
              
                direccion += txtEntidadFederativaS.Text.Replace(" ", "+") + "," + "+";
            }
            if (txtMunicipioS.Text != string.Empty)
            {
               
                direccion += txtMunicipioS.Text.Replace(" ", "+") + "," + "+";
            }
            if (txtCodigoPostal.Text != string.Empty)
            {
                
                direccion += txtCodigoPostal.Text.Replace(" ", "+") + "," + "+";
            }

            myUbicacion.Attributes["src"] = direccion.ToString();

        }
        catch (Exception ex) { }



    }


    protected void txtCodigoPostal_TextChanged(object sender, EventArgs e)
    {
        traeEdoMunColXCP();
    }

    protected void btnAgregarInfoCliente_Click(object sender, EventArgs e)
    {
        if(txtInformacionAdicionalCliente.Text != "")
        {
            
            int idUsuario = 1;
            //int idUsuario = Convert.ToInt32(HttpContext.Current.Session["idUsuario"].ToString());
            DatosSql sql = new DatosSql();
            sql.Ejecutar("sp_SaveSinisterComment",0,lblidSiniestro.Text, txtInformacionAdicionalCliente.Text,1);

            String Mensaje = "Información del Cliente Adicional Agregada";
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);

            txtInformacionAdicionalCliente.Text = "";
            DataTable tbl = sql.TraerDataTable("sp_GetCommentSinister", lblidSiniestro.Text);
            gvInformacionCLiente.DataSource = tbl;
            gvInformacionCLiente.DataBind();

        }
        else
        {
            String Mensaje = "El comentario no puede quedar Vacio";
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh!\",\"" + Mensaje + "\", \"error\");", true);
        }
    }

    protected void btnObservaciones_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 3;
    }

    protected void gvSiniestros_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String opc = e.CommandName.ToString();
        String val = e.CommandArgument.ToString();

        switch(opc)
        {
            case "Delete":
                break;
            case "View":
                break;
        }
    }

    private void TraeSiniestroCompleto(int Sinister_ID)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetSinister",Sinister_ID,1);

        if(tbl.Rows.Count>0)
        {
            DataRow dr = tbl.Rows[0];

            lblidSiniestro.Text = Sinister_ID.ToString();

            txtNumSiniestro.Text = dr["Number_Sinister"].ToString();
            txtNumReporte.Text = dr["Number_Report"].ToString();
            lblidPoliza.Text = dr["Policy_ID"].ToString();
            txtNombreCodunctor.Text = dr["Name_Driver"].ToString();
            txtNombreReportante.Text = dr["Name_Reportant"].ToString();
            txtTelCOnductor.Text = dr["Phone_Driver"].ToString();
            txtTelReportante.Text = dr["Phone_Reportant"].ToString();
            ddlTipoEmergencia.SelectedValue = dr["Emergency_ID"].ToString();
            txtDescripcionSiniestro.Text = dr["Description"].ToString();
           
            txtFecSiniestro.Text = dr["Date_Sinister"].ToString();
            txtHoraSiniestro.Text = dr["Time_Sinister"].ToString();
            txtFecReporte.Text = dr["Date_Report"].ToString();
            txtHoraReporte.Text = dr["Time_Report"].ToString();

            TraePoliza();

        }
    }

    protected void btnPagos_Click(object sender, EventArgs e)
    {

    }
}
