using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using wsCodigosPostales;

public partial class Siniestros_Client : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlAgregarNuevaFlotilla.Visible = false;

            if (Request.QueryString["v"] != null)
            {
                switch (Convert.ToChar(Request.QueryString["v"].ToString()))
                {

                    case '0':

                        mvwClientes.ActiveViewIndex = 0;
                        lblidCliente.Text = "0";
                        break;

                    case '1':

                        mvwClientes.ActiveViewIndex = 1;
                        TraeClientes();

                        break;
                }
            }
        }
    }

    protected void btnAgregarCliente_Click(object sender, EventArgs e)
    {
        /** DatosSql sql = new DatosSql();
         DataTable tbl = sql.TraerDataTable("sp_GuardaCliente",0,txtNombre.Text,txtRFC.Text,ddlTipoPersona.SelectedValue.ToString(),txtCalleNum.Text,txtColonia.Text,txtCodigoPostal.Text,txtMunicipio.Text,txtEntidadFederativa.Text,txtContacto.Text,txtTelefonoContacto.Text,txtCorreoContacto.Text,txtObservaciones.Text);
         mvwClientes.ActiveViewIndex = 1;
         TraeClientes();**/

    }

    private void TraeClientes()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_TraeClientes", 0);
        gvClientes.DataSource = tbl;
        gvClientes.DataBind();
    }


    protected void txtVIN2_TextChanged(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_TraeVehiculos", 0, txtVIN2.Text);

        if (tbl.Rows.Count > 0)
        {
            DataRow dr = tbl.Rows[0];
            lblVehiculo.Text = dr["idVehiculo"].ToString();
            txtNumPlaca2.Text = dr["NumPlaca"].ToString();
            txtMarca2.Text = dr["Marca"].ToString();
            txtModelo2.Text = dr["Modelo"].ToString();
            txtDescripcionVehiculo2.Text = dr["Descripcion"].ToString();
            txtNumMotor2.Text = dr["NumMotor"].ToString();
        }
    }


    protected void btnGuardarInformacion_Click(object sender, EventArgs e)
    {
        cClientes cc = new cClientes(Convert.ToInt32(lblidCliente.Text), txtNombre.Text, txtRFC.Text, Convert.ToInt32(ddlTipoPersona.SelectedValue.ToString()),txtGiroNegocio.Text, txtCalleNumero.Text, ddlColonia.SelectedItem.Text, txtCP.Text, txtMunicipio.Text, txtEntidadFederativa.Text,0,0, txtNombreContacto.Text, txtTelefonoCOntacto.Text, txtCorreoCOntacto.Text, txtDescripcion.Text, 1);
        String Mensaje = cc.GuardaCliente(1);
        lblidCliente.Text = cc.ClienteId.ToString();

        Response.Write("<script>alert('" + Mensaje + "')</script>");
    }

    protected void btnGuardarVehiculo_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        /**DataTable tbl = sql.TraerDataTable("sp_GuardaVehiculo",0,lblidCliente.Text,txtNumPlaca.Text,txtVIN.Text,txtMarca.Text,txtModelo.Text,txtDescripcionVehiculo.Text,txtNumeroMotor.Text,ddlTipoVehiculo.SelectedValue.ToString(),"");

        if(tbl.Rows.Count>0)
        {
            Response.Write("<script>alert('" + tbl.Rows[0]["msj"].ToString() + "')</script>");
        }**/
    }

    protected void btnGuardarPoliza_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();

        if (lblVehiculo.ToString() == "0")
        {
            /**DataTable tbl = sql.TraerDataTable("sp_GuardaVehiculo", 0, lblidCliente.Text, txtNumPlaca2.Text, txtVIN2.Text, txtMarca2.Text, txtModelo2.Text, txtDescripcionVehiculo2.Text, txtNumMotor2.Text, ddlTipoVehiculo2.SelectedValue.ToString(), "");

            if (tbl.Rows.Count > 0)
            {
                lblVehiculo.Text = tbl.Rows[0]["idVehiculo"].ToString();
            }
        }

       
            Response.Write("<script>alert('Poliza Guardada')</script>");**/
        }

    }



    protected void lnkVehiculos_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 0;
    }

    protected void lnkPolizas_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 1;
    }

    protected void lnkSiniestros_Click(object sender, EventArgs e)
    {
        mvwClientesDetalle.ActiveViewIndex = 2;
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

    protected void btnAgregarFlotilla_Click(object sender, EventArgs e)
    {
        if (pnlAgregarNuevaFlotilla.Visible == false)
        {
            pnlAgregarNuevaFlotilla.Visible = true;
            TraeFlotillas();
        }
        else
        {
            pnlAgregarNuevaFlotilla.Visible = false;
        }
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

        rptFlotillas.DataSource = tbl;
        rptFlotillas.DataBind();
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

                cc.GuardaFlotillas(Convert.ToInt32(Valor), "",1);
                TraeFlotillas();

                break;
        }
    }

    protected void rptFlotillas_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        String Valor = e.CommandArgument.ToString();
        String Opc = e.CommandName.ToString();

        switch (Opc)
        {
            case "DetalleFlotilla":
                lblidFLotilla.Text = Valor;
                Button btn = (Button)e.Item.FindControl("btnFlotilla");
                lblNombreFlotilla.Text = btn.Text;

                break;
        }
    }

    protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String Opc = e.CommandName.ToString();
        String Val = e.CommandArgument.ToString();

        switch (Opc)
        {
            case "VerCliente":
                TraeInformacionCliente(Convert.ToInt32(Val));
                mvwClientes.ActiveViewIndex = 0;

                break;

        }
    }

    private void TraeInformacionCliente(int idCliente)
    {
        DatosSql sql = new DatosSql();
        cClientes cc = new cClientes(idCliente);

        lblidCliente.Text = cc.ClienteId.ToString();
        txtNombre.Text = cc.NombreRS;
        txtRFC.Text = cc.RFC;
        ddlTipoPersona.SelectedValue = cc.idTipoPersona.ToString();
        txtGiroNegocio.Text = cc.GiroNegocio;
        txtCalleNumero.Text = cc.CalleNumero;
        txtCP.Text = cc.CodigoPostal;
        traeEdoMunColXCP();
        txtMunicipio.Text = cc.Municipio;
        txtEntidadFederativa.Text = cc.EntidadFederativa;
        ddlColonia.SelectedValue = cc.Colonia;
        txtNombreContacto.Text = cc.NombreContacto;
        txtTelefonoCOntacto.Text = cc.TelefonoContacto;
        txtCorreoCOntacto.Text = cc.CorreoContacto;
        txtDescripcion.Text = cc.Observaciones;

    }
}