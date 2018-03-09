<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="OrdenesTrabajo_Default" %>

<%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function onKeyDate(e, thix) {
            var str = document.getElementById(thix.id).value;
            var long = str.length;

            if (long == 2 || long == 5) {
                str = str + "/";
            }
            else if (long > 10) {
                str = str.substring(0, 9);
            }

            document.getElementById(thix.id).value = str;

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwOrdenesTrabajo" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwNuevaOrdenTrabajo" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Nueva Orden de Trabajo
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12">
                <asp:Label ID="lblOrdenTrabajoID" runat="server" Visible="false"></asp:Label>
                <br />
                <table style="width: 90%; border: none; text-align: right;">
                    <tr>
                        <td style="padding-right: 30px; width: 25%; height: 35px;"><b>
                            <h3>
                                <asp:Label ID="lblFolio" runat="server" Font-Bold="true"></asp:Label></h3>
                        </b></td>
                        <td style="text-align: right;">

                            <h3>
                                <asp:Label ID="lblFecha" runat="server"></asp:Label></h3>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">Tipo de Orden de Trabajo:</td>
                        <td>

                            <asp:DropDownList ID="ddlOrdenTrabajo" runat="server" OnSelectedIndexChanged="ddlOrdenTrabajo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">Ramo:</td>
                        <td>

                            <asp:DropDownList ID="ddlRamo" runat="server" OnSelectedIndexChanged="ddlRamo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">SubRamo:</td>
                        <td>

                            <asp:DropDownList ID="ddlSubRamo" runat="server" OnSelectedIndexChanged="ddlSubRamo_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">Conducto:</td>
                        <td>

                            <asp:DropDownList ID="ddlCOnducto" runat="server" OnSelectedIndexChanged="ddlCOnducto_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="1" Text="AGENTE"></asp:ListItem>
                                <asp:ListItem Value="2" Text="ASESOR"></asp:ListItem>
                            </asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">¿Quien solicito?:</td>
                        <td>

                            <asp:DropDownList ID="ddlSolicito" runat="server"></asp:DropDownList>

                        </td>
                    </tr>
                </table>
                <div class="col-sm-12">
                    <br />
                    <p class="asterisco">* Campos Obligatorios</p>
                </div>
                <asp:Panel ID="pnlPoliza" runat="server">
                </asp:Panel>
                <asp:Panel ID="pnlCliente" runat="server">

                    <asp:Label ID="lblidCliente" runat="server" Visible="false" Text="0"></asp:Label>
                    <asp:Panel ID="pnlAsegurado" runat="server">
                        <h3>Información del Asegurado</h3>
                        <asp:Label ID="lblidAsegurado" runat="server" Visible="false"></asp:Label>
                        <div class="col-sm-12" style="text-align: right;">
                            <br />

                            <div class="col-sm-6" style="text-align: right;">
                                <table style="width: 100%; border: none; text-align: right;">

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Tipo de Persona:</td>
                                        <td>

                                            <asp:DropDownList ID="ddlTipoPersonaAsegurado" runat="server" OnSelectedIndexChanged="ddlTipoPersonaAsegurado_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <asp:MultiView ID="mvwDatosAsegurado" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="vwPF" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Nombre (s):</td>
                                                <td>

                                                    <asp:TextBox ID="txtNombreAsegurado" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Apellido Paterno:</td>
                                                <td>

                                                    <asp:TextBox ID="txtAPAsegurado" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Apellido Materno:</td>
                                                <td>

                                                    <asp:TextBox ID="txtAMAsegurado" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                        </asp:View>
                                        <asp:View ID="vwPM" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Razón Social:</td>
                                                <td>

                                                    <asp:TextBox ID="txtRazonSocialAsegurado" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                        </asp:View>
                                    </asp:MultiView>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Y/O:</td>
                                        <td>

                                            <asp:TextBox ID="txtYOAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="pnlPFAsegurado" runat="server">
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Sexo:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlSexoAsegurado" runat="server">
                                                    <asp:ListItem Value="1" Text="MASCULINO"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="FEMENINO"></asp:ListItem>
                                                </asp:DropDownList>
                                                <p class="asterisco"></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Fecha de Nacimiento:</td>
                                            <td>

                                                <asp:TextBox ID="txtFecNacimientoAsegurado" runat="server" placeholder="dd/MM/yyyy" AutoPostBack="true" OnTextChanged="txtFecNacimiento_TextChanged" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                                <p class="asterisco">*</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">C.U.R.P.:</td>
                                            <td>

                                                <asp:TextBox ID="txtCURPAsegurado" runat="server"></asp:TextBox>
                                                <p class="asterisco"></p>
                                            </td>
                                        </tr>
                                    </asp:Panel>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">R.F.C.:</td>
                                        <td>

                                            <asp:TextBox ID="txtRFCAsegurado" runat="server" OnTextChanged="txtRFCAsegurado_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%;">Giro de Negocio:</td>
                                        <td>

                                            <asp:TextBox ID="txtGiroNegocioAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>

                                </table>
                            </div>

                            <div class="col-sm-6" style="text-align: right;">
                                <table style="width: 100%; border: none; text-align: right;">
                                    <tr>
                                        <td style="width: 40%; padding-right: 30px; height: 35px;">Calle y Número:</td>
                                        <td>

                                            <asp:TextBox ID="txtCalleNumeroAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%">Código Postal:</td>
                                        <td>

                                            <asp:TextBox ID="txtCodigoPostalAsegurado" runat="server" OnTextChanged="txtCodigoPostalAsegurado_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%">Colonia:</td>
                                        <td>

                                            <asp:DropDownList ID="ddlColoniaAsegurado" runat="server"></asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Estado:</td>
                                        <td>

                                            <asp:TextBox ID="txtEstadoAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Municipio:</td>
                                        <td>

                                            <asp:TextBox ID="txtMunicipioAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Telefono de Contacto:</td>
                                        <td>

                                            <asp:TextBox ID="txtTelefonoAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Correo de Contacto:</td>
                                        <td>

                                            <asp:TextBox ID="txtCorreoAsegurado" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>



                                </table>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <asp:CheckBox ID="cbEsIgual" runat="server" Text="El Contratante tiene los mismos datos que el Asegurado" Checked="true" AutoPostBack="true" OnCheckedChanged="cbEsIgual_CheckedChanged" />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlContratante" runat="server" Visible="false">
                        <h3>Información del Contratante</h3>
                        <asp:Label ID="lblidContratante" runat="server" Visible="false"></asp:Label>
                        <div class="col-sm-12" style="text-align: right;">
                            <br />

                            <div class="col-sm-6">
                                <table style="width: 100%; border: none; text-align: right;">

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%;">Tipo de Persona:</td>
                                        <td>

                                            <asp:DropDownList ID="ddlTipoPersonaContratante" runat="server" OnSelectedIndexChanged="ddlTipoPersonaContratante_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <asp:MultiView ID="mvwDatosContratante" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="View1" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Nombre (s):</td>
                                                <td>

                                                    <asp:TextBox ID="txtNombreContratante" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Apellido Paterno:</td>
                                                <td>

                                                    <asp:TextBox ID="txtAPContratante" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Apellido Materno:</td>
                                                <td>

                                                    <asp:TextBox ID="txtAMContratante" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                        </asp:View>
                                        <asp:View ID="View2" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Razón Social:</td>
                                                <td>

                                                    <asp:TextBox ID="txtRazonSocialContratante" runat="server"></asp:TextBox>
                                                    <p class="asterisco">*</p>
                                                </td>
                                            </tr>
                                        </asp:View>
                                    </asp:MultiView>
                                    <asp:Panel ID="pnlYO" runat="server" Visible="false">
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Y/O:</td>
                                            <td>

                                                <asp:TextBox ID="txtYOContratante" runat="server"></asp:TextBox>
                                                <p class="asterisco"></p>
                                            </td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="pnlPFContratante" runat="server">
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Sexo:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlSexoContratante" runat="server">
                                                    <asp:ListItem Value="1" Text="MASCULINO"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="FEMENINO"></asp:ListItem>
                                                </asp:DropDownList>
                                                <p class="asterisco"></p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Fecha de Nacimiento:</td>
                                            <td>

                                                <asp:TextBox ID="txtFecNacimientoContratante" runat="server" AutoPostBack="true" placeholder="dd/MM/yyyy" OnTextChanged="txtFecNacimientoContratante_TextChanged" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                                <p class="asterisco">*</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">C.U.R.P.:</td>
                                            <td>

                                                <asp:TextBox ID="txtCURPContratante" runat="server"></asp:TextBox>
                                                <p class="asterisco"></p>
                                            </td>
                                        </tr>
                                    </asp:Panel>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">R.F.C.:</td>
                                        <td>

                                            <asp:TextBox ID="txtRFCContratante" runat="server" OnTextChanged="txtRFCContratante_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Giro de Negocio:</td>
                                        <td>

                                            <asp:TextBox ID="txtGiroNegocioContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>

                                </table>
                            </div>

                            <div class="col-sm-6" style="text-align: right;">
                                <table style="width: 100%; border: none;">
                                    <tr>
                                        <td style="width: 40%; padding-right: 30px; height: 35px;">Calle y Número:</td>
                                        <td>

                                            <asp:TextBox ID="txtCalleNumeroContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%">Código Postal:</td>
                                        <td>

                                            <asp:TextBox ID="txtCodigoPostalContratante" runat="server" OnTextChanged="txtCodigoPostalContratante_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 40%">Colonia:</td>
                                        <td>

                                            <asp:DropDownList ID="ddlColoniaContratante" runat="server"></asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Estado:</td>
                                        <td>

                                            <asp:TextBox ID="txtEstadoContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Municipio:</td>
                                        <td>

                                            <asp:TextBox ID="txtMunicipioContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Telefono de Contacto:</td>
                                        <td>

                                            <asp:TextBox ID="txtTelefonoContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Correo de Contacto:</td>
                                        <td>

                                            <asp:TextBox ID="txtCorreoContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>



                                </table>
                            </div>
                        </div>
                    </asp:Panel>


                </asp:Panel>
                <asp:Panel ID="pnlInfoAdicional" runat="server">
                    <div class="col-sm-12">
                        <h3>Detalle</h3>
                        <asp:MultiView ID="mvwInfoAdicional" runat="server" ActiveViewIndex="0">
                            <asp:View ID="vwCotizacionEmision" runat="server">
                                <asp:Repeater ID="rptInfoAdicional" runat="server" OnItemDataBound="rptInfoAdicional_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="col-sm-6">

                                            <table style="width: 100%; border: none; text-align: right;">
                                                <tr>
                                                    <td style="padding-right: 30px; width: 40%; height: 35px;"><%#Eval("BranchInfo") %>:</td>
                                                    <td>
                                                        <asp:Label ID="lblID" runat="server" Visible="false" Text='<%#Eval("BranchInfo_ID") %>'></asp:Label>
                                                        <asp:Label ID="lblTipo" runat="server" Visible="false" Text='<%#Eval("Type") %>'></asp:Label>
                                                        <asp:Label ID="lblCatalogo" runat="server" Visible="false" Text='<%#Eval("Catalog") %>'></asp:Label>
                                                        <asp:TextBox ID="txtInformacion" runat="server" Visible="false"></asp:TextBox>
                                                        <asp:DropDownList ID="ddlCatalogo" runat="server" Visible="false"></asp:DropDownList>
                                                        <p class="asterisco">
                                                            <asp:Label ID="lblValida" runat="server" Text='<%#Eval("Required") %>'></asp:Label></p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="col-sm-12">
                                    <br />
                                </div>
                                <asp:Panel ID="pnlEmision" runat="server">
                                    <div class="col-sm-12" style="padding: 0px;">
                                        <h3>Información Requerida para Emitir</h3>
                                        <asp:Label ID="lblidPoliza" runat="server" Text="0" Visible="false"></asp:Label>
                                        <div class="col-sm-12" style="text-align: right;">



                                            <div class="col-sm-6" style="text-align: right;">
                                                <table style="width: 100%; border: none; text-align: right;">
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px; width: 40%">Poliza Anterior</td>
                                                        <td>

                                                            <asp:TextBox ID="txtPolizaAnterior" runat="server"></asp:TextBox>
                                                            <p class="asterisco"></p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Número de Cotización</td>
                                                        <td>

                                                            <asp:TextBox ID="txtNumeroCOtizacion" runat="server"></asp:TextBox>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Tipo de Poliza</td>
                                                        <td>

                                                            <asp:DropDownList ID="ddlTipoPoliza" runat="server">
                                                                <asp:ListItem Value="1" Text="INDIVIDUAL"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="FLOTILLA"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Beneficiario Preferente</td>
                                                        <td>

                                                            <asp:TextBox ID="txtBeneficiarioPreferente" runat="server"></asp:TextBox>
                                                            <p class="asterisco"></p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px; width: 40%">Compañia:</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCia" runat="server">
                                                                <asp:ListItem Value="1" Text="AXA"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="GNP"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-sm-6">
                                                <table style="width: 100%; border: none; text-align: right;">


                                                    <tr>
                                                        <td style="width: 40%; padding-right: 30px; height: 35px;">Inicio de Vigencia:</td>
                                                        <td>

                                                            <asp:TextBox ID="txtInicioVigencia" runat="server" OnTextChanged="txtInicioVigencia_TextChanged" placeholder="dd/MM/yyyy" AutoPostBack="true" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 40%; padding-right: 30px; height: 35px;">Fin de Vigencia:</td>
                                                        <td>

                                                            <asp:TextBox ID="txtFinVigencia" placeholder="dd/MM/yyyy" runat="server"></asp:TextBox>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Cobertura:</td>
                                                        <td>

                                                            <asp:DropDownList ID="ddlCObertura" runat="server">
                                                                <asp:ListItem Value="1" Text="AMPLIA"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="ESTANDAR"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Forma de Pago:</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlFormaPago" runat="server">
                                                                <asp:ListItem Value="1" Text="ANUAL"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="MENSUAL"></asp:ListItem>
                                                                <asp:ListItem Value="3" Text="CUATRIMESTRAL"></asp:ListItem>
                                                                <asp:ListItem Value="4" Text="BIMESTRAL"></asp:ListItem>
                                                                <asp:ListItem Value="5" Text="SEMESTRAL"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Documento de Cotización</td>
                                                        <td>

                                                            <asp:FileUpload ID="fuDocumento" runat="server" />
                                                            <p class="asterisco">*</p>
                                                        </td>
                                                    </tr>


                                                </table>
                                            </div>

                                        </div>
                                    </div>
                                </asp:Panel>
                            </asp:View>
                            <asp:View ID="vwEndososCancelacion" runat="server">
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlInfoExtra" runat="server">
                    <div class="col-sm-12">
                        <h3>Información Adicional</h3>
                        <div class="col-sm-12">
                            <asp:TextBox ID="txtInformacionAdicional" Height="100px" Width="100%" TextMode="MultiLine" runat="server"></asp:TextBox>

                        </div>
                    </div>
                </asp:Panel>
            </div>

            <div class="col-sm-6 col-sm-offset-3">
                <br />
                <br />
                <asp:Button ID="btnEnviarOrdenTrabajo" runat="server" Text="ENVIAR ORDEN DE TRABAJO" CssClass="Boton_PRM" OnClick="btnEnviarOrdenTrabajo_Click" />

            </div>

        </asp:View>
        <asp:View ID="vwOrdenesTrabajoPendientes" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Ordenes de Trabajo
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12">

                <asp:GridView ID="gvOrdenesTrabajo" CssClass="table table-bordered" OnRowCommand="gvOrdenesTrabajo_RowCommand" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="VerOT" CommandArgument='<%#Eval("Work_Order_ID") %>' ToolTip="Ver Orden de Trabajo" />
                                <asp:ImageButton ID="imgEmitir" runat="server" ImageUrl="~/images/icons/check.png" CssClass="Botones" CommandName="Emitir" CommandArgument='<%#Eval("Work_Order_ID") %>' ToolTip="Emitir Poliza" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderText="Folio" DataTextField="Folio" />
                        <asp:ButtonField HeaderText="Tipo" DataTextField="Type_Work_Order" />
                        <asp:ButtonField HeaderText="SubRamo" DataTextField="Branch" />
                        <asp:ButtonField HeaderText="¿Quien Solicito?" DataTextField="NameC" />
                        <asp:ButtonField HeaderText="Cliente/Prospecto" DataTextField="Name_RS" />
                        <asp:ButtonField HeaderText="Telefono" DataTextField="Contact_Phone" />
                        <asp:ButtonField HeaderText="Email" DataTextField="Contact_Email" />
                        <asp:ButtonField HeaderText="Fecha" DataTextField="Registered_Date" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />

                </asp:GridView>
            </div>

        </asp:View>
        <asp:View ID="vwVerOrdenTrabajo" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Ver orden de Trabajo
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblIdOrden" runat="server" Visible="false"></asp:Label>
            <iframe id="ifrPDF" runat="server" style="width: 100%; height: 800px"></iframe>
            <div class="col-sm-6 col-sm-offset-3">
                <br />
                <br />
                <asp:Button ID="btnEmitir" runat="server" Text="EMITIR POLIZA" CssClass="Boton_PRM" OnClick="btnEmitir_Click" />

            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

