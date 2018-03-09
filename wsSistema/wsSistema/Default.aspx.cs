using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class _Default : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        cUsuarios obj = new cUsuarios(txtUsuario.Text, txtPsw.Text);

        String Mensaje = obj.ValidaUsr();
        
        if (obj.PersonID != 0)
        {
            Session.Add("Person_ID", obj.PersonID);
            Response.Redirect("Siniestros/Default.aspx");
            
          
        }
        else
        {

            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \""+Mensaje+"\", \"error\");", true);
        }
        
    }
}