using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Descripción breve de cClientes
/// </summary>
public class cClientes
{
    /*Atributos*/
    private int _ClienteId;
    private String _NombreRS;
    private String _RFC;
    private int _idTipoPersona;
    private String _GiroNegocio;
    private String _CalleNumero;
    private String _Colonia;
    private String _CodigoPostal;
    private String _Municipio;
    private int _Canal;
    private int _CanalID;
    private String _EntidadFederativa;
    private String _NombreContacto;
    private String _TelefonoContacto;
    private String _CorreoContacto;
    private String _Observaciones;
    private int _idStatus;
    private int _Bandera;
    private int _idFLotilla;


    /*Propiedades*/

    #region Propiedades
    public int ClienteId
    {
        get { return _ClienteId; }
        set { _ClienteId = value; }
    }
    public String NombreRS
    {
        get { return _NombreRS; }
        set { _NombreRS = value; }
    }


    public String RFC
    {
        get { return _RFC; }
        set { _RFC = value; }
    }

    public int idTipoPersona
    {
        get { return _idTipoPersona; }
        set { _idTipoPersona = value; }
    }

    public String GiroNegocio
    {
        get { return _GiroNegocio; }
        set { _GiroNegocio = value; }
    }

    public String CalleNumero
    {
        get { return _CalleNumero; }
        set { _CalleNumero = value; }
    }


    public String Colonia
    {
        get { return _Colonia; }
        set { _Colonia = value; }
    }


    public String CodigoPostal
    {
        get { return _CodigoPostal; }
        set { _CodigoPostal = value; }
    }


    public String Municipio
    {
        get { return _Municipio; }
        set { _Municipio = value; }
    }


    public String EntidadFederativa
    {
        get { return _EntidadFederativa; }
        set { _EntidadFederativa = value; }
    }

    public int Canal
    {
        get { return _Canal; }
        set { _Canal = value; }
    }
    public int CanalID
    {
        get { return _CanalID; }
        set { _CanalID = value; }
    }

    public String NombreContacto
    {
        get { return _NombreContacto; }
        set { _NombreContacto = value; }
    }

    public String TelefonoContacto
    {
        get { return _TelefonoContacto; }
        set { _TelefonoContacto = value; }
    }


    public String CorreoContacto
    {
        get { return _CorreoContacto; }
        set { _CorreoContacto = value; }
    }


    public String Observaciones
    {
        get { return _Observaciones; }
        set { _Observaciones = value; }
    }

    public int idStatus
    {
        get { return _idStatus; }
        set { _idStatus = value; }
    }

    public int Bandera
    {
        get { return _Bandera; }
        set { _Bandera = value; }
    }

    public int idFlotilla
    {
        get { return _idFLotilla; }
        set { _idFLotilla = value; }
    }

    #endregion

    /*Constructores*/


    public cClientes()
    {
       
    }

    /*Para guardar cliente*/
    public cClientes(int ClienteId_C, String Nombre_C, String RFC_C, int idPersona_C, String GiroNegocio_C, String CalleNum_C, String Colonia_C, String CodigoPostal_C, String Municipio_C, String Entidad_C, int Canal_C, int CanalID_C, String NombreContacto_C,String TelefonoContacto_C,String CorreoContacto_C,String Observaciones_C,int idStatus_C)
    {
        ClienteId = ClienteId_C;
        NombreRS = Nombre_C;
        RFC = RFC_C;
        idTipoPersona = idPersona_C;
        GiroNegocio = GiroNegocio_C;
        CalleNumero = CalleNum_C;
        Colonia = Colonia_C;
        CodigoPostal = CodigoPostal_C;
        Municipio = Municipio_C;
        EntidadFederativa = Entidad_C;
        Canal = Canal_C;
        CanalID = CanalID_C;
        NombreContacto = NombreContacto_C;
        TelefonoContacto = TelefonoContacto_C;
        CorreoContacto = CorreoContacto_C;
        Observaciones = Observaciones_C;
        idStatus = idStatus_C;
    }

    /*Trae persona por Id*/
    public cClientes(int ClienteId_C)
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetClient", ClienteId_C);

        ClienteId = ClienteId_C;

        if (tbl.Rows.Count>0)
        {
            NombreRS = tbl.Rows[0]["Name_RS"].ToString();
            RFC = tbl.Rows[0]["RFC"].ToString();
            idTipoPersona = Convert.ToInt32(tbl.Rows[0]["Type_Person"].ToString());
            GiroNegocio = tbl.Rows[0]["Bussiness"].ToString();
            CalleNumero = tbl.Rows[0]["Address"].ToString();
            Colonia = tbl.Rows[0]["Boulevard"].ToString();
            CodigoPostal = tbl.Rows[0]["ZIP"].ToString();
            Municipio = tbl.Rows[0]["Municipality"].ToString();
            EntidadFederativa = tbl.Rows[0]["Federal_Entity"].ToString();
            NombreContacto = tbl.Rows[0]["Contact_Name"].ToString();
            TelefonoContacto = tbl.Rows[0]["Contact_Phone"].ToString();
            CorreoContacto = tbl.Rows[0]["Contact_Email"].ToString();
            Observaciones = tbl.Rows[0]["Additional_Information"].ToString();
            idStatus = Convert.ToInt32(tbl.Rows[0]["Status"].ToString());
        }


    }

    /**/
    #region Metodos

    public String GuardaCliente(int idPersonaReg)
    {
        String Mensaje = "";

        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_SaveClient", ClienteId, NombreRS, idTipoPersona, RFC, GiroNegocio, CalleNumero, Colonia, CodigoPostal, EntidadFederativa, Municipio, Canal,CanalID, NombreContacto,TelefonoContacto,CorreoContacto,Observaciones, idPersonaReg, idStatus);

        if (tbl.Rows.Count > 0)
        {
            ClienteId = Convert.ToInt32(tbl.Rows[0]["Cliente_ID"].ToString());
            Bandera = Convert.ToInt32(tbl.Rows[0]["Tipo"].ToString());
            Mensaje = tbl.Rows[0]["msj"].ToString();
        }

        return Mensaje;
    }

    public String GuardaFlotillas(int idFlotill,String Flotilla,int Status)
    {
        DatosSql sql = new DatosSql();
        String Mensaje = "";

        DataTable tbl = sql.TraerDataTable("sp_SaveSubClient", idFlotill,ClienteId,Flotilla,Status);

        if (tbl.Rows.Count > 0)
        {
            idFlotilla = Convert.ToInt32(tbl.Rows[0]["SubCliente_ID"].ToString());
            Bandera = Convert.ToInt32(tbl.Rows[0]["Tipo"].ToString());
            Mensaje = tbl.Rows[0]["msj"].ToString();
        }

        return Mensaje;
    }

    public DataTable TraeFlotillas()
    {
        DatosSql sql = new DatosSql();

        DataTable tbl = sql.TraerDataTable("sp_GetSubclient", ClienteId);

        return tbl;
    }

    public DataTable TraeClientes()
    {
        DatosSql sql = new DatosSql();
        DataTable tbl = sql.TraerDataTable("sp_GetClient", ClienteId);

        return tbl;
    }

    

    #endregion

}