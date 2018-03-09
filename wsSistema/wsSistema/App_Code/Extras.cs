using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System.Data;
using System.IO;
using System.Drawing;
/// <summary>
/// Descripción breve de Extras
/// </summary>
public class Extras
{
	public Extras()
	{
		
	}

    MailAddress address = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["mailCotizaciones"], "PROMORISK MÉXICO", Encoding.UTF8);
    static string usrMail = System.Configuration.ConfigurationManager.AppSettings["usrMail"];
    static string pswMail = System.Configuration.ConfigurationManager.AppSettings["pswMail"];
    static int port = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["puertoMail"]);
    System.Net.NetworkCredential credential = new System.Net.NetworkCredential(usrMail, pswMail);
    //String ipaddress = "192.168.254.247";
    String ipaddress = System.Configuration.ConfigurationManager.AppSettings["serverMail"];

    public String EscribeExcel(String Ruta, DataTable tbl)
    {
        FileInfo newFile = new FileInfo(Ruta);
        if (newFile.Exists)
        {
            newFile.Delete();  // ensures we create a new workbook
            newFile = new FileInfo(Ruta);
        }
        using (ExcelPackage package = new ExcelPackage(newFile))
        {
            // add a new worksheet to the empty workbook
            ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("Correos Newsletter");

            int columna = 0;
            for (int i = 0; i < tbl.Columns.Count; i++)
            {
               columna++;
                    worksheet.Cells[1, columna].Value = tbl.Columns[i].ColumnName;
                
            }
            int fila = 2;
            foreach (DataRow dr in tbl.Rows)
            {
                columna = 0;
                for (int i = 0; i < tbl.Columns.Count; i++)
                {
                     columna++;
                        worksheet.Cells[fila, columna].Value = dr[i].ToString();
                    
                }
                fila++;
            }

            //Formato
            using (var range = worksheet.Cells[1, 1, 1, columna])
            {
                range.Style.Font.Bold = true;
                range.Style.Fill.PatternType = ExcelFillStyle.Solid;
                range.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(32, 108, 174));
                range.Style.Font.Color.SetColor(Color.White);
            }
            worksheet.Cells.AutoFitColumns(0);
            package.Save();

        }
        return newFile.Name;
    }

    public String EscribeExcel(String Ruta, DataTable tbl,String Libro)
    {
        FileInfo newFile = new FileInfo(Ruta);
        if (newFile.Exists)
        {
            newFile.Delete();  // ensures we create a new workbook
            newFile = new FileInfo(Ruta);
        }
        using (ExcelPackage package = new ExcelPackage(newFile))
        {
            // add a new worksheet to the empty workbook
            ExcelWorksheet worksheet = package.Workbook.Worksheets.Add(Libro);

            int columna = 0;
            for (int i = 0; i < tbl.Columns.Count; i++)
            {
                columna++;
                worksheet.Cells[1, columna].Value = tbl.Columns[i].ColumnName;

            }
            int fila = 2;
            foreach (DataRow dr in tbl.Rows)
            {
                columna = 0;
                for (int i = 0; i < tbl.Columns.Count; i++)
                {
                    columna++;
                    worksheet.Cells[fila, columna].Value = dr[i].ToString();

                }
                fila++;
            }

            //Formato
            using (var range = worksheet.Cells[1, 1, 1, columna])
            {
                range.Style.Font.Bold = true;
                range.Style.Fill.PatternType = ExcelFillStyle.Solid;
                range.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(32, 108, 174));
                range.Style.Font.Color.SetColor(Color.White);
            }
            worksheet.Cells.AutoFitColumns(0);
            package.Save();

        }
        return newFile.Name;
    }

    public void sendMail(String correo, string body, string subject, string urlPDF)
    {
        try
        {
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            SmtpClient SmtpServer = new SmtpClient();
            SmtpServer.Host = ipaddress;
            mail.From = address;
            
            mail.Attachments.Add(new Attachment(urlPDF));
            mail.Subject = subject;
            mail.To.Add(correo);
            mail.Body = body;
            
            SmtpServer.Port = port;
            SmtpServer.Credentials = credential;
            SmtpServer.EnableSsl = false;
            SmtpServer.Send(mail);
        }

        catch (Exception ex)
        {
            GuardaExcepcion(ex.Message);
           
        }
    }
    
    public void sendMail(String correo, string body, string subject, DataTable archivos,String donde)
    {
        MailMessage mail = new MailMessage();
        mail.IsBodyHtml = true;
        SmtpClient SmtpServer = new SmtpClient();
        SmtpServer.Host = ipaddress;
     
        mail.From = address;
       
       
        mail.Subject = subject;
        mail.To.Add(correo);
        mail.CC.Add("ymartinez@momentum-ti.com");
        mail.CC.Add("erick.hernandez@prmseguros.com");
        mail.CC.Add(donde);
        mail.Body = body;
     
        if(archivos.Rows.Count>0)
        {
            foreach (DataRow dr in archivos.Rows)
            {

                mail.Attachments.Add(new Attachment(@dr["Documento"].ToString()));
            }
        }
       
        SmtpServer.Port = port;
        SmtpServer.Credentials = credential;
        SmtpServer.EnableSsl = false;
        try
        {
            SmtpServer.Send(mail);
        }

        catch(Exception ex)
        {
            GuardaExcepcion(ex.Message);
           
        }
    }

    public void GuardaExcepcion(String Texto)
    {
	DatosSql sql = new DatosSql();
	string url = HttpContext.Current.Request.Url.AbsoluteUri;
	//sql.Ejecutar("sp_GuardaExcepcion",0,Texto,url);
    }

    public void sendMail2(String correo, string body, string subject)
    {
       
        try
        {
		 MailMessage mail = new MailMessage();
        mail.IsBodyHtml = true;
        SmtpClient SmtpServer = new SmtpClient();
        SmtpServer.Host = ipaddress;
        mail.From = address;
       
       
        mail.Subject = subject;
        mail.To.Add(correo);
            mail.CC.Add("ymartinez@momentum-ti.com");
            mail.CC.Add("erick.hernandez@prmseguros.com");
            mail.CC.Add("lizbeth.cruz@prmseguros.com");
            mail.Body = body;
       SmtpServer.Port = port;
        SmtpServer.Credentials = credential;
        SmtpServer.EnableSsl = false;
            SmtpServer.Send(mail);
        }

        catch (Exception ex)
        {
            GuardaExcepcion(ex.Message);
           
        }
    }

    public String encriptaB64(string texto)
    {
        var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(texto);
        return System.Convert.ToBase64String(plainTextBytes);
    }

    public String decriptaB64(string textoEncriptado)
    {
        var base64EncodedBytes = System.Convert.FromBase64String(textoEncriptado);
        return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
    }


    public string ConvierteMD5(string str)
    {
        MD5 md5 = MD5CryptoServiceProvider.Create();
        ASCIIEncoding encoding = new ASCIIEncoding();
        byte[] stream = null;
        StringBuilder sb = new StringBuilder();

        stream = md5.ComputeHash(encoding.GetBytes(str));
        for (int i = 0; i < stream.Length; i++)
            sb.AppendFormat("{0:x2}", stream[i]);
        return sb.ToString();
    }

    public DataTable TraeCatalogos(int ID,int value)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetCataloges",ID,value);

        return tbl;
    }
}