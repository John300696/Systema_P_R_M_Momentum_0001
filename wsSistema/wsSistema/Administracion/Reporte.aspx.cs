using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administracion_Reporte : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            TraeConducto();
            TraeOrdenes(0);
        }
    }

    private void TraeConducto()
    {
       
        cUsuarios cu = new cUsuarios();
        cu.PersonID = 0;
        DataTable tbl = cu.TraeInfoUsuario(0);

        ddlSolicito.DataSource = tbl;
        ddlSolicito.DataTextField = "Full_Name";
        ddlSolicito.DataValueField = "Person_ID";
        ddlSolicito.DataBind();

    }

    
    protected void ddlSolicito_SelectedIndexChanged(object sender, EventArgs e)
    {
        TraeOrdenes(Convert.ToInt32(ddlSolicito.SelectedValue.ToString()));
    }

    private void TraeOrdenes(int User)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetWorkOrderByUser",User);
        gvOrdenesTrabajo.DataSource = tbl;
        gvOrdenesTrabajo.DataBind();
    }
}