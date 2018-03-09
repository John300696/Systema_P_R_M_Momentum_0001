using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Comisiones_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            TraeCatalogos();
        }
    }

    private void TraeCatalogos()
    {
        Extras ex = new Extras();
       
        ddlCia.DataSource = ex.TraeCatalogos(2, 0);
        ddlCia.DataValueField = "Cia_ID";
        ddlCia.DataTextField = "Cia";
        ddlCia.DataBind();

        txtFecha.Text = DateTime.Now.ToString("dd/MM/yyyy");
    }

    protected void btnGuardaLiquidacion_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SaveLiquidation",0,"LIQUIDACION-"+Convert.ToDateTime(txtFecha.Text).ToString("ddMMyyyy")+"-"+ddlCia.SelectedItem.Text+"-",ddlCia.SelectedValue.ToString(),txtImporteLiquidacion.Text);

        if(tbl.Rows.Count>0)
        {
            lblTotalLiquidacion.Text = txtImporteLiquidacion.Text;
            lblLiquidacion.Text = tbl.Rows[0]["Liquidation_ID"].ToString();
            lblFolioLiquidacion.Text = tbl.Rows[0]["Folio"].ToString();
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + tbl.Rows[0]["msj"].ToString() + "\", \"success\");", true);
            TraeRecibos();
        }
    }




    protected void txtPorcentaje_TextChanged(object sender, EventArgs e)
    {
        GridViewRow row = ((GridViewRow)((TextBox)sender).NamingContainer);
        TextBox txtSubtotal = (TextBox)row.FindControl("txtSubTotal");
        TextBox txtPorcentaje = (TextBox)row.FindControl("txtPorcentaje");
        TextBox txtTotal = (TextBox)row.FindControl("txtTotal");
        Double SubTotal = Convert.ToDouble(txtSubtotal.Text);
        Double Porcentaje = (Convert.ToInt32(txtPorcentaje.Text));
        Double Total = ((Double)(SubTotal * Porcentaje))/100;
        txtTotal.Text = Total.ToString();
    }

    private void TraeRecibos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetReceiptsCollection", 0);
        gvAsignacionStatus.DataSource = tbl;
        gvAsignacionStatus.DataBind();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 0, txtBusqueda.Text);
        gvAsignacionStatus.DataSource = tbl;
        gvAsignacionStatus.DataBind();
    }

    private void TraeRecibosEnLiquidacion()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetReceiptsLiquidation", lblLiquidacion.Text);

        Double Total = 0.0;

        foreach(DataRow dr in tbl.Rows)
        {
            Total += Convert.ToDouble(dr["Total1"].ToString());
        }

        lblTotal.Text = Total.ToString();

        lblDiferencia.Text = (Convert.ToDouble(lblTotalLiquidacion.Text) - Total).ToString();


        gvRecibosLiquidacion.DataSource = tbl;
        gvRecibosLiquidacion.DataBind();
    }

    protected void gvAsignacionStatus_RowCommand(object sender, GridViewCommandEventArgs e)
    {
       

            String val = e.CommandArgument.ToString();
            String opc = e.CommandName.ToString();

            DatosSql sql = new DatosSql();

            switch (opc)
            {

                case "Status":
                    GridViewRow rp = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    DropDownList ddl = (DropDownList)rp.FindControl("ddlStatus");
                    TextBox txt = (TextBox)rp.FindControl("txtFecAplicacion");

                    sql.Ejecutar("sp_UpdateStatus", val, ddl.SelectedValue.ToString(), txt.Text);
                    TraeRecibos();
                    DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 0, " ");
                    gvAsignacionStatus.DataSource = tbl;
                    gvAsignacionStatus.DataBind();
                    break;

                case "Comisiones":
                    GridViewRow rp2 = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                    TextBox txtSubtotal = (TextBox)rp2.FindControl("txtSubTotal");
                    TextBox txtPorcentaje = (TextBox)rp2.FindControl("txtPorcentaje");
                    TextBox txtTotal = (TextBox)rp2.FindControl("txtTotal");

                    sql.Ejecutar("sp_SaveCommisionReceipts", 0, lblLiquidacion.Text, val, txtSubtotal.Text, txtPorcentaje.Text, txtTotal.Text,1);
                    TraeRecibosEnLiquidacion();
                    
                    break;

            }
        
    }

    protected void lnkAsignación_Click(object sender, EventArgs e)
    {
        mvwComisiones.ActiveViewIndex = 0;
    }

    protected void lnkCOnsultaLiquidacion_Click(object sender, EventArgs e)
    {
        mvwComisiones.ActiveViewIndex = 1;
        TraeLiquidaciones();

    }

    private void TraeLiquidaciones()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetLiquidation",0);

        gvLiquidaciones.DataSource = tbl;
        gvLiquidaciones.DataBind();
    }

    protected void lnkConsultaComisiones_Click(object sender, EventArgs e)
    {
        mvwComisiones.ActiveViewIndex = 2;
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPersonxRole",2);

        ddlAsesor.DataSource = tbl;
        ddlAsesor.DataValueField = "Person_ID";
        ddlAsesor.DataTextField = "NameC";
        ddlAsesor.DataBind();
    }

    protected void gvLiquidaciones_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String val = e.CommandArgument.ToString();
        String opc = e.CommandName.ToString();

        switch(opc)
        {
            case "Ver_Liquidacion":
                mvwComisiones.ActiveViewIndex = 0;
                lblLiquidacion.Text = val;
                
                DatosSql sql = new DatosSql();
                DataTable tbl = sql.TraerDataTable("sp_GetLiquidation", val);

                lblFolioLiquidacion.Text = tbl.Rows[0]["Folio"].ToString();
                lblTotalLiquidacion.Text = tbl.Rows[0]["Import_Liquidation"].ToString();
                TraeRecibosEnLiquidacion();
                break;
        }
    }

    protected void ddlAsesor_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeCOmisionAsesor(Convert.ToInt32(ddlAsesor.SelectedValue.ToString()));
    }

    private void TraeCOmisionAsesor(int Asesor)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetCommisionxAdviser",Asesor);

        Double Total = 0.0;

        foreach (DataRow dr in tbl.Rows)
        {
            Total += Convert.ToDouble(dr["Total"].ToString());
        }

        lblTOtalAsesor.Text = Total.ToString();

        gvLiquidacionAsesor.DataSource = tbl;
        gvLiquidacionAsesor.DataBind();
    }
}