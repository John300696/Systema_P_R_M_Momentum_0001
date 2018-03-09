using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Cobranza_Default : System.Web.UI.Page
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
                       
                        gvAsignacionStatus.DataSource = TraeRecibosxSeccion(0);
                        gvAsignacionStatus.DataBind();

                        break;

                    case '1':

                        mvwPolizas.ActiveViewIndex = 1;
                       
                       
                        gvPolizasPendientes.DataSource = TraeRecibosxSeccion(1);
                        gvPolizasPendientes.DataBind();

                        break;
                    case '2':

                        mvwPolizas.ActiveViewIndex = 2;
                       
                        gvPolizasPagadas.DataSource = TraeRecibosxSeccion(2);
                        gvPolizasPagadas.DataBind();

                        break;
                    case '3':

                        mvwPolizas.ActiveViewIndex = 3;
                        
                        gvPolizasCanceladasFaltaPago.DataSource = TraeRecibosxSeccion(3);
                        gvPolizasCanceladasFaltaPago.DataBind();

                        break;
                    case '4':

                        mvwPolizas.ActiveViewIndex = 4;
                        
                        gvPolizasCanceladas.DataSource = TraeRecibosxSeccion(4);
                        gvPolizasCanceladas.DataBind();

                        break;
                    case '5':

                        mvwPolizas.ActiveViewIndex = 5;
                        TraeRecibos();

                        break;

                }
            }
            TraeRecibos();
        }
    }

    private DataTable TraeRecibosxSeccion(int Seccion)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection",Seccion, " ");
       
        return tbl;
    }
    private void TraeRecibos()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetReceiptsCollection",0);
        gvRecibosDetalle.DataSource = tbl;
        gvRecibosDetalle.DataBind();
    }

    protected void lnkEnviaCorreos_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPerson",0,0);

        foreach(DataRow dr in tbl.Rows)
        {
            int idAgente = Convert.ToInt32(dr["Person_ID"].ToString());

            DataTable tblPendientes = sql.TraerDataTable("sp_GetReceiptsCollection",idAgente);

            if(tblPendientes.Rows.Count>0)
            {
                Extras ex = new Extras();
                String CuerpoCorreo = "<div style='width:100%;padding:20px;text-align:center;'> <h3><b>AVISO  DE PROXIMO PAGO</b></h3><br/><div style='text-align:right'>Ciudad de México a "+DateTime.Now.ToLongDateString()+"</div><div style='text-align:justify'>";
                CuerpoCorreo += "<b>"+dr["Full_Name"].ToString().ToUpper() + " <br/><br/>Estimado Asesor/Asegurado</b><br/>Por medio de la presente, nos es grato saludarlo y a la vez informarle que de acuerdo a nuestros registros, la(s) poliza(s) a su cargo que se se detalla(n) a continuación, estan proximas a pago, por lo que sugerimos darle el seguimiento adecuado, a fin de evitar algun contratiempo al asegurado.<br/>" + Correo(tblPendientes) + "</div><br/><br/><br/><b>ATENTAMENTE<BR/>Promo Risk México<br/>Cobranza MIDAS</b><br/><img src='http://144.217.7.197/SIstema/images/PRM.png' style='width:400px;'/>";
                CuerpoCorreo += "</div>";
                String CorreoDonde = "lizbeth.cruz@prmseguros.com";
                String miMascara = "cobranza.danos1@prmseguros.com";
                if (dr["Role_ID"].ToString() == "1")
                {
                    CorreoDonde = "daniel.bravo@prmseguros.com";
                    miMascara = "cobranza.danos2@prmseguros.com";
                }


                
                ex.sendMail(dr["Email"].ToString(), CuerpoCorreo, "RECIBOS PENDIENTES DE PAGO",Recibos(tblPendientes),CorreoDonde);

            }
        }
    }

    private DataTable Recibos(DataTable dt)
    {
        DataTable tbl = new DataTable();
        tbl.Columns.Add("Documento");
        foreach(DataRow dr in dt.Rows)
        {
            tbl.Rows.Add(Server.MapPath("~/Emision/Receipts/"+dr["Documento"].ToString()));
        }

        return tbl;
    }

    private String Correo(DataTable dt)
    {
        String html = "<table style='width:'100%;border:solid 1px black;'>";
        //add header row
        html += "<tr>";
        for (int i = 0; i < dt.Columns.Count-1; i++)
            html += "<td>" + dt.Columns[i].ColumnName + "</td>";
        html += "</tr>";
        //add rows
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            html += "<tr>";
            for (int j = 0; j < dt.Columns.Count-1; j++)
                html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }



    protected void gvRecibosDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String val = e.CommandArgument.ToString();
        String opc = e.CommandName.ToString();

        switch(opc)
        {
            case "Status":
                GridViewRow rp = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DropDownList ddl = (DropDownList)rp.FindControl("ddlStatus");
                TextBox txt = (TextBox)rp.FindControl("txtFecAplicacion");
                DatosSql sql = new DatosSql();
                sql.Ejecutar("sp_UpdateStatus",val,ddl.SelectedValue.ToString(),txt.Text);
                TraeRecibos();
                DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 0, " ");
                gvAsignacionStatus.DataSource = tbl;
                gvAsignacionStatus.DataBind();
                break;

        }
    }

    protected void lnkAsignación_Click(object sender, EventArgs e)
    {
       
    }

   

    protected void lnkPendientes_Click(object sender, EventArgs e)
    {
       
    }

    protected void lnkPagadas_Click(object sender, EventArgs e)
    {
        
    }

    protected void lnkCanFaltaPago_Click(object sender, EventArgs e)
    {
       
    }

    protected void lnkCanPeticion_Click(object sender, EventArgs e)
    {
        
    }

    protected void lnkEnviarPolizasPendiente_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 0, txtBusqueda.Text);
        gvAsignacionStatus.DataSource = tbl;
        gvAsignacionStatus.DataBind();
    }

    protected void btnBuscar2_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 1, txtBuscar2.Text);
        gvPolizasPendientes.DataSource = tbl;
        gvPolizasPendientes.DataBind();
       
    }

    protected void btnBuscar3_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 2, txtBusqueda3.Text);
        gvPolizasPagadas.DataSource = tbl;
        gvPolizasPagadas.DataBind();
       
    }

    protected void btnBuscar4_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 3, txtBusqueda4.Text);
        gvPolizasCanceladasFaltaPago.DataSource = tbl;
        gvPolizasCanceladasFaltaPago.DataBind();
    }

    protected void btnBuscar5_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchReceiptsCollection", 4, txtBusqueda5.Text);
        gvPolizasCanceladas.DataSource = tbl;
        gvPolizasCanceladas.DataBind();
    }

   
}