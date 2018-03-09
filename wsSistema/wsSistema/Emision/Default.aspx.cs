using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Emision_Default : System.Web.UI.Page
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

                        mvwPolizas.ActiveViewIndex = 0;
                        lblidCLiente.Text = "0";
                        TraeCatalogos();

                        if (Request.QueryString["oT"] != null)
                        {
                            Extras ex = new Extras();
                            int OrdenTrabajo = Convert.ToInt32(ex.decriptaB64(Request.QueryString["oT"].ToString()));
                            TraeInformacion(OrdenTrabajo.ToString());
                            TraeRecibos();
                        }

                       
                        break;

                    case '1':

                        mvwPolizas.ActiveViewIndex = 1;
                        //TraeOrdenesTrabajo();
                        

                        break;
                }
            }
        }
    }

    private void TraeOrdenesTrabajo()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPolicy", 0);
        gvPolizas.DataSource = tbl;
        gvPolizas.DataBind();
    }

    protected void gvOrdenesTrabajo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String val = e.CommandArgument.ToString();
        String opc = e.CommandName.ToString();

        switch (opc)
        {
            case "VerPoliza":
                lblidOrdenTrabajoDetalle.Text = val;
                mvwPolizas.ActiveViewIndex = 2;

                TraeInformacionPoliza();
                mvwInfoAdicional.ActiveViewIndex = 0;


                break; 
            case "Emitir":
                Extras ex = new Extras();
                Response.Redirect("../Emision/Default.aspx?v=0&oT=" + ex.encriptaB64(val));
                break;
        }
           
    }


    private void TraeCatalogos()
    {
        Extras ex = new Extras();

        ddlCia.DataSource = ex.TraeCatalogos(2, 0);
        ddlCia.DataValueField = "Cia_ID";
        ddlCia.DataTextField = "Cia";
        ddlCia.DataBind();

        ddlRamo.DataSource = ex.TraeCatalogos(18, 0);
        ddlRamo.DataValueField = "Branch_ID";
        ddlRamo.DataTextField = "Branch";
        ddlRamo.DataBind();

        TraeConducto();
        TraeSubRamo();


        ddlCObertura.DataSource = ex.TraeCatalogos(5, 0);
        ddlCObertura.DataValueField = "Coverage_ID";
        ddlCObertura.DataTextField = "Coverage";
        ddlCObertura.DataBind();

        ddlFormaPago.DataSource = ex.TraeCatalogos(13, 0);
        ddlFormaPago.DataValueField = "WayToPay_ID";
        ddlFormaPago.DataTextField = "WayToPay";
        ddlFormaPago.DataBind();

        ddlMoneda.DataSource = ex.TraeCatalogos(3, 0);
        ddlMoneda.DataValueField = "Coin_ID";
        ddlMoneda.DataTextField = "Coin";
        ddlMoneda.DataBind();

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
        rptInfoAdicional.DataSource = ex.TraeCatalogos(19, Convert.ToInt32(ddlSubRamo.SelectedValue.ToString()));
        rptInfoAdicional.DataBind();
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

    private void TraeInformacion(String OrdenTrabajo)
    {
        lblOrdenTrabajoID.Text = OrdenTrabajo;

        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrder", lblOrdenTrabajoID.Text);

        if (tbl.Rows.Count > 0)
        {
            DataRow dr = tbl.Rows[0];
            lblidCLiente.Text = dr["Client_ID"].ToString();
            
            TraeCatalogos();
           

            ddlRamo.SelectedValue = dr["Father_ID"].ToString();
            TraeSubRamo();
            ddlSubRamo.SelectedValue = dr["Branch_ID"].ToString();
            ddlCOnducto.SelectedValue = dr["Role_ID"].ToString();
            TraeConducto();

            ddlSolicito.SelectedValue = dr["User_ID"].ToString();

            //TraeInformacionPoliza
            DataTable tblPoliza = sql.TraerDataTable("sp_GetPolicyxOT", lblOrdenTrabajoID.Text);
            if (tblPoliza.Rows.Count > 0)
            {
                DataRow drPoliza = tblPoliza.Rows[0];
                lblidPoliza.Text = drPoliza["Policy_ID"].ToString();
                txtPolizaAnterior.Text = drPoliza["Previous_Policy"].ToString();
                txtNumeroCOtizacion.Text = drPoliza["Quotation_Number"].ToString();
                ddlTipoPoliza.SelectedValue = drPoliza["Type_Policy"].ToString();
                txtBeneficiarioPreferente.Text = drPoliza["Preferred_Beneficiary"].ToString();
                ddlCia.SelectedValue = drPoliza["Cia_ID"].ToString();
                txtInicioVigencia.Text = drPoliza["Start_Term"].ToString();
                txtFinVigencia.Text = drPoliza["End_Term"].ToString() ;
                ddlCObertura.SelectedValue = drPoliza["Coverage_ID"].ToString();
                ddlFormaPago.SelectedValue = drPoliza["Way_to_Pay_ID"].ToString();
                lblDocumentoCotizacion.Text = drPoliza["Quotation_Document"].ToString();
                txtNumPoliza.Text = drPoliza["Number_Policy"].ToString();
                txtInciso.Text = drPoliza["Subsection_Policy"].ToString();
                txtFecEmision.Text = drPoliza["Date_Expedition"].ToString();
                txtDescuento.Text =  drPoliza["Descuento"].ToString();
                txtPrimaNeta.Text = drPoliza["Subtotal"].ToString();
                txtFinanciamiento.Text = drPoliza["Financing"].ToString();
                txtDerrechoPoliza.Text = drPoliza["Policy_Right"].ToString();
                txtImpuestos.Text = drPoliza["Taxes"].ToString();
                txtPrimaTotal.Text = drPoliza["Total"].ToString(); ddlMoneda.SelectedValue = drPoliza["Coin_ID"].ToString();
                ddlStatusPoliza.SelectedValue = drPoliza["Status"].ToString();

                //TraeInformacionAsegurado
                DataTable tblAsegurado = sql.TraerDataTable("sp_GetPolicyPeople", lblidPoliza.Text, 1);
                if (tblAsegurado.Rows.Count > 0)
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




            cClientes cc = new cClientes(Convert.ToInt32(lblidCLiente.Text));



            //TraeDetalleInformacion7
            TraeInfoAdicional();
            DataTable tblDatos = sql.TraerDataTable("sp_GetDetailWorkOrder", lblOrdenTrabajoID.Text);

            foreach (RepeaterItem rp in rptInfoAdicional.Items)
            {
                Label lbl = rp.FindControl("lblTipo") as Label;
                Label lblID = rp.FindControl("lblID") as Label;
                DropDownList ddl = rp.FindControl("ddlCatalogo") as DropDownList;
                TextBox txt = rp.FindControl("txtInformacion") as TextBox;

                String Valor = "";
                foreach (DataRow dr2 in tblDatos.Rows)
                {
                    if (dr2["BranchInfo_ID"].ToString() == lblID.Text)
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
                    ddl.SelectedItem.Text = Valor;
                }


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

            if (lblidAsegurado.Text != "0")
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

                    txtRazonSocialAsegurado.Text = Nombre;
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


    
    protected void btnGuardarPoliza_Click(object sender, EventArgs e)
    {
        GuardaPoliza();
       
    }

    private void GuardaPoliza()
    {
        Boolean fileOK = false;
        

        String Mensaje = "";

        
                String Documento = lblDocumentoCotizacion.Text;

                DatosSql sql = new DatosSql();

                DataTable tbl = sql.TraerDataTable("sp_SavePolicy", lblidPoliza.Text, lblOrdenTrabajoID.Text, txtPolizaAnterior.Text, txtNumeroCOtizacion.Text, ddlTipoPoliza.SelectedValue.ToString(), lblidCLiente.Text, txtBeneficiarioPreferente.Text, Documento, txtNumPoliza.Text, txtInciso.Text, ddlCia.SelectedValue.ToString(), Convert.ToDateTime(txtFecEmision.Text), Convert.ToDateTime(txtInicioVigencia.Text), Convert.ToDateTime(txtFinVigencia.Text), ddlCObertura.SelectedValue.ToString(), ddlFormaPago.SelectedValue.ToString(), ddlMoneda.SelectedValue.ToString(), txtDescuento.Text.Replace("$","").Replace(",","").Replace(" ",""), txtPrimaNeta.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), txtPrimaTotal.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), txtPrimaTotal.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), txtFinanciamiento.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), txtDerrechoPoliza.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), 2, 1);
                Mensaje = tbl.Rows[0]["msj"].ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
                lblidPoliza.Text = tbl.Rows[0]["Policy_ID"].ToString();



            



    }






    protected void lnkCOberturas_Click(object sender, EventArgs e)
    {

    }

    protected void lnkDocumentos_Click(object sender, EventArgs e)
    {
        mvwInfoAdicional.ActiveViewIndex = 1;
        TraeDocumentos();
    }

    private void TraeDocumentos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetDocumentPolicy", lblidPoliza.Text);
        gvDocument.DataSource = tbl;
        gvDocument.DataBind();

    }

    protected void lnkRecibos_Click(object sender, EventArgs e)
    {
        mvwInfoAdicional.ActiveViewIndex = 2;
    }

    protected void txtCP_TextChanged(object sender, EventArgs e)
    {

    }

    
    
   
    protected void ddlConducto_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeConducto();
    }

   

    protected void btnGUardarRecibo_Click(object sender, EventArgs e)
    {
        Boolean fileOK = false;
        String path = Server.MapPath("~/Emision/Receipts/");

        if (fuDocumentoRecibo.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(fuDocumentoRecibo.FileName).ToLower();
            String[] allowedExtensions = { ".jpg", ".png", ".gif",".pdf" };
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
            try
            {
                fuDocumentoRecibo.SaveAs(path + fuDocumentoRecibo.FileName);
                DatosSql sql = new DatosSql();
                DataTable tbl = sql.TraerDataTable("sp_SavePolicyReceipts", lblReciboID.Text, lblidPoliza.Text, txtReciboNo.Text, txtFecEMisionRecibo.Text, txtPeriodoDesde.Text, txtHoraDesde.Text, txtPeriodoHasta.Text, txtHoraHasta.Text, fuDocumentoRecibo.FileName,txtImportePagar.Text.Replace("$", "").Replace(",", "").Replace(" ", ""), txtFecLimitePago.Text,0);

                if(tbl.Rows.Count>0)
                {
                    String Mensaje = tbl.Rows[0]["msj"].ToString();
                    TraeRecibos();
                    if (Mensaje == "Recibo agregado a la Poliza")
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh!\",\"" + Mensaje + "\", \"error\");", true);

                    
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"Ha ocurrido un error D:\", \"error\");", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"No es un archivo valido debe ser una imagen\", \"error\");", true);
        }
    
    }

    private void TraeRecibos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPolicyReceipts",0,lblidPoliza.Text);
        gvRecibos.DataSource = tbl;
        gvRecibos.DataBind();
    }

    protected void ddlNombreConducto_SelectedIndexChanged(object sender, EventArgs e)
    {
       /** cUsuarios cu = new cUsuarios(Convert.ToInt32(ddlNombreConducto.SelectedValue.ToString()));
        cu.TraeInfoUsuario(0);
        txtCorreoCOntacto.Text = cu.Email;**/
    }

    protected void btmGuardaDocumentos_Click(object sender, EventArgs e)
    {

        DatosSql sql = new DatosSql();
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
                fuDocumento.SaveAs(path +"Doc-"+ DateTime.Now.ToString("ddMMyyhhmmss") + fuDocumento.FileName);


                sql.Ejecutar("sp_SavePolicyDocuments", 0, lblidPoliza.Text,"Doc-"+ DateTime.Now.ToString("ddMMyyhhmmss") + fuDocumento.FileName, 1, 1, 1);


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
        TraeDocumentos();
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

    protected void lnlPoliza_Click(object sender, EventArgs e)
    {
        TraeInformacionPoliza();
        mvwInfoPoliza.ActiveViewIndex = 0;
    }

    private void TraeInformacionPoliza()
    {
        
        
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrder", lblidOrdenTrabajoDetalle.Text);

        if (tbl.Rows.Count > 0)
        {
            DataRow dr = tbl.Rows[0];
            lblidCLiente.Text = dr["Client_ID"].ToString();
            txtCorreoEnviar.Text = dr["Contact_Email"].ToString();

            DataTable tblPoliza = sql.TraerDataTable("sp_GetPolicyxOT", lblidOrdenTrabajoDetalle.Text);

            if (tblPoliza.Rows.Count > 0)
            {
                DataRow drPoliza = tblPoliza.Rows[0];
                lblidPolizaDetalle.Text = drPoliza["Policy_ID"].ToString();
                
                lblNumeroPoliza.Text = drPoliza["Number_Policy"].ToString();
                lblInciso.Text = drPoliza["Subsection_Policy"].ToString();

                
                DataTable tblDoctos = sql.TraerDataTable("sp_GetDocumentPolicy", lblidPolizaDetalle.Text);

                if(tblDoctos.Rows.Count>0)
                {
                    ifrPDF.Attributes.Add("src", "Files/" + tblDoctos.Rows[0]["Name_Document"].ToString());
                }

            }
        }
    }

   
    protected void lnkRecibosPoliza_Click(object sender, EventArgs e)
    {
        mvwInfoPoliza.ActiveViewIndex = 1;
        TraeDetalleRecibos();
    }

    private void TraeDetalleRecibos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPolicyReceipts", 0, lblidPolizaDetalle.Text);
        gvRecibosDetalle.DataSource = tbl;
        gvRecibosDetalle.DataBind();
    }

    protected void lnkMovimientosPoliza_Click(object sender, EventArgs e)
    {

    }

    protected void lnkEnviarPolizaMail_Click(object sender, EventArgs e)
    {

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("[sp_SearchPolicy]",ddlBusqueda.SelectedValue.ToString(),txtBusqueda.Text);

        gvPolizas.DataSource = tbl;
        gvPolizas.DataBind();
    }
}