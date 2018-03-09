using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            
             llenaMenuPrincipal();
            
        }
    }

    private void llenaMenuPrincipal()
    {
            DatosSql sql = new DatosSql();
            DataTable tbl = sql.TraerDataTable("sp_GetCataloges", 16,Convert.ToInt32(HttpContext.Current.Session["Person_ID"].ToString()));

            lblMenu.Text = "<ul class='sidebar-menu'>";
            foreach (DataRow dr in tbl.Rows)
            {
                if (dr["Father_ID"].ToString().Equals("0"))
                {
                    lblMenu.Text += "<li class='treeview'><a href = '#' ><i class='fa fa-key'></i><span style='color:white !important; text-align:center;'><b>" + dr["Name"].ToString().ToUpper() + "</b></span><i class='fa fa-angle-left pull-right'></i></a>";
                    lblMenu.Text += LlenaSubNiveles(dr["Menu_ID"].ToString(), tbl);
                    lblMenu.Text += "</li>";
                }
            }
            lblMenu.Text += "</li>";
    }
    private String LlenaSubNiveles(String IdPapa, DataTable tbl)
    {
        int i = 0;
        String SubMenu = "";

        SubMenu += "<ul class='treeview-menu'>";

        foreach (DataRow dr in tbl.Rows)
        {
            if (dr["Father_ID"].ToString().Equals(IdPapa))
            {

                SubMenu += "<li><a href = '" + dr["Path"].ToString() + "'><i class='fa fa-circle-o'></i>" + dr["Name"].ToString() + " <i class='fa fa-angle-left pull-right'></i></a>";
                SubMenu += LlenaSubNiveles(dr["Menu_ID"].ToString(), tbl);
                SubMenu += "</li>";
                i++;

            }
        }

        SubMenu += "</ul>";

        if (i == 0)
        {
            SubMenu = "";
        }

        return SubMenu;
    }

}