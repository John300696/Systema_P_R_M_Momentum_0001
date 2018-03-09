using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using iTextSharp.text.pdf;
using System.IO;
using System.Text;

public partial class OrdenesTrabajo_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["v"] != null)
            {
                switch (Convert.ToChar(Request.QueryString["v"].ToString()))
                {

                    case '0':

                        mvwOrdenesTrabajo.ActiveViewIndex = 0;
                        TraeCatalogos();

                        break;

                    case '1':

                        mvwOrdenesTrabajo.ActiveViewIndex = 1;
                        TraeOrdenesTrabajo();

                        break;
                }
            }
        }
    }

    private void TraeCatalogos()
    {
        Extras ex = new Extras();

        ddlOrdenTrabajo.DataSource = ex.TraeCatalogos(17, 0);
        ddlOrdenTrabajo.DataValueField = "Type_Work_Order_ID";
        ddlOrdenTrabajo.DataTextField = "Type_Work_Order";
        ddlOrdenTrabajo.DataBind();

        ddlCia.DataSource = ex.TraeCatalogos(2, 0);
        ddlCia.DataValueField = "Cia_ID";
        ddlCia.DataTextField = "Cia";
        ddlCia.DataBind();

        ddlCObertura.DataSource = ex.TraeCatalogos(5, 0);
        ddlCObertura.DataValueField = "Coverage_ID";
        ddlCObertura.DataTextField = "Coverage";
        ddlCObertura.DataBind();

        ddlFormaPago.DataSource = ex.TraeCatalogos(13, 0);
        ddlFormaPago.DataValueField = "WayToPay_ID";
        ddlFormaPago.DataTextField = "WayToPay";
        ddlFormaPago.DataBind();

        ddlRamo.DataSource = ex.TraeCatalogos(18, 0);
        ddlRamo.DataValueField = "Branch_ID";
        ddlRamo.DataTextField = "Branch";
        ddlRamo.DataBind();

        TraeConducto();
        TraeSubRamo();

        
    }

    private void BuscaInfoPersona()
    {

    }

    private String TraeRFCPersona(String Nombre,String AP, String AM,DateTime FecNacimiento)
    {
        String RFC = "";
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GeneraRFC",Nombre.ToUpper().Replace("Á","A").Replace("É", "E").Replace("Í", "I").Replace("Ó", "O").Replace("Ú", "U"),AP.ToUpper().Replace("Á", "A").Replace("É", "E").Replace("Í", "I").Replace("Ó", "O").Replace("Ú", "U"),AM.ToUpper().Replace("Á", "A").Replace("É", "E").Replace("Í", "I").Replace("Ó", "O").Replace("Ú", "U"),FecNacimiento.ToString("yyyyMMdd"),"");

        if(tbl.Rows.Count>0)
        {
            RFC = tbl.Rows[0]["RFC"].ToString();
        }

        return RFC;
    }

    private void TraeSubRamo()
    {
        Extras ex = new Extras();

        ddlSubRamo.DataSource = ex.TraeCatalogos(18, Convert.ToInt32(ddlRamo.SelectedValue.ToString()));
        ddlSubRamo.DataValueField = "Branch_ID";
        ddlSubRamo.DataTextField = "Branch";
        ddlSubRamo.DataBind();

        TraeInfoAdicional();
       
    }

    private void TraeInfoAdicional()
    {
        Extras ex = new Extras();
        try
        {
            rptInfoAdicional.DataSource = ex.TraeCatalogos(19, Convert.ToInt32(ddlSubRamo.SelectedValue.ToString()));
            rptInfoAdicional.DataBind();
        }
        catch(Exception exx)
        {

        }
        
    }

    private void TraeConducto()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = new DataTable();

        if (ddlCOnducto.SelectedValue.ToString() == "1")
        {
            tbl = sql.TraerDataTable("sp_GetPersonxRole", 1);
        }
        else
        {
            tbl = sql.TraerDataTable("sp_GetPersonxRole", 2);
        }

        ddlSolicito.DataSource = tbl;
        ddlSolicito.DataTextField = "NameC";
        ddlSolicito.DataValueField = "Person_ID";
        ddlSolicito.DataBind();
        
    }

    protected void txtCP_TextChanged(object sender, EventArgs e)
    {
        //traeEdoMunColXCP();
    }

    private void traeEdoMunColXCPAsegurado()
    {
        String cp = txtCodigoPostalAsegurado.Text;

        wsCodigosPostales.ServiceSoap wsCod = new wsCodigosPostales.ServiceSoapClient();

        cp = ("00000" + cp).Substring(cp.Length, 5);

        try
        {
            DataTable tblCP = wsCod.TblColonias(cp);

            txtEstadoAsegurado.Text = tblCP.Rows[0]["Estado"].ToString();
            txtMunicipioAsegurado.Text = tblCP.Rows[0]["Municipio"].ToString();


            ddlColoniaAsegurado.DataSource = tblCP;
            ddlColoniaAsegurado.DataTextField = "Colonia";
            ddlColoniaAsegurado.DataValueField = "Colonia";
            ddlColoniaAsegurado.DataBind();

            txtCodigoPostalAsegurado.Text = cp;
        }
        catch (Exception exx)
        {

        }
    }
    private void traeEdoMunColXCPContratante()
    {
        String cp = txtCodigoPostalContratante.Text;

        wsCodigosPostales.ServiceSoap wsCod = new wsCodigosPostales.ServiceSoapClient();

        cp = ("00000" + cp).Substring(cp.Length, 5);

        try
        {
            DataTable tblCP = wsCod.TblColonias(cp);

            txtEstadoContratante.Text = tblCP.Rows[0]["Estado"].ToString();
            txtMunicipioContratante.Text = tblCP.Rows[0]["Municipio"].ToString();


            ddlColoniaContratante.DataSource = tblCP;
            ddlColoniaContratante.DataTextField = "Colonia";
            ddlColoniaContratante.DataValueField = "Colonia";
            ddlColoniaContratante.DataBind();

            txtCodigoPostalContratante.Text = cp;
        }
        catch (Exception exx)
        {

        }
    }

    protected void ddlRamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeSubRamo();
    }

    protected void ddlCOnducto_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeConducto();
    }

    protected void ddlOrdenTrabajo_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void ddlSubRamo_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeInfoAdicional();
    }

    
    protected void rptInfoAdicional_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Label lbl = e.Item.FindControl("lblTipo") as Label;
            DropDownList ddl = e.Item.FindControl("ddlCatalogo") as DropDownList;
            TextBox txt = e.Item.FindControl("txtInformacion") as TextBox;

            if (lbl.Text == "1")
            {
                txt.Visible = true;
            }
            else
            {
                ddl.Visible = true;
                Label lbl2 = e.Item.FindControl("lblCatalogo") as Label;
                Extras ex = new Extras();
                DataTable tbl = ex.TraeCatalogos(Convert.ToInt32(lbl2.Text), 0);
                ddl.DataSource = tbl;
                ddl.DataValueField = tbl.Columns[0].ColumnName;
                ddl.DataTextField = tbl.Columns[1].ColumnName;
                ddl.DataBind();
            }
        }
    }

    private void TraeExistenciaAsegurado()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_ExistRFC", txtRFCAsegurado.Text);

        if (tbl.Rows.Count > 0)
        {
            lblidAsegurado.Text = tbl.Rows[0]["PolicyPeople_ID"].ToString();

            if(lblidAsegurado.Text != "0")
            {
                DataRow dr = tbl.Rows[0];
                ddlTipoPersonaAsegurado.SelectedValue = dr["TypePerson_ID"].ToString();

              
                String Nombre = dr["Name"].ToString();
                String AP = dr["First_LastName"].ToString();
                String AM = dr["Second_LastName"].ToString();
                String Genero = dr["Genere_ID"].ToString();
                String FecNacimiento = Convert.ToDateTime(dr["BirthDate"].ToString()).ToString("dd/MM/yyyy");
                String CURP = dr["CURP"].ToString();

                if (ddlTipoPersonaAsegurado.SelectedValue.ToString() == "1")
                {
                    txtNombreAsegurado.Text = Nombre;
                    txtAPAsegurado.Text = AP;
                    txtAMAsegurado.Text = AM;
                    ddlSexoAsegurado.SelectedValue = Genero;
                    txtFecNacimientoAsegurado.Text = FecNacimiento;
                    txtCURPAsegurado.Text = CURP;

                    mvwDatosAsegurado.ActiveViewIndex = 0;
                    pnlPFAsegurado.Visible = true;
                }
                else
                {
                    mvwDatosAsegurado.ActiveViewIndex = 1;
                    pnlPFAsegurado.Visible = false;

                    txtRazonSocialAsegurado.Text = Nombre ;
                }
                txtCalleNumeroAsegurado.Text = dr["Address"].ToString();
                txtYOAsegurado.Text = dr["Y/O"].ToString();
                txtRFCAsegurado.Text = dr["RFC"].ToString();
                txtGiroNegocioAsegurado.Text = dr["business"].ToString();
                txtCodigoPostalAsegurado.Text = dr["ZIP"].ToString();
                traeEdoMunColXCPAsegurado();
                ddlColoniaAsegurado.SelectedValue = dr["Colony"].ToString();
                txtTelefonoAsegurado.Text = dr["Phone"].ToString();
                txtCorreoAsegurado.Text = dr["Email"].ToString();
            }

            

           
            

        }
    }

    private void TraeExistenciaContratante()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_ExistRFC", txtRFCContratante.Text);

        if (tbl.Rows.Count > 0)
        {
            lblidContratante.Text = tbl.Rows[0]["PolicyPeople_ID"].ToString();

            if (lblidContratante.Text != "0")
            {
                DataRow dr = tbl.Rows[0];
                ddlTipoPersonaContratante.SelectedValue = dr["TypePerson_ID"].ToString();


                String Nombre = dr["Name"].ToString();
                String AP = dr["First_LastName"].ToString();
                String AM = dr["Second_LastName"].ToString();
                String Genero = dr["Genere_ID"].ToString();
                String FecNacimiento = Convert.ToDateTime(dr["BirthDate"].ToString()).ToString("dd/MM/yyyy");
                String CURP = dr["CURP"].ToString();

                if (ddlTipoPersonaContratante.SelectedValue.ToString() == "1")
                {
                    txtNombreContratante.Text = Nombre;
                    txtAPContratante.Text = AP;
                    txtAMContratante.Text = AM;
                    ddlSexoContratante.SelectedValue = Genero;
                    txtFecNacimientoContratante.Text = FecNacimiento;
                    txtCURPContratante.Text = CURP;

                    mvwDatosContratante.ActiveViewIndex = 0;
                    pnlPFContratante.Visible = true;
                }
                else
                {
                    mvwDatosContratante.ActiveViewIndex = 1;
                    pnlPFContratante.Visible = false;

                    txtRazonSocialContratante.Text = Nombre;
                }

                txtCalleNumeroContratante.Text = dr["Address"].ToString();
                txtYOContratante.Text = dr["Y/O"].ToString();
                txtRFCContratante.Text = dr["RFC"].ToString();
                txtGiroNegocioContratante.Text = dr["business"].ToString();
                txtCodigoPostalContratante.Text = dr["ZIP"].ToString();
                traeEdoMunColXCPContratante();
                ddlColoniaContratante.SelectedValue = dr["Colony"].ToString();
                txtTelefonoContratante.Text = dr["Phone"].ToString();
                txtCorreoContratante.Text = dr["Email"].ToString();
            }






        }
    }

    protected void btnEnviarOrdenTrabajo_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Person_ID"] != null)
        {

        if (Valida())
        {
            GuardaCliente();

            if (lblidCliente.Text != "0")
            {
                GuardaOrdenTrabajo();
                GuardaDetalleOrdenTrabajo();
                if (ddlOrdenTrabajo.SelectedValue.ToString() == "2" || ddlOrdenTrabajo.SelectedValue.ToString() == "7")
                {
                    GuardaPoliza();

                    if (lblidPoliza.Text != "0")
                    {
                        DatosSql sql = new DatosSql();
                        sql.Ejecutar("sp_SaveRelPolicyPeople", 0, lblidPoliza.Text, 0);
                        GuardaAsegurado();
                        GuardaRelacion(Convert.ToInt32(lblidAsegurado.Text), 1);

                        if (cbEsIgual.Checked == false)
                        {
                            GuardaContratante();
                            GuardaRelacion(Convert.ToInt32(lblidContratante.Text), 2);
                        }

                        String Mensaje = "Orden de Trabajo Guardada";
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
                        Extras ex = new Extras();
                        cUsuarios cu = new cUsuarios(Convert.ToInt32(ddlSolicito.SelectedValue.ToString()));
                        cu.TraeInfoUsuario(0);
                        String fileNamePDF = GenerarPDF();
                       
                        ex.sendMail(cu.Email, "Se ha generado una Nueva Orden de Trabajo", "Nueva Orden de Trabajo", Server.MapPath("~/OrdenesTrabajo/PDF/" + fileNamePDF));
                        ifrPDF.Attributes.Add("src", "PDF/" + fileNamePDF);
                        mvwOrdenesTrabajo.ActiveViewIndex = 2;


                    }

                    else
                    {
                        AbortarOT(Convert.ToInt32(lblOrdenTrabajoID.Text));
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh!\",\"Ah ocurrido un Error no se pudo Generar Orden de Trabajo\", \"error\");", true);
                    }
                }

            }

            
        }
        
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    private void AbortarOT(int OrdenTrabajo)
    {
        DatosSql sql = new DatosSql();
        sql.Ejecutar("sp_LimpiaTodo",OrdenTrabajo);
    }

    private String GenerarPDF()
    {
        byte[] generaPDF = null;

        generaPDF = GenerarPDF(lblOrdenTrabajoID.Text);

        string savePathPDF = Server.MapPath("") + "\\PDF\\";
        string fileNamePDF = "OT" + lblOrdenTrabajoID.Text + ".pdf";
        string pathToCheckPDF = savePathPDF + fileNamePDF;

        if (!Directory.Exists(savePathPDF))
        {
            DirectoryInfo di = Directory.CreateDirectory(savePathPDF);
        }

        // Try to create the directory.



        savePathPDF += fileNamePDF;

        if (!System.IO.File.Exists(pathToCheckPDF))
        {
            System.IO.File.WriteAllBytes(savePathPDF, generaPDF);
        }

        return fileNamePDF;

       
    }


    private void GuardaCliente()
    {
        String Colonia = ddlColoniaAsegurado.SelectedValue.ToString();
        String Nombre = "";

        if (ddlTipoPersonaAsegurado.SelectedValue.ToString() == "1")
        {
            Nombre = txtNombreAsegurado.Text + " " + txtAPAsegurado.Text + " " + txtAMAsegurado.Text;
        }
        else
        {
            Nombre = txtRazonSocialAsegurado.Text;
        }
        cClientes cc = new cClientes(Convert.ToInt32(lblidCliente.Text), Nombre, txtRFCAsegurado.Text, Convert.ToInt32(ddlTipoPersonaAsegurado.SelectedValue.ToString()), txtGiroNegocioAsegurado.Text, txtCalleNumeroAsegurado.Text, Colonia, txtCodigoPostalAsegurado.Text, txtMunicipioAsegurado.Text, txtEstadoAsegurado.Text, 0, 0, txtNombreAsegurado.Text, txtTelefonoAsegurado.Text, txtCorreoAsegurado.Text, "", 1);
        String Mensaje = cc.GuardaCliente(1);
        lblidCliente.Text = cc.ClienteId.ToString();

        if (lblidCliente.Text != "0")
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh!\",\"" + Mensaje + "\", \"error\");", true);
        }

    }

    private void GuardaOrdenTrabajo()
    {
        DatosSql sql = new DatosSql();
        int Asignado = 0;
        int Poliza = 0;
        DataTable tbl = sql.TraerDataTable("sp_SaveWorkOrder",0, ddlOrdenTrabajo.SelectedValue.ToString(), ddlSolicito.SelectedValue.ToString(), Asignado, ddlSubRamo.SelectedValue.ToString(), "PRM-" + DateTime.Now.ToString("yyyyMMdd") + ddlSubRamo.SelectedValue.ToString(), lblidCliente.Text, Poliza, txtInformacionAdicional.Text, Convert.ToInt32(HttpContext.Current.Session["Person_ID"].ToString()));

        if(tbl.Rows.Count>0)
        {
            lblOrdenTrabajoID.Text = tbl.Rows[0]["WorkOrderID"].ToString();
        }
    }

    private void GuardaDetalleOrdenTrabajo()
    {
        DatosSql sql = new DatosSql();
        sql.Ejecutar("sp_SaveDetailWorkOrder",0,lblOrdenTrabajoID.Text,0,"");

        foreach(RepeaterItem rp in rptInfoAdicional.Items )
        {
            Label lbl = rp.FindControl("lblTipo") as Label;
            Label lblID = rp.FindControl("lblID") as Label;
            DropDownList ddl = rp.FindControl("ddlCatalogo") as DropDownList;
            TextBox txt = rp.FindControl("txtInformacion") as TextBox;

            String Valor = "";
            if (lbl.Text == "1")
            {
                Valor = txt.Text;
            }
            else
            {
                Valor = ddl.SelectedItem.Text;
            }

            sql.Ejecutar("sp_SaveDetailWorkOrder", 0, lblOrdenTrabajoID.Text, lblID.Text, Valor);
        }
    }

    private void GuardaPoliza()
    {
        Boolean fileOK = false;
        String path = Server.MapPath("~/Emision/Files/");



        if (fuDocumento.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(fuDocumento.FileName).ToLower();
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
                String Documento = "PRM-"+DateTime.Now.ToString("ddMMyyhhmmss-") + fuDocumento.FileName;
                fuDocumento.SaveAs(path + Documento);

                DatosSql sql = new DatosSql();
                
                DataTable tbl = sql.TraerDataTable("sp_SavePolicy", lblidPoliza.Text, lblOrdenTrabajoID.Text, txtPolizaAnterior.Text, txtNumeroCOtizacion.Text, ddlTipoPoliza.SelectedValue.ToString(), lblidCliente.Text, txtBeneficiarioPreferente.Text, Documento, "", "", ddlCia.SelectedValue.ToString(), DateTime.Now.ToString("dd/MM/yyyy"), Convert.ToDateTime(txtInicioVigencia.Text).ToString("dd/MM/yyyy"), Convert.ToDateTime(txtFinVigencia.Text).ToString("dd/MM/yyyy"), ddlCObertura.SelectedValue.ToString(), ddlFormaPago.SelectedValue.ToString(), "0", "0.0", "0.0", "0.0", "0.0", "0.0", "0.0", 1, 1);
                Mensaje = tbl.Rows[0]["msj"].ToString();
                
                lblidPoliza.Text = tbl.Rows[0]["Policy_ID"].ToString();
               
                if(lblidPoliza.Text == "0")
                {
                    Response.Write(Mensaje);
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"Ha ocurrido un error "+ex.Message.ToString()+"\", \"error\");", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"No es un archivo valido debe ser con extencion .zip\", \"error\");", true);
        }
        
        
       
    }
  
    private void GuardaAsegurado()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_ExistRFC",txtRFCAsegurado.Text);

        if(tbl.Rows.Count>0)
        {
            lblidAsegurado.Text = tbl.Rows[0]["PolicyPeople_ID"].ToString();

            
                String Colonia = ddlColoniaAsegurado.SelectedValue.ToString();
                String Nombre = "";
                String AP = "";
                String AM = "";
                int Genero = 0;
                String FecNacimiento = "01/01/2001";
                
                String CURP = "";

                if (ddlTipoPersonaAsegurado.SelectedValue.ToString() == "1")
                {
                    Nombre = txtNombreAsegurado.Text;
                    AP = txtAPAsegurado.Text;
                    AM = txtAMAsegurado.Text;
                    Genero = Convert.ToInt32(ddlSexoAsegurado.Text);
                FecNacimiento = Convert.ToDateTime(txtFecNacimientoAsegurado.Text).ToString("dd/MM/yyyy");
                    CURP = txtCURPAsegurado.Text;
                }
                else
                {
                    Nombre = txtRazonSocialAsegurado.Text;
                }
                DataTable tbl2 = sql.TraerDataTable("sp_SavePolicyPeople",lblidAsegurado.Text,ddlTipoPersonaAsegurado.SelectedValue,Nombre,AP,AM,txtYOAsegurado.Text,Genero,FecNacimiento,txtRFCAsegurado.Text,CURP,txtGiroNegocioAsegurado.Text,txtEstadoAsegurado.Text,txtMunicipioAsegurado.Text,ddlColoniaAsegurado.SelectedValue,txtCodigoPostalAsegurado.Text,txtCalleNumeroAsegurado.Text,txtTelefonoAsegurado.Text,txtCorreoAsegurado.Text,1);

                if(tbl2.Rows.Count>0)
                {
                    lblidAsegurado.Text = tbl2.Rows[0]["PolicyPeople_ID"].ToString();
                }
          
        }
    }

    private void GuardaContratante()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_ExistRFC", txtRFCContratante.Text);

        if (tbl.Rows.Count > 0)
        {
            lblidContratante.Text = tbl.Rows[0]["PolicyPeople_ID"].ToString();


            String Colonia = ddlColoniaContratante.SelectedValue.ToString();
            String Nombre = "";
            String AP = "";
            String AM = "";
            int Genero = 0;
            String FecNacimiento = "01/01/2001";
            String CURP = "";

            if (ddlTipoPersonaContratante.SelectedValue.ToString() == "1")
            {
                Nombre = txtNombreContratante.Text;
                AP = txtAPContratante.Text;
                AM = txtAMContratante.Text;
                Genero = Convert.ToInt32(ddlSexoContratante.Text);
                FecNacimiento = Convert.ToDateTime(txtFecNacimientoContratante.Text).ToString("dd/MM/yyyy");
                CURP = txtCURPContratante.Text;
            }
            else
            {
                Nombre = txtRazonSocialContratante.Text;
            }
            DataTable tbl2 = sql.TraerDataTable("sp_SavePolicyPeople",lblidContratante.Text, ddlTipoPersonaContratante.SelectedValue, Nombre, AP, AM, txtYOContratante.Text, Genero, FecNacimiento, txtRFCContratante.Text, CURP, txtGiroNegocioContratante.Text, txtEstadoContratante.Text, txtMunicipioContratante.Text, ddlColoniaContratante.SelectedValue, txtCodigoPostalContratante.Text, txtCalleNumeroContratante.Text, txtTelefonoContratante.Text, txtCorreoContratante.Text,1);

            if (tbl2.Rows.Count > 0)
            {
                lblidContratante.Text = tbl2.Rows[0]["PolicyPeople_ID"].ToString();
            }

        }
    }

    private void GuardaRelacion(int PersonaID,int Opc)
    {
        DatosSql sql = new DatosSql();
        sql.Ejecutar("sp_SaveRelPolicyPeople",PersonaID,lblidPoliza.Text,Opc);
    }

    private void TraeOrdenesTrabajo()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrder",0);
        gvOrdenesTrabajo.DataSource = tbl;
        gvOrdenesTrabajo.DataBind();
    }

    private Boolean Valida()
    {
        String Mensaje = "";
        Boolean Valido = true;

        /**Valida Datos del Asegurado**/
        
       if(ddlTipoPersonaAsegurado.SelectedValue == "1")
        {
            if (txtNombreAsegurado.Text != "")
            {
                if (txtAPAsegurado.Text != "")
                {
                    if (txtAMAsegurado.Text != "")
                    {
                        if(txtFecNacimientoAsegurado.Text != "")
                        {
                            Valido = true;
                        }
                        else
                        {
                            Mensaje = "Debe poner la Fecha de Nacimiento del Asegurado";
                            Valido = false;
                        }
                    }
                    else
                    {
                        Mensaje = "Debe poner el Apellido Materno del Asegurado";
                        Valido = false;
                    }
                }
                else
                {
                    Mensaje = "Debe poner el Apellido Paterno del Asegurado";
                    Valido = false;
                }
             }
            else
            {
                Mensaje = "Debe poner el Nombre del Asegurado";
                Valido = false;
            }
        }
       else
        {
            if(txtRazonSocialAsegurado.Text != "")
            {
                Valido = true;
            }
            else
            {
                Mensaje = "Debe poner la Razón Social del Asegurado";
                Valido = false;
            }
        }
      
       if(Valido == true)
        {
            if (txtRFCAsegurado.Text != "")
            {
                if (txtCalleNumeroAsegurado.Text != "")
                {
                    if (txtCodigoPostalAsegurado.Text != "")
                    {
                        if (txtEstadoAsegurado.Text != "" && txtMunicipioAsegurado.Text != "")
                        {
                            Valido = true;
                        }
                        else
                        {
                            Mensaje = "Debe poner el Estado y Municipio del Asegurado";
                            Valido = false;
                        }
                        
                    }
                    else
                    {
                        Mensaje = "Debe poner el Codigo Postal del Asegurado";
                        Valido = false;
                    }
                }
                else
                {
                    Mensaje = "Debe poner la Calle del Asegurado";
                    Valido = false;
                }
               
            }
            else
            {
                Mensaje = "Debe poner el RFC del Asegurado";
                Valido = false;
            }
        }

        /**Valida Datos del Contratante**/

        if (cbEsIgual.Checked == false && Valido == true)
        {
            if (ddlTipoPersonaContratante.SelectedValue == "1")
            {
                if (txtNombreContratante.Text != "")
                {
                    if (txtAPContratante.Text != "")
                    {
                        if (txtAMContratante.Text != "")
                        {
                            if (txtFecNacimientoContratante.Text != "")
                            {
                                Valido = true;
                            }
                            else
                            {
                                Mensaje = "Debe poner la Fecha de Nacimiento del Contratante";
                                Valido = false;
                            }
                        }
                        else
                        {
                            Mensaje = "Debe poner el Apellido Materno del Contratante";
                            Valido = false;
                        }
                    }
                    else
                    {
                        Mensaje = "Debe poner el Apellido Paterno del Contratante";
                        Valido = false;
                    }
                }
                else
                {
                    Mensaje = "Debe poner el Nombre del Contratante";
                    Valido = false;
                }
            }
            else
            {
                if (txtRazonSocialContratante.Text != "")
                {
                    Valido = true;
                }
                else
                {
                    Mensaje = "Debe poner la Razón Social del Contratante";
                    Valido = false;
                }
            }

            if (Valido == true)
            {
                if (txtRFCContratante.Text != "")
                {
                    if (txtCalleNumeroContratante.Text != "")
                    {
                        if (txtCodigoPostalContratante.Text != "")
                        {
                            if (txtEstadoContratante.Text != "" && txtMunicipioContratante.Text != "")
                            {
                                Valido = true;
                            }
                            else
                            {
                                Mensaje = "Debe poner el Estado y Municipio del Contratante";
                                Valido = false;
                            }

                        }
                        else
                        {
                            Mensaje = "Debe poner el Codigo Postal del Contratante";
                            Valido = false;
                        }
                    }
                    else
                    {
                        Mensaje = "Debe poner la Calle del Contratante";
                        Valido = false;
                    }

                }
                else
                {
                    Mensaje = "Debe poner el RFC del Contratante";
                    Valido = false;
                }
            }
        }

        /**Valida Detalle**/

        if(Valido == true)
        {
            foreach (RepeaterItem rp in rptInfoAdicional.Items)
             {
                Label lbl = rp.FindControl("lblTipo") as Label;
                Label lblSeValida = rp.FindControl("lblValida") as Label;

                TextBox txt = rp.FindControl("txtInformacion") as TextBox;

                String Valor = "";
                if ((lbl.Text == "1")&&(lblSeValida.Text.Trim() == "*")&&(Valido == true))
                {
                    if (txt.Text == "")
                    {
                        Mensaje = "Falta de Llenar uno o más campos del Detalle";
                        Valido = false;
                    }
                }



            }
        }

        /**Valida Informacion Requerida**/

        if (Valido == true)
        {
            if (txtNumeroCOtizacion.Text != "")
            {
                Boolean fileOK = false;

                if (fuDocumento.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(fuDocumento.FileName).ToLower();
                    String[] allowedExtensions = { ".zip", ".jpg", ".png", ".gif", ".pdf" };
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    if (txtInicioVigencia.Text != "")
                    {
                        if (txtFinVigencia.Text != "")
                        {
                            Valido = true;
                        }
                        else
                        {
                            Mensaje = "Falta poner un Fin de Vigencia";
                            Valido = false;
                        }
                    }
                    else
                    {
                        Mensaje = "Falta poner un Inicio de Vigencia";
                        Valido = false;
                    }
                }
                else
                {
                    Mensaje = "Documento de COtización no Valido";
                    Valido = false;
                }

            }
            else
            {
                Mensaje = "Falta poner un Número de Cotización";
                Valido = false;
            }
           
        }

        if(Valido == false)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \""+Mensaje+"\", \"error\");", true);
        }

            return Valido;
    }

    protected void gvOrdenesTrabajo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String val = e.CommandArgument.ToString();
        String opc = e.CommandName.ToString();

        switch(opc)
        {
            case "EliminaOT":
                break;
            case "Emitir":
                Extras ex = new Extras();
                Response.Redirect("../Emision/Default.aspx?v=0&oT=" + ex.encriptaB64(val));
                break;
            case "VerOT":
                //TraeInformacion(val);
                mvwOrdenesTrabajo.ActiveViewIndex = 2;
                lblOrdenTrabajoID.Text = val;
                byte[] generaPDF = null;

                generaPDF = GenerarPDF(lblOrdenTrabajoID.Text);

                string savePathPDF = Server.MapPath("") + "\\PDF\\";
                string fileNamePDF = "OT" + lblOrdenTrabajoID.Text + ".pdf";
                string pathToCheckPDF = savePathPDF + fileNamePDF;

                if (!Directory.Exists(savePathPDF))
                {
                    DirectoryInfo di = Directory.CreateDirectory(savePathPDF);
                }

                // Try to create the directory.



                savePathPDF += fileNamePDF;

                if (!System.IO.File.Exists(pathToCheckPDF))
                {
                    System.IO.File.WriteAllBytes(savePathPDF, generaPDF);
                }
                
               

                ifrPDF.Attributes.Add("src", "PDF/OT"+val.ToString()+".pdf");
                
                break;
        }
    }

    private void TraeInformacion(String OrdenTrabajo)
    {
        lblOrdenTrabajoID.Text = OrdenTrabajo;

        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrder",lblOrdenTrabajoID.Text);

        if(tbl.Rows.Count>0)
        {
            DataRow dr = tbl.Rows[0];
            lblidCliente.Text = dr["Client_ID"].ToString();
            lblFolio.Text = dr["Folio"].ToString();
            lblFecha.Text = dr["Registered_Date"].ToString();
            TraeCatalogos();
            ddlOrdenTrabajo.SelectedValue = dr["Type_Work_Order_ID"].ToString();
            ddlRamo.SelectedValue = dr["Father_ID"].ToString();
            TraeSubRamo();
            ddlSubRamo.SelectedValue = dr["Branch_ID"].ToString();
            ddlCOnducto.SelectedValue = dr["Role_ID"].ToString();
            TraeConducto();

            ddlSolicito.SelectedValue = dr["User_ID"].ToString();

            //TraeInformacionPoliza
            DataTable tblPoliza = sql.TraerDataTable("sp_GetPolicyxOT",lblOrdenTrabajoID.Text);
            if(tblPoliza.Rows.Count>0)
            {
                DataRow drPoliza = tblPoliza.Rows[0];
                lblidPoliza.Text = drPoliza["Policy_ID"].ToString();
                txtPolizaAnterior.Text = drPoliza["Previous_Policy"].ToString();
                txtNumeroCOtizacion.Text = drPoliza["Quotation_Number"].ToString();
                ddlTipoPoliza.SelectedValue = drPoliza["Type_Policy"].ToString();
                txtBeneficiarioPreferente.Text = drPoliza["Preferred_Beneficiary"].ToString();
                ddlCia.SelectedValue = drPoliza["Cia_ID"].ToString();
                txtInicioVigencia.Text = Convert.ToDateTime(drPoliza["Start_Term"].ToString()).ToString("dd/MM/yyyy");
                txtFinVigencia.Text = Convert.ToDateTime(drPoliza["End_Term"].ToString()).ToString("dd/MM/yyyy"); ;
                ddlCObertura.SelectedValue = drPoliza["Coverage_ID"].ToString();
                ddlFormaPago.SelectedValue = drPoliza["Way_to_Pay_ID"].ToString();
                

                //TraeInformacionAsegurado
                DataTable tblAsegurado = sql.TraerDataTable("sp_GetPolicyPeople",lblidPoliza.Text,1);
                if(tblAsegurado.Rows.Count>0)
                {
                    txtRFCAsegurado.Text = tblAsegurado.Rows[0]["RFC"].ToString();
                    TraeExistenciaAsegurado();
                }

                //TraeInformacionCLiente
                DataTable tblContratante = sql.TraerDataTable("sp_GetPolicyPeople", lblidPoliza.Text, 2);
                if (tblContratante.Rows.Count > 0)
                {
                    cbEsIgual.Checked = false;
                    pnlContratante.Visible = true;
                    txtRFCContratante.Text = tblContratante.Rows[0]["RFC"].ToString();
                    TraeExistenciaContratante();
                }
            }




            cClientes cc = new cClientes(Convert.ToInt32(lblidCliente.Text));
            


            //TraeDetalleInformacion7
            TraeInfoAdicional();
            DataTable tblDatos = sql.TraerDataTable("sp_GetDetailWorkOrder",lblOrdenTrabajoID.Text);

            foreach (RepeaterItem rp in rptInfoAdicional.Items)
            {
                Label lbl = rp.FindControl("lblTipo") as Label;
                Label lblID = rp.FindControl("lblID") as Label;
                DropDownList ddl = rp.FindControl("ddlCatalogo") as DropDownList;
                TextBox txt = rp.FindControl("txtInformacion") as TextBox;

                String Valor = "";
                foreach (DataRow dr2 in tblDatos.Rows)
                {
                    if(dr2["BranchInfo_ID"].ToString() == lblID.Text)
                    {
                        Valor = dr2["Value"].ToString();
                    }
                }

                    
                if (lbl.Text == "1")
                {
                    txt.Text = Valor;
                }
                else
                {
                   ddl.SelectedValue = Valor;
                }

                
            }

           

            txtInformacionAdicional.Text = dr["Description"].ToString();
        }
    }

    protected void ddlTipoPersonaAsegurado_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlTipoPersonaAsegurado.SelectedValue.ToString() == "1")
        {
            mvwDatosAsegurado.ActiveViewIndex = 0;
            pnlPFAsegurado.Visible = true;
        }
        else
        {
            mvwDatosAsegurado.ActiveViewIndex = 1;
            pnlPFAsegurado.Visible = false;
        }
    }

    protected void txtFecNacimiento_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtRFCAsegurado.Text = TraeRFCPersona(txtNombreAsegurado.Text, txtAPAsegurado.Text, txtAMAsegurado.Text, Convert.ToDateTime(txtFecNacimientoAsegurado.Text)).Trim();
        }
        catch(Exception ex)
        {

        }
    }

    protected void txtCodigoPostalAsegurado_TextChanged(object sender, EventArgs e)
    {
        traeEdoMunColXCPAsegurado();
    }

    protected void cbEsIgual_CheckedChanged(object sender, EventArgs e)
    {
        pnlContratante.Visible = false;
        if(cbEsIgual.Checked == false)
        {
            pnlContratante.Visible = true;
        }
    }

    protected void txtCodigoPostalContratante_TextChanged(object sender, EventArgs e)
    {
        traeEdoMunColXCPContratante();
    }

    protected void txtFecNacimientoContratante_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtRFCContratante.Text = TraeRFCPersona(txtNombreContratante.Text, txtAPContratante.Text, txtAMContratante.Text, Convert.ToDateTime(txtFecNacimientoContratante.Text)).Trim();
        }
        catch (Exception ex)
        {

        }
    }

    protected void ddlTipoPersonaContratante_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTipoPersonaContratante.SelectedValue.ToString() == "1")
        {
            mvwDatosContratante.ActiveViewIndex = 0;
            pnlPFContratante.Visible = true;
        }
        else
        {
            mvwDatosContratante.ActiveViewIndex = 1;
            pnlPFContratante.Visible = false;
        }
    }





    protected void txtRFCAsegurado_TextChanged(object sender, EventArgs e)
    {
        TraeExistenciaAsegurado();
    }

    protected void txtRFCContratante_TextChanged(object sender, EventArgs e)
    {
        TraeExistenciaContratante();
    }

    protected void txtInicioVigencia_TextChanged(object sender, EventArgs e)
    {
        txtFinVigencia.Text = Convert.ToDateTime(txtInicioVigencia.Text).AddYears(1).ToString("dd/MM/yyyy");
        txtInicioVigencia.Focus();
    }

    static public void Download(string patch)
    {
        System.IO.FileInfo toDownload =
                   new System.IO.FileInfo(HttpContext.Current.Server.MapPath(patch));

        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.AddHeader("Content-Disposition",
                   "attachment; filename=" + toDownload.Name);
        HttpContext.Current.Response.AddHeader("Content-Length",
                   toDownload.Length.ToString());
        HttpContext.Current.Response.ContentType = "application/octet-stream";
        HttpContext.Current.Response.WriteFile(patch);
        HttpContext.Current.Response.End();
    }

    private byte[] GenerarPDF(String idProyecto)
    {
        String oldFile;

        oldFile = Server.MapPath("") + "\\PDF\\OT_Template.pdf";

       

        if (File.Exists(Server.MapPath("") + "\\PDF\\OT" + idProyecto + ".pdf"))
        {
            File.Delete(Server.MapPath("") + "\\PDF\\OT" + idProyecto + ".pdf");
        }

        DatosSql sql = new DatosSql();


        var output = new MemoryStream();


        PdfReader reader = new PdfReader(oldFile);


        var stamper = new PdfStamper(reader, output);


        PdfContentByte pdfContentByte = stamper.GetOverContent(1);

        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrder", lblOrdenTrabajoID.Text);

        if (tbl.Rows.Count > 0)
        {
            DataRow dr = tbl.Rows[0];
            stamper.AcroFields.SetField("txtFolio", dr["Folio"].ToString());
            stamper.AcroFields.SetField("txtFecha", Convert.ToDateTime(dr["Registered_Date"].ToString()).ToString("dd/MM/yyyy"));
            stamper.AcroFields.SetField("txtTipoOrden", dr["Type_Work_Order"].ToString());
            stamper.AcroFields.SetField("txtSubRamo", dr["Branch"].ToString());
            stamper.AcroFields.SetField("txtRamo", dr["Papa"].ToString());
            stamper.AcroFields.SetField("txtConducto", "ASESOR");
            stamper.AcroFields.SetField("txtSolicito", dr["Name_RS"].ToString()+" "+ dr["First_Name"].ToString()+" "+ dr["Second_Name"].ToString());

            DataTable tblAdicional = sql.TraerDataTable("sp_GetBranchInfo",lblOrdenTrabajoID.Text);

            foreach(DataRow dr2 in tblAdicional.Rows)
            {
                stamper.AcroFields.SetField(dr2["PDF"].ToString(), dr2["Value"].ToString());
            }

            //TraeInformacionPoliza
            DataTable tblPoliza = sql.TraerDataTable("sp_GetPolicyxOT", lblOrdenTrabajoID.Text);
            if (tblPoliza.Rows.Count > 0)
            {
                DataRow drPoliza = tblPoliza.Rows[0];

                stamper.AcroFields.SetField("txtPolizaAnterior", drPoliza["Previous_Policy"].ToString());
                stamper.AcroFields.SetField("txtNumeroCotizacion", drPoliza["Quotation_Number"].ToString());
                stamper.AcroFields.SetField("txtFinVig", Convert.ToDateTime(drPoliza["End_Term"].ToString()).ToString("dd/MM/yyyy"));
                stamper.AcroFields.SetField("txtCobertura", drPoliza["Coverage"].ToString());
                stamper.AcroFields.SetField("txtFormaPago", drPoliza["WaytoPay"].ToString());
                stamper.AcroFields.SetField("txtCia", drPoliza["Cia"].ToString());
                stamper.AcroFields.SetField("txtInicioVig", Convert.ToDateTime(drPoliza["Start_Term"].ToString()).ToString("dd/MM/yyyy"));
                stamper.AcroFields.SetField("txtTipoPoliza", drPoliza["Type_Policy"].ToString()=="1"?"INDIVIDUAL":"FLOTILLA");
                stamper.AcroFields.SetField("txtBeneficiario", drPoliza["Preferred_Beneficiary"].ToString());
                
                //TraeInformacionAsegurado
                DataTable tblAsegurado = sql.TraerDataTable("sp_GetPolicyPeople", drPoliza["Policy_ID"].ToString(), 1);
                if (tblAsegurado.Rows.Count > 0)
                {
                    DataRow drAsegurado = tblAsegurado.Rows[0];
                    stamper.AcroFields.SetField("txtTipoPersona", drAsegurado["TypePerson_ID"].ToString()=="1"?"PERSONA FÍSICA":"PERSONA MORAL");
                    
                    stamper.AcroFields.SetField("txtYo", drAsegurado["Y/O"].ToString());
                    stamper.AcroFields.SetField("txtFecNacimiento", Convert.ToDateTime(drAsegurado["BirthDate"].ToString()).ToString("dd/MM/yyyy"));
                    stamper.AcroFields.SetField("txtRFC", drAsegurado["RFC"].ToString());
                    stamper.AcroFields.SetField("txtCalleNumero", drAsegurado["Address"].ToString());
                    stamper.AcroFields.SetField("txtColonia", drAsegurado["Colony"].ToString());
                    stamper.AcroFields.SetField("txtMunicipio", drAsegurado["Municipality"].ToString());
                    stamper.AcroFields.SetField("txtNombre", drAsegurado["First_LastName"].ToString()+" "+ drAsegurado["Second_LastName"].ToString()+" " +  drAsegurado["Name"].ToString());
                   
                    stamper.AcroFields.SetField("txtSexo", drAsegurado["Genere_ID"].ToString() == "0" ? "NO APLICA" : (drAsegurado["Genere_ID"].ToString() == "1" ? "MASCULINO" : "FEMENINO"));
                    stamper.AcroFields.SetField("txtCURP", drAsegurado["CURP"].ToString());
                    stamper.AcroFields.SetField("txtGiro", drAsegurado["Business"].ToString());
                    stamper.AcroFields.SetField("txtCodigoPostal", drAsegurado["ZIP"].ToString());
                    stamper.AcroFields.SetField("txtEstado", drAsegurado["State"].ToString());
                    stamper.AcroFields.SetField("txtTelefono", drAsegurado["Phone"].ToString());
                    stamper.AcroFields.SetField("txtCorreo", drAsegurado["Email"].ToString());

                }

                //TraeInformacionCLiente
                DataTable tblContratante = sql.TraerDataTable("sp_GetPolicyPeople", drPoliza["Policy_ID"].ToString(), 2);
                if (tblContratante.Rows.Count > 0)
                {
                    DataRow drContratante = tblContratante .Rows[0];

                    stamper.AcroFields.SetField("txtTipoPersona2", drContratante["TypePerson_ID"].ToString() == "1" ? "PERSONA FÍSICA" : "PERSONA MORAL");

                    stamper.AcroFields.SetField("txtYo2", drContratante["Y/O"].ToString());
                    stamper.AcroFields.SetField("txtFecNacimiento2", Convert.ToDateTime(drContratante["BirthDate"].ToString()).ToString("dd/MM/yyyy"));
                    stamper.AcroFields.SetField("txtRFC2", drContratante["RFC"].ToString());
                    stamper.AcroFields.SetField("txtCalleNumero2", drContratante["Address"].ToString());
                    stamper.AcroFields.SetField("txtColonia2", drContratante["Colony"].ToString());
                    stamper.AcroFields.SetField("txtMunicipio2", drContratante["Municipality"].ToString());
                    stamper.AcroFields.SetField("txtNombre2", drContratante["First_LastName"].ToString() + " " + drContratante["Second_LastName"].ToString() + " " + drContratante["Name"].ToString());
                    
                    stamper.AcroFields.SetField("txtSexo2", drContratante["Genere_ID"].ToString()=="0"?"NO APLICA": (drContratante["Genere_ID"].ToString() == "1"?"MASCULINO":"FEMENINO"));
                    stamper.AcroFields.SetField("txtCURP2", drContratante["CURP"].ToString());
                    stamper.AcroFields.SetField("txtGiro2", drContratante["Business"].ToString());
                    stamper.AcroFields.SetField("txtCodigoPostal2", drContratante["ZIP"].ToString());
                    stamper.AcroFields.SetField("txtEstado2", drContratante["State"].ToString());
                    stamper.AcroFields.SetField("txtTelefono2", drContratante["Phone"].ToString());
                    stamper.AcroFields.SetField("txtCorreo2", drContratante["Email"].ToString());


                }
                else
                {
                    DataRow drAsegurado = tblAsegurado.Rows[0];
                    stamper.AcroFields.SetField("txtTipoPersona2", drAsegurado["TypePerson_ID"].ToString() == "1" ? "PERSONA FÍSICA" : "PERSONA MORAL");

                    stamper.AcroFields.SetField("txtYo2", drAsegurado["Y/O"].ToString());
                    stamper.AcroFields.SetField("txtFecNacimiento2", Convert.ToDateTime(drAsegurado["BirthDate"].ToString()).ToString("dd/MM/yyyy"));
                    stamper.AcroFields.SetField("txtRFC2", drAsegurado["RFC"].ToString());
                    stamper.AcroFields.SetField("txtCalleNumero2", drAsegurado["Address"].ToString());
                    stamper.AcroFields.SetField("txtColonia2", drAsegurado["Colony"].ToString());
                    stamper.AcroFields.SetField("txtMunicipio2", drAsegurado["Municipality"].ToString());
                    stamper.AcroFields.SetField("txtNombre2", drAsegurado["First_LastName"].ToString() + " " + drAsegurado["Second_LastName"].ToString() + " " + drAsegurado["Name"].ToString());

                    stamper.AcroFields.SetField("txtSexo2", drAsegurado["Genere_ID"].ToString() == "0" ? "NO APLICA" : (drAsegurado["Genere_ID"].ToString() == "1" ? "MASCULINO" : "FEMENINO"));
                    stamper.AcroFields.SetField("txtCURP2", drAsegurado["CURP"].ToString());
                    stamper.AcroFields.SetField("txtGiro2", drAsegurado["Business"].ToString());
                    stamper.AcroFields.SetField("txtCodigoPostal2", drAsegurado["ZIP"].ToString());
                    stamper.AcroFields.SetField("txtEstado2", drAsegurado["State"].ToString());
                    stamper.AcroFields.SetField("txtTelefono2", drAsegurado["Phone"].ToString());
                    stamper.AcroFields.SetField("txtCorreo2", drAsegurado["Email"].ToString());
                }
            }

            

       
           

            stamper.AcroFields.SetField("txtInfoAdicional", dr["Description"].ToString());
        }



        stamper.FormFlattening = true;
        stamper.Close();
        reader.Close();
        return output.ToArray();
    }



    protected void btnEmitir_Click(object sender, EventArgs e)
    {
        Extras ex = new Extras();
        Response.Redirect("../Emision/Default.aspx?v=0&oT=" + ex.encriptaB64(lblOrdenTrabajoID.Text));
    }
}