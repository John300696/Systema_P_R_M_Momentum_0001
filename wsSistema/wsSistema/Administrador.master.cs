using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrador : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
              if (HttpContext.Current.Session["Person_ID"] != null)
                {

                lblFecha.Text = DateTime.Now.ToLongDateString();
                LlenaDatosPersonales();
            }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }


           
        }
    }

    private void LlenaDatosPersonales()
    {
        int PersonaID = Convert.ToInt32(HttpContext.Current.Session["Person_ID"].ToString());
        cUsuarios cu = new cUsuarios(PersonaID);

        DataTable tbl = cu.TraeInfoUsuario(0);
        if(tbl.Rows.Count>0)
        {
            lblNombre.Text = tbl.Rows[0]["Name_RS"].ToString();
            imgFoto.ImageUrl = "Administracion/user/photo/"+ tbl.Rows[0]["Photo"].ToString(); ;
        }
    }
    protected void lnkCerrarSesion_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../Default.aspx");
    }
}
