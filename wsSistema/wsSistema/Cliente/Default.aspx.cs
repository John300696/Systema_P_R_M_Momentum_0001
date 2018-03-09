using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cliente_Default : System.Web.UI.Page
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

                        mvwCliente.ActiveViewIndex = 0;
                        lblidCliente.Text = "0";
                        break;

                    case '1':

                        mvwCliente.ActiveViewIndex = 1;
                        TraeClientes();

                        break;
                }
            }
        }
    }

    private void TraeClientes()
    {
        DatosSql sql = new DatosSql();
        cClientes CC = new cClientes();
        CC.ClienteId = 0;
        gvClientes.DataSource = CC.TraeClientes() ;
        gvClientes.DataBind();
    }

    protected void btnGuardarInformacion_Click(object sender, EventArgs e)
    {
        cClientes cc = new cClientes(Convert.ToInt32(lblidCliente.Text), txtNombre.Text, txtRFC.Text, Convert.ToInt32(ddlTipoPersona.SelectedValue.ToString()), txtGiroNegocio.Text, txtCalleNumero.Text, ddlColonia.SelectedItem.Text, txtCP.Text, txtMunicipio.Text, txtEntidadFederativa.Text,0,0, txtNombreContacto.Text, txtTelefonoCOntacto.Text, txtCorreoCOntacto.Text, txtDescripcion.Text, 1);
        String Mensaje = cc.GuardaCliente(1);
        lblidCliente.Text = cc.ClienteId.ToString();

        Response.Write("<script>alert('" + Mensaje + "')</script>");
    }

    protected void lnkFlotillas_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 0;
        TraeFlotillas();
    }

    protected void lnkPolizas_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 1;
    }

    protected void lnkSiniestros_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 2;
    }

    protected void btnGuardarFlotilla_Click(object sender, EventArgs e)
    {
        cClientes cc = new cClientes();
        cc.ClienteId = Convert.ToInt32(lblidCliente.Text);

        cc.GuardaFlotillas(0, txtNombreFlotilla.Text,1);

        TraeFlotillas();
    }

    private void TraeFlotillas()
    {
        cClientes cc = new cClientes();
        cc.ClienteId = Convert.ToInt32(lblidCliente.Text);

        DataTable tbl = cc.TraeFlotillas();

        gvFlotillas.DataSource = tbl;
        gvFlotillas.DataBind();
    }
    protected void gvFlotillas_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String Valor = e.CommandArgument.ToString();
        String Opc = e.CommandName.ToString();

        switch (Opc)
        {
            case "EliminarFlotilla":
                cClientes cc = new cClientes();
                cc.ClienteId = Convert.ToInt32(lblidCliente.Text);

                cc.GuardaFlotillas(Convert.ToInt32(Valor), "",0);
                TraeFlotillas();

                break;
        }
    }

    protected void txtCP_TextChanged(object sender, EventArgs e)
    {
        traeEdoMunColXCP();
    }

    private void traeEdoMunColXCP()
    {
        String cp = txtCP.Text;

        wsCodigosPostales.ServiceSoap wsCod = new wsCodigosPostales.ServiceSoapClient();

        cp = ("00000" + cp).Substring(cp.Length, 5);

        try
        {
            DataTable tblCP = wsCod.TblColonias(cp);

            txtEntidadFederativa.Text = tblCP.Rows[0]["Estado"].ToString();
            txtMunicipio.Text = tblCP.Rows[0]["Municipio"].ToString();


            ddlColonia.DataSource = tblCP;
            ddlColonia.DataTextField = "Colonia";
            ddlColonia.DataValueField = "Colonia";
            ddlColonia.DataBind();

            txtCP.Text = cp;
        }
        catch (Exception exx)
        {

        }
    }

    protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String opc = e.CommandName.ToString();
        String val = e.CommandArgument.ToString();

        switch(opc)
        {
            case "EliminaCliente":

                break;
            case "VerCliente":
                mvwCliente.ActiveViewIndex = 0;
                TraeCliente(Convert.ToInt32(val));
                break;
        }
    }

    private void TraeCliente(int Cliente_ID)
    {
        cClientes cc = new cClientes(Cliente_ID);

        lblidCliente.Text = Cliente_ID.ToString();
        txtNombre.Text = cc.NombreRS;
        txtRFC.Text = cc.RFC;
        ddlTipoPersona.SelectedValue = cc.idTipoPersona.ToString();
        txtGiroNegocio.Text = cc.GiroNegocio;
        txtCalleNumero.Text = cc.CalleNumero;
        txtCP.Text = cc.CodigoPostal;
        traeEdoMunColXCP();
        ddlColonia.SelectedValue = cc.Colonia;
        txtNombreContacto.Text = cc.NombreContacto;
        txtTelefonoCOntacto.Text = cc.TelefonoContacto;
        txtCorreoCOntacto.Text = cc.CorreoContacto;
        txtDescripcion.Text = cc.Observaciones;

        TraeFlotillas();


    }
}