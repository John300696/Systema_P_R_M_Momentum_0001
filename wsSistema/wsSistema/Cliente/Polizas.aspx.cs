using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cliente_Polizas : System.Web.UI.Page
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
                        lblidPoliza.Text = "0";
                        TraeClientes();
                        TraeFlotillas(Convert.ToInt32(ddlCliente.SelectedValue.ToString()));

                        break;

                    case '1':

                        mvwPolizas.ActiveViewIndex = 1;
                        TraeClientes();

                        break;
                }
            }
        }
    }

    private void TraeClientes()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetClient", 0);
        ddlCliente.DataSource = tbl;
        ddlCliente.DataTextField = "Name_RS";
        ddlCliente.DataValueField = "Client_ID";
        ddlCliente.DataBind();
    }

    private void TraeFlotillas(int Client_ID)
    {
        cClientes cc = new cClientes();
        cc.ClienteId = Client_ID;

        DataTable tbl = cc.TraeFlotillas();

        ddlFlotilla.DataSource = tbl;
        ddlFlotilla.DataTextField = "Subclient_Name";
        ddlFlotilla.DataValueField = "Subclient_ID";
        ddlFlotilla.DataBind();
    }

    protected void ddlCliente_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeFlotillas(Convert.ToInt32(ddlCliente.SelectedValue.ToString()));
    }


    protected void lnkDocumentacion_Click(object sender, EventArgs e)
    {
        mvwPoizasDetalle.ActiveViewIndex = 0;
        TraeDocumentos();
    }

    private void TraeDocumentos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetDocumentPolicy", lblidPoliza.Text);
        gvDocument.DataSource = tbl;
        gvDocument.DataBind();

    }

    protected void btnGuardarPoliza_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SavePolicy", lblidPoliza.Text, ddlFlotilla.SelectedValue.ToString(), txtNumPoliza.Text, txtInciso.Text, txtVIN.Text, txtNumMotor.Text, txtNumPlaca.Text, txtClaveCia.Text, txtMarca.Text, txtModelo.Text, txtDescripcionVehiculo.Text, ddlTipoServicio.SelectedValue.ToString(), ddlTipoUso.SelectedValue.ToString(), ddlTipoCarga.SelectedValue.ToString(), ddlTipoVehiculo.SelectedValue.ToString(), ddlCia.SelectedValue.ToString(), txtFecEmision.Text, txtInicioVigencia.Text, txtFinVigencia.Text, ddlCObertura.SelectedValue.ToString(), ddlFormaPago.SelectedValue.ToString(), ddlMoneda.SelectedValue.ToString(), txtPrimaNeta.Text, txtImpuestos.Text, txtPrimaTotal.Text, txtFinanciamiento.Text, txtDerrechoPoliza.Text, 1, 1);
        String Mensaje = tbl.Rows[0]["msj"].ToString();
        Response.Write("<script>alert('" + Mensaje + "')</script>");
        lblidPoliza.Text = tbl.Rows[0]["Policy_ID"].ToString();
    }

    protected void gvDocument_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btmGuardaDocumentos_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        Boolean fileOK = false;
        String path = Server.MapPath("~/Cliente/media/");


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
                fuDocumento.SaveAs(path + DateTime.Now.ToString("ddMMyyhhmmss") + fuDocumento.FileName);


                sql.Ejecutar("sp_SavePolicyDocuments", 0, lblidPoliza.Text, DateTime.Now.ToString("ddMMyyhhmmss") + fuDocumento.FileName, 1, 1, 1);


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

}