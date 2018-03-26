using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using iTextSharp.text.pdf;
using System.IO;
using iTextSharp.text;

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

    private String GenerarPDF()
    {
        byte[] generaPDF = null;

        generaPDF = GenerarPDF(Convert.ToInt32(ddlAsesor.SelectedValue.ToString()));

        string savePathPDF = Server.MapPath("") + "\\PDF\\";
        string fileNamePDF = DateTime.Now.ToString("ddMMyyyy-") + ddlAsesor.SelectedValue.ToString() + ".pdf";
        string pathToCheckPDF = savePathPDF + fileNamePDF;

        if (!Directory.Exists(savePathPDF))
        {
            DirectoryInfo di = Directory.CreateDirectory(savePathPDF);
        }

        // Try to create the directory.



        savePathPDF += fileNamePDF;

        if (!System.IO.File.Exists(pathToCheckPDF))
        {
            System.IO.File.WriteAllBytes(savePathPDF, generaPDF);
        }

        return fileNamePDF;


    }

    static public void Download(string patch)
    {
        System.IO.FileInfo toDownload =
                   new System.IO.FileInfo(HttpContext.Current.Server.MapPath(patch));

        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.AddHeader("Content-Disposition",
                   "attachment; filename=" + toDownload.Name);
        HttpContext.Current.Response.AddHeader("Content-Length",
                   toDownload.Length.ToString());
        HttpContext.Current.Response.ContentType = "application/octet-stream";
        HttpContext.Current.Response.WriteFile(patch);
        HttpContext.Current.Response.End();
    }

    private byte[] GenerarPDF(int idAsesor)
    {
        DatosSql sql = new DatosSql();
        DataTable dt = sql.TraerDataTable("sp_GetCommisionxAdviser", idAsesor);

        var output = new MemoryStream();

        Document document = new Document();
        document.SetPageSize(iTextSharp.text.PageSize.LETTER.Rotate());
        PdfWriter writer = PdfWriter.GetInstance(document, output);
        document.Open();

        Paragraph title = new Paragraph(string.Format("ASESOR: "+ddlAsesor.SelectedItem.Text+"\nFECHA:"+DateTime.Now.ToLongDateString()+"\n\n"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 14, iTextSharp.text.Font.BOLD));
        title.Alignment = Element.ALIGN_LEFT;
        document.Add(title);

        iTextSharp.text.Font font5 = iTextSharp.text.FontFactory.GetFont(FontFactory.HELVETICA,8);

        PdfPTable table = new PdfPTable(12);
        PdfPRow row = null;
        /**float[] widths = new float[] { 4f, 4f, 4f, 4f };

        table.SetWidths(widths);**/

        table.WidthPercentage = 100;
        int iCol = 0;
        string colname = "";
        PdfPCell cell = new PdfPCell(new Phrase("Comisiones"));

        cell.Colspan = 12;

        table.AddCell(new Phrase("RAMO", font5));
        table.AddCell(new Phrase("SUBRAMO", font5));
        table.AddCell(new Phrase("RECIBO", font5));
        table.AddCell(new Phrase("LIMITE DE PAGO", font5));
        table.AddCell(new Phrase("POLIZA", font5));
        table.AddCell(new Phrase("INCISO", font5));
        table.AddCell(new Phrase("CLIENTE", font5));
        table.AddCell(new Phrase("FEC. APLICACIÓN", font5));
        table.AddCell(new Phrase("PRIMA NETA", font5));
        table.AddCell(new Phrase("%", font5));
        table.AddCell(new Phrase("COMISION", font5));
        table.AddCell(new Phrase("LIQUIDACIÓN", font5));
      



        foreach (DataRow r in dt.Rows)
        {
            if (dt.Rows.Count > 0)
            {
                table.AddCell(new Phrase(r[0].ToString(), font5));
                table.AddCell(new Phrase(r[1].ToString(), font5));
                table.AddCell(new Phrase(r[2].ToString(), font5));
                table.AddCell(new Phrase(r[3].ToString(), font5));
                table.AddCell(new Phrase(r[4].ToString(), font5));
                table.AddCell(new Phrase(r[5].ToString(), font5));
                table.AddCell(new Phrase(r[6].ToString(), font5));
               
                table.AddCell(new Phrase(r[9].ToString(), font5));
                table.AddCell(new Phrase(r[10].ToString(), font5));
                table.AddCell(new Phrase(r[11].ToString(), font5));
                table.AddCell(new Phrase(r[12].ToString(), font5));
                table.AddCell(new Phrase(r[13].ToString(), font5));
                
                
            }
        }
        document.Add(table);

        Paragraph TOTAL = new Paragraph(string.Format("\n\nCOMISION TOTAL: $" +lblTOtalAsesor.Text+ "\n\n"), new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 14, iTextSharp.text.Font.BOLD));
        TOTAL.Alignment = Element.ALIGN_RIGHT;
        document.Add(TOTAL);

        document.Close();
       
       
        writer.Close();
        
        return output.ToArray();
    }

    protected void btnExportarPDF_Click(object sender, EventArgs e)
    {
        Download("PDF/"+GenerarPDF());
        
        
    }

    protected void btnAgregarBono_Click(object sender, EventArgs e)
    {
        DatosSql sql = new DatosSql();
        sql.Ejecutar("sp_SaveCommisionToken", 0, lblLiquidacion.Text, txtConcepto.Text, txtImporte.Text, txtPorcentaje.Text, txtComision.Text, 1);
        TraeRecibosEnLiquidacion();
    }

    protected void txtPorcentaje_TextChanged1(object sender, EventArgs e)
    {
        
        Double SubTotal = Convert.ToDouble(txtImporte.Text);
        Double Porcentaje = (Convert.ToInt32(txtPorcentaje.Text));
        Double Total = ((Double)(SubTotal * Porcentaje)) / 100;
        txtComision.Text = Total.ToString();
    }
}