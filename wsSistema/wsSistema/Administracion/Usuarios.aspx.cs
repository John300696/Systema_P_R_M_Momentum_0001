using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administracion_Usuarios : System.Web.UI.Page
{
    String isChecked = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Request.QueryString["v"] != null)
            {
                switch (Convert.ToChar(Request.QueryString["v"].ToString()))
                {

                    case '0':

                        mvwUsuarios.ActiveViewIndex = 0;
                        TraeCatalogos();
                        lblidUsuario.Text = "0";
                        break;

                    case '1':

                        mvwUsuarios.ActiveViewIndex = 1;
                        TraePersona();

                        break;
                }
            }
            
        }
        
    }

    private void TraePersona()
    {
        cUsuarios cu = new cUsuarios();
        cu.PersonID = 0;
        gvUsuarios.DataSource = cu.TraeInfoUsuario(0);
        gvUsuarios.DataBind();
       
    }

    private void TraeCatalogos()
    {
        Extras ex = new Extras();

        ddlTipoUsuario.DataSource = ex.TraeCatalogos(9, 0);
        ddlTipoUsuario.DataValueField = "Role_ID";
        ddlTipoUsuario.DataTextField = "Role";
        ddlTipoUsuario.DataBind();

        ddlOficina.DataSource = ex.TraeCatalogos(1,0);
        ddlOficina.DataValueField = "BranchOffice_ID";
        ddlOficina.DataTextField = "BranchOffice";
        ddlOficina.DataBind();

    }

    protected void btnGuardarUsuario_Click(object sender, EventArgs e)
    {
        String Mensaje = "";
        String Foto = "";

        if (txtPsw.Text == txtPsw2.Text)
        {
            
            Boolean fileOK = false;
            String path = Server.MapPath("~/Administracion/user/photo/");
          
            if (fuFoto.HasFile)
            {
                String fileExtension =
                    System.IO.Path.GetExtension(fuFoto.FileName).ToLower();
                String[] allowedExtensions = { ".jpg", ".png", ".gif"};
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

          
            if (fileOK)
            {
                try
                {
                    fuFoto.SaveAs(path + fuFoto.FileName);

                    cUsuarios cs = new cUsuarios(Convert.ToInt32(lblidUsuario.Text), txtNombreU.Text, txtAPU.Text, txtAMU.Text, txtRFC.Text, txtTelefono.Text, txtCorreo.Text, Convert.ToInt32(ddlTipoUsuario.SelectedValue.ToString()), Convert.ToInt32(ddlOficina.SelectedValue.ToString()), txtFechaIngreso.Text, txtUsuario.Text, txtPsw.Text, fuFoto.FileName, 1);


                    
                    Mensaje = cs.GuardaUsuario(1);
                    lblidUsuario.Text = cs.PersonID.ToString();
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
                    pnlDatosAdicionales.Visible = true;
                    Extras ex = new Extras();
                    ex.sendMail2(txtCorreo.Text, "PROMORISK MÉXICO <br/> Se ha actualizado tu Información", "Modificación del Sistema");

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"Ha ocurrido un error D:\", \"error\");", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"No es un archivo valido debe ser una imagen\", \"error\");", true);
            }
        }
        else
        {
            Mensaje = "Las Contraseñas no Coinciden";
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);

        }
    }

    protected void btnInfoAficional_Click(object sender, EventArgs e)
    {
        mvwInfoUsuarios.ActiveViewIndex = 0;

        Extras ex = new Extras();
        ddlCia.DataSource = ex.TraeCatalogos(2, 0);
        ddlCia.DataValueField = "Cia_ID";
        ddlCia.DataTextField = "Cia";
        ddlCia.DataBind();
    }

    protected void btnDirecciones_Click(object sender, EventArgs e)
    {
        mvwInfoUsuarios.ActiveViewIndex = 1;
        TraeDireccion();

    }

    protected void btnMedios_Click(object sender, EventArgs e)
    {
        mvwInfoUsuarios.ActiveViewIndex = 2;

        Extras ex = new Extras();
        ddlMedio.DataSource = ex.TraeCatalogos(4, 0);
        ddlMedio.DataValueField = "Contact_ID";
        ddlMedio.DataTextField = "Contact";
        ddlMedio.DataBind();

        
    }

    protected void btnDocumentacion_Click(object sender, EventArgs e)
    {
        mvwInfoUsuarios.ActiveViewIndex = 3;

        Extras ex = new Extras();
        ddlDocumento.DataSource = ex.TraeCatalogos(6, 0);
        ddlDocumento.DataValueField = "Document_ID";
        ddlDocumento.DataTextField = "Document_Name";
        ddlDocumento.DataBind();
    }

    protected void btnAccesos_Click(object sender, EventArgs e)
    {
        mvwInfoUsuarios.ActiveViewIndex = 4;
        Extras ex = new Extras();
        DataTable tbl = ex.TraeCatalogos(14, 0);
        tvAccesos.Nodes.Clear();
       
        DatosSql sql = new DatosSql();
        DataTable tbl2 = sql.TraerDataTable("sp_GetCataloges", 16, (lblidUsuario.Text));

        TraeAccesos(tvAccesos.Nodes, 0, tbl,tbl2);
    }

    private void TraeAccesos(TreeNodeCollection nodo,int IdPapa, DataTable tbl,DataTable tblSeleccionados)
    {
        foreach (DataRow dr in tbl.Rows)
        {
           
            if (dr["Father_ID"].ToString().Equals(IdPapa.ToString()))
            {
                
                TreeNode NewNode = new TreeNode(dr["Name"].ToString(), dr["Menu_ID"].ToString());
                foreach (DataRow dr2 in tblSeleccionados.Rows)
                {
                    if(dr2["Menu_ID"].ToString() == dr["Menu_ID"].ToString())
                    {
                        NewNode.Checked = true;
                       
                    }
                }
                nodo.Add(NewNode);
               
                TraeAccesos(NewNode.ChildNodes,Convert.ToInt32(dr["Menu_ID"].ToString()),tbl,tblSeleccionados);
            }
          
        }
        
    }

   
    protected void btnGuardarInformacionAgente_Click(object sender, EventArgs e)
    {
        String Cedula, PolizaRC,Mensaje;

        Boolean fileOK = false;
        Boolean fileOK2 = false;
        String path = Server.MapPath("~/Administracion/user/docs/");

        if (fuCedula.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(fuCedula.FileName).ToLower();
            String[] allowedExtensions = { ".jpg", ".png", ".gif",".pdf" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK = true;
                }
            }
        }

        if (fuPolizaRC.HasFile)
        {
            String fileExtension =
                System.IO.Path.GetExtension(fuPolizaRC.FileName).ToLower();
            String[] allowedExtensions = { ".jpg", ".png", ".gif",".pdf" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOK2 = true;
                }
            }
        }


        if (fileOK&& fileOK2)
        {
            try
            {
                Cedula = "Cedula_" + fuCedula.FileName;
                PolizaRC = "PolizaRC_" + fuPolizaRC.FileName;

                fuCedula.SaveAs(path + Cedula);
                fuPolizaRC.SaveAs(path + PolizaRC);

                cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));
                cu.AgenteID = Convert.ToInt32(lblidAgente.Text);
                cu.PersonID = Convert.ToInt32(lblidUsuario.Text);
                
                Mensaje = cu.GuardaAgente(Convert.ToInt32(ddlTipoPersona.SelectedValue.ToString()), txtCedula.Text, Cedula, txtDesdeCedula.Text, txtHastaCedula.Text, txtPolizaRC.Text, PolizaRC, txtDesdePolizaRC.Text, txtHastaPolizaRC.Text);
                
                lblidAgente.Text = cu.AgenteID.ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);



            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"Ha ocurrido un error D:\", \"error\");", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Oh...\", \"No es un archivo valido la Cedula o la Poliza de RC debe ser imagen o PDF\", \"error\");", true);
        }

     }

    protected void btnGuardarClave_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios();
        cu.AgenteID = Convert.ToInt32(lblidAgente.Text);
        String Mensaje = cu.GuardaCveAgente(0, Convert.ToInt32(ddlCia.SelectedValue.ToString()), txtCkave.Text);
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
        TraeClaveAgente();
    }

    private void TraeClaveAgente()
    {
        cUsuarios cu = new cUsuarios();
        cu.AgenteID = Convert.ToInt32(lblidAgente.Text);
        gvClave.DataSource = cu.TraeCveAgente();
        gvClave.DataBind();
    }

    protected void btnGuardarInformacionAsesor_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));
        cu.AsesorID = Convert.ToInt32(lblidAsesor.Text);
        cu.PersonID = Convert.ToInt32(lblidUsuario.Text);

        /*String Mensaje = cu.GuardaAgente(Convert.ToInt32(ddlTipoPersona.SelectedValue.ToString()), txtCedula.Text, Cedula, txtDesdeCedula.Text, txtHastaCedula.Text, txtPolizaRC.Text, PolizaRC, txtDesdePolizaRC.Text, txtHastaPolizaRC.Text);

        lblidAgente.Text = cu.AgenteID.ToString();
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
        **/
    }

    protected void bntnGuardarDireccion_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));
        String Mensaje = cu.GuardaDireccion(Convert.ToInt32(lblidDireccion.Text), txtCalleNumero.Text, ddlColonia.SelectedValue.ToString(), txtCP.Text, txtEntidadFederativa.Text, txtMunicipio.Text);
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
        TraeDireccion();
    }

    private void TraeDireccion()
    {
        cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));

        gvDireccion.DataSource = cu.TraeInfoUsuario(3);
        gvDireccion.DataBind();
    }

    protected void txtCP_TextChanged(object sender, EventArgs e)
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

    protected void btnGuardarMedio_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));
        String Mensaje = cu.GuardaContacto(0, Convert.ToInt32(ddlMedio.SelectedValue.ToString()), txtValorMedio.Text);
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "swal(\"Listo!\",\"" + Mensaje + "\", \"success\");", true);
        TraeMediosContacto();
    }

    private void TraeMediosContacto()
    {
        cUsuarios cu = new cUsuarios(Convert.ToInt32(lblidUsuario.Text));
        gvMedioContacto.DataSource = cu.TraeInfoUsuario(4);
        gvMedioContacto.DataBind();
    }

    protected void btnGuardarDocumento_Click(object sender, EventArgs e)
    {

    }

    protected void btnGuardarAccesos_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios();
        cu.PersonID = Convert.ToInt32(lblidUsuario.Text);

        cu.GuardaAcceso(0, 0);
        isChecked = "";
        GuardaAccesos(tvAccesos.Nodes);

        String[] Accesos = isChecked.TrimEnd(',').Split(',');

        foreach(String AC in Accesos)
        {
            cu.GuardaAcceso(0, Convert.ToInt32(AC));
        }
    }

    
    private void GuardaAccesos(TreeNodeCollection nodo)
    {

        foreach (TreeNode tr in nodo)
        {
            if(tr.Checked)
            {
                isChecked += tr.Value+",";
            }

            if (tr.ChildNodes.Count>0)
            {
                GuardaAccesos(tr.ChildNodes);
               
            }

        }

    }

    
    protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String val = e.CommandArgument.ToString();
        String opc = e.CommandName.ToString();

        switch(opc)
        {
            case "VerUsuario":
                TraeCatalogos();
                TraeInformacionUsuario(Convert.ToInt32(val));
                mvwUsuarios.ActiveViewIndex = 0;
                pnlDatosAdicionales.Visible = true;
                break;
            case "EnviarMail":
                Extras ex = new Extras();
                ex.sendMail2(val,"PROMORISK MÉXICO <br/> Usuario:"+val+"<br/>Password: 123456*","Usuario y Contraseña del Sistema");
                break;
        }
    }

    private void TraeInformacionUsuario(int Persona_ID)
    {
        lblidUsuario.Text = Persona_ID.ToString();
        cUsuarios cu = new cUsuarios(Persona_ID);
        DataTable tbl = cu.TraeInfoUsuario(0);
        lblCompleto.Text = cu.Nombre + " " + cu.APaterno + " " + cu.AMaterno;
        lblRFC.Text = cu.RFC;
        txtNombreU.Text = cu.Nombre;
        txtAPU.Text = cu.APaterno;
        txtAMU.Text = cu.AMaterno;
        txtRFC.Text = cu.RFC;
        txtCorreo.Text = cu.Email;
        txtTelefono.Text = cu.Telefono;
        txtFechaIngreso.Text = Convert.ToDateTime(cu.FecIngreso).ToString("yyyy-MM-dd");
        imgFoto.ImageUrl = "../Administracion/user/photo/" + cu.Foto;
        ddlTipoUsuario.SelectedValue = cu.Rol.ToString();
        ddlOficina.SelectedValue = cu.Oficina.ToString();
        txtUsuario.Text = cu.User;

        switch(cu.Rol)
        {
            case 1:
                mvwInfoAdicional.ActiveViewIndex = 0;
                TraeInfoAgente(Persona_ID);
                break;
            case 2:
                mvwInfoAdicional.ActiveViewIndex = 1;
                break;
            default:
                mvwInfoAdicional.ActiveViewIndex = 2;
                break;
        }


    }

    private void TraeInfoAgente(int PersonaID)
    {
        cUsuarios cu = new cUsuarios(PersonaID);
        DataTable tbl = cu.TraeInfoUsuario(1);

        if(tbl.Rows.Count>0)
        {
            DataRow dr = tbl.Rows[0];
            lblidAgente.Text = dr["Agent_ID"].ToString();
            ddlTipoPersona.SelectedValue = dr["Type_Person"].ToString();
            txtCedula.Text = dr["Identification_Number"].ToString();
            lnkCedula.Attributes.Add("href","../Administracion/user/docs/"+ dr["Identification_PDF"].ToString());
            txtDesdeCedula.Text = Convert.ToDateTime(dr["Identification_Vigence_Since"].ToString()).ToString("yyyy-MM-dd");
            txtHastaCedula.Text = Convert.ToDateTime(dr["Identification_Vigence_End"].ToString()).ToString("yyyy-MM-dd");

            txtPolizaRC.Text = dr["Policy_RC_Number"].ToString();
            lnkPolizaRC.Attributes.Add("href", "../Administracion/user/docs/" + dr["Policy_RC_PDF"].ToString());
            txtDesdePolizaRC.Text = Convert.ToDateTime(dr["Policy_RC_VIgence_Since"].ToString()).ToString("yyyy-MM-dd");
            txtHastaPolizaRC.Text = Convert.ToDateTime(dr["Policy_RC_VIgence_End"].ToString()).ToString("yyyy-MM-dd");

            TraeClaveAgente();
        }
    }



    protected void gvDireccion_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void gvMedioContacto_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void txtCorreo_TextChanged(object sender, EventArgs e)
    {
        txtUsuario.Text = txtCorreo.Text;
    }

    protected void btnRegresar_Click(object sender, EventArgs e)
    {
        mvwUsuarios.ActiveViewIndex = 1;
        TraePersona();
    }

    protected void ddlTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
    {
        String Valor = ddlTipoUsuario.SelectedValue.ToString();
        if (Valor == "1"||Valor=="2")
        {
            pnlInfoAdicionalCorreo.Visible = true;
        }
        else
        {
            pnlInfoAdicionalCorreo.Visible = false;
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        cUsuarios cu = new cUsuarios();
        
        gvUsuarios.DataSource = cu.TraeInfoUsuario(txtBusqueda.Text);
        gvUsuarios.DataBind();
    }
}