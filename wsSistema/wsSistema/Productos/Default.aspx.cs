using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Productos_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["v"] != null)
            {
                mvwProductos.ActiveViewIndex = Convert.ToInt32(Request.QueryString["v"].ToString());
            }
        }
    }
}