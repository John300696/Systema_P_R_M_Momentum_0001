using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Data;

/// <summary>
/// Summary description for cUsuarios
/// </summary>
public class cUsuarios
{

    private int _Person_ID;
    private String _Nombre;
    private String _APaterno;
    private String _AMaterno;
    private String _RFC;
    private String _Telefono;
    private String _Email;
    private int _Rol;
    private int _Oficina;
    private String _FecIngreso;
    private String _User;
    private String _Password;
    private String _Foto;
    private int _Status;
    private int _Bandera;
    private int _AgenteID;
    private int _AsesorID;

    #region Propiedades

    public int PersonID
    {
        get
        {
            return this._Person_ID;
        }
        set
        {
            this._Person_ID = value;
        }
    }
    public String Nombre
    {
        get
        {
            return this._Nombre;
        }
        set
        {
            this._Nombre = value;
        }
    }
    public String APaterno
    {
        get
        {
            return this._APaterno;
        }
        set
        {
            this._APaterno = value;
        }
    }
    public String AMaterno
    {
        get
        {
            return this._AMaterno;
        }
        set
        {
            this._AMaterno = value;
        }
    }
    public String RFC
    {
        get
        {
            return this._RFC;
        }
        set
        {
            this._RFC = value;
        }
    }
    public String Telefono
    {
        get
        {
            return this._Telefono;
        }
        set
        {
            this._Telefono = value;
        }
    }
    public String Email
    {
        get
        {
            return this._Email;
        }
        set
        {
            this._Email = value;
        }
    }
    public int Rol
    {
        get
        {
            return this._Rol;
        }
        set
        {
            this._Rol = value;
        }
    }
    public int Oficina
    {
        get
        {
            return this._Oficina;
        }
        set
        {
            this._Oficina = value;
        }
    }
    public String FecIngreso
    {
        get
        {
            return this._FecIngreso;
        }
        set
        {
            this._FecIngreso = value;
        }
    }
    public String User
    {
        get
        {
            return this._User;
        }
        set
        {
            this._User = value;
        }
    }
    public String Password
    {
        get
        {
            return this._Password;
        }
        set
        {
            this._Password = value;
        }
    }
    public String Foto
    {
        get
        {
            return this._Foto;
        }
        set
        {
            this._Foto = value;
        }
    }
    public int Status
    {
        get
        {
            return this._Status;
        }
        set
        {
            this._Status = value;
        }
    }
    public int Bandera
    {
        get
        {
            return this._Bandera;
        }
        set
        {
            this._Bandera = value;
        }
    }

    public int AgenteID
    {
        get
        {
            return this._AgenteID;
        }
        set
        {
            this._AgenteID = value;
        }
    }

    public int AsesorID
    {
        get
        {
            return this._AsesorID;
        }
        set
        {
            this._AsesorID = value;
        }
    }

    #endregion


    public cUsuarios()
    {

    }


    public cUsuarios(int PersonIDN, String NombreN, String APaternoN, String ApMaternoN, String RFCN, String TelefonoN, String EmailN, int RolN, int OficinaN, String FecIngresoN, String UsuarioN, String PasswordN, String fotoN, int StatusN)
    {
        PersonID = PersonIDN;
        Nombre = NombreN;
        APaterno = APaternoN;
        AMaterno = ApMaternoN;
        RFC = RFCN;
        Telefono = TelefonoN;
        Email = EmailN;
        Rol = RolN;
        Oficina = OficinaN;
        FecIngreso = FecIngresoN;
        User = UsuarioN;
        Password = PasswordN;
        Foto = fotoN;
        Status = StatusN;
    }

    public cUsuarios(int PersonIDN)
    {
        PersonID = PersonIDN;
    }

    public cUsuarios(String UsuarioN, String PasswordN)
    {
        User = UsuarioN;
        Password = PasswordN;
    }

    public String ValidaUsr()
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();
        Password = new Extras().ConvierteMD5(Password);

        DataTable tblUsr = sql.TraerDataTable("sp_GetSession", User, Password);

        if (tblUsr.Rows.Count > 0)
        {
            PersonID = Convert.ToInt32(tblUsr.Rows[0]["Person_ID"].ToString());
            Mensaje = tblUsr.Rows[0]["msj"].ToString();
        }

        return Mensaje;
    }


    public String GuardaUsuario(int UserReg)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();
        Mensaje = ValidaFormulario(Nombre, APaterno, AMaterno, Email, User);

        if (Mensaje == "")
        {
            if (Password != "")
            {
                Password = new Extras().ConvierteMD5(Password);
            }

            DataTable tblUsr = sql.TraerDataTable("sp_SavePerson", PersonID, Nombre, APaterno, AMaterno, RFC, Telefono, Email, Rol, Oficina, FecIngreso, User, Password, Status, Foto, UserReg);

            if (tblUsr.Rows.Count > 0)
            {
                PersonID = Convert.ToInt32(tblUsr.Rows[0]["Person_ID"].ToString());
                Mensaje = tblUsr.Rows[0]["msj"].ToString();
                Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
            }
        }


        return Mensaje;
    }

    public String GuardaAgente(int Tipo, String Cedula, String CedulaPDF, String VigenciaCedulaDesde, String VigenciaCedulaHasta, String Poliza, String PolizaPDF, String VigenciaPolizaDesde, String VigenciaPolizaHasta)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();

        DataTable tblUsr = sql.TraerDataTable("sp_SaveAgent", AgenteID, PersonID, Tipo, Cedula, CedulaPDF, VigenciaCedulaDesde, VigenciaCedulaHasta, Poliza, PolizaPDF, VigenciaPolizaDesde, VigenciaPolizaHasta, 1);

        if (tblUsr.Rows.Count > 0)
        {
            AgenteID = Convert.ToInt32(tblUsr.Rows[0]["Agent_ID"].ToString());
            Mensaje = tblUsr.Rows[0]["msj"].ToString();
            Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
        }

        return Mensaje;
    }

    public String GuardaAsesor()
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();

        DataTable tblUsr = sql.TraerDataTable("sp_SaveAdviser", AsesorID, PersonID, AgenteID);

        if (tblUsr.Rows.Count > 0)
        {
            AsesorID = Convert.ToInt32(tblUsr.Rows[0]["Adviser_ID"].ToString());
            Mensaje = tblUsr.Rows[0]["msj"].ToString();
            Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
        }

        return Mensaje;
    }

    public String GuardaDireccion(int DireccionID, String Direccion, String Colonia, String CP, String Estado, String Municipio)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();

        DataTable tblUsr = sql.TraerDataTable("sp_SaveAddress", DireccionID, PersonID, Direccion, Colonia, CP, Estado, Municipio);

        if (tblUsr.Rows.Count > 0)
        {

            Mensaje = tblUsr.Rows[0]["msj"].ToString();
            Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
        }

        return Mensaje;
    }

    public String GuardaContacto(int ContactoID, int TipoID, String Valor)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();

        DataTable tblUsr = sql.TraerDataTable("sp_SaveContact", ContactoID, TipoID, PersonID, Valor);

        if (tblUsr.Rows.Count > 0)
        {

            Mensaje = tblUsr.Rows[0]["msj"].ToString();
            Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
        }

        return Mensaje;
    }

    public String GuardaDocumento(int DocumentID, int TipoID, String Archivo)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();

        DataTable tblUsr = sql.TraerDataTable("sp_SaveDocument", DocumentID, TipoID, PersonID, Archivo);

        if (tblUsr.Rows.Count > 0)
        {

            Mensaje = tblUsr.Rows[0]["msj"].ToString();
            Bandera = Convert.ToInt32(tblUsr.Rows[0]["Tipo"].ToString());
        }

        return Mensaje;
    }

    public DataTable TraeInfoUsuario(int opcion)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetPerson", PersonID, opcion);

        if (tbl.Rows.Count > 0)
        {
            if (PersonID != 0 && opcion == 0)
            {
                DataRow dr = tbl.Rows[0];

                PersonID = Convert.ToInt32(dr["Person_ID"].ToString());
                Nombre = dr["Name_RS"].ToString();
                APaterno = dr["First_Name"].ToString();
                AMaterno = dr["Second_Name"].ToString();
                RFC = dr["RFC"].ToString();
                Telefono = dr["Phone"].ToString();
                Email = dr["Email"].ToString();
                Rol = Convert.ToInt32(dr["Role_ID"].ToString());
                Oficina = Convert.ToInt32(dr["BranchOffice_ID"].ToString());
                FecIngreso = dr["Date_Admission"].ToString();
                User = dr["User_Name"].ToString();
                Password = dr["Password_User"].ToString();
                Foto = dr["Photo"].ToString();
                Status = Convert.ToInt32(dr["Status_ID"].ToString());

            }
        }

        return tbl;
    }

    public DataTable TraeInfoUsuario(String Busqueda)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SearchPerson", Busqueda);

        

        return tbl;
    }

    public void GuardaAcceso(int MenuID, int Menu)
    {
        DatosSql sql = new DatosSql();
        sql.Ejecutar("sp_SaveAccess", MenuID, PersonID, Menu);
    }

    public String GuardaCveAgente(int Cve_ID,int Cia,String Cve)
    {
        String Mensaje = "";
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SaveCveAgentCia",Cve_ID,AgenteID,Cia,Cve);

        if(tbl.Rows.Count>0)
        {
            Mensaje = tbl.Rows[0]["msj"].ToString();
        }

        return Mensaje;
    }

    public DataTable TraeCveAgente()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl  = sql.TraerDataTable("sp_GetCveAgent",AgenteID);

        return tbl;
    }

    private String ValidaFormulario(String Nombre,String AP,String AM,String Correo,String Usr)
    {
        String Error = "";

        if(Nombre+AP+AM == "")
        {
            Error += "<li>Debe de Ingresar un Nombre al Uusario.</li>";  
        }

        if(Correo == "")
        {
            Error += "<li>Debe de Ingresar un Correo al Usuario</li>";
        }
        else
        {
            String expresion;
             expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
             if (Regex.IsMatch(Correo, expresion))
             {
                 if (Regex.Replace(Correo, expresion, String.Empty).Length == 0)
                 {

                 }
                 else
                 {
                     Error += "<li>El formato del Correo Electronico no es valido</li>";
                 }

             }
             else
             {
                 Error += "<li>El formato del Correo Electronico no es valido</li>";
             }
        }

        if(Usr == "")
        {
            Error += "<li>No ha seleccionado Usuario aun</li>";
        }
        
       
        return Error;
    }

}



