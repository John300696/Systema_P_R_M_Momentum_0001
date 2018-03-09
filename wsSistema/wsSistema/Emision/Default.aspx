<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Emision_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function cleanCoin(e, thix) {
            var str = document.getElementById(thix.id).value;

            str.replace("$", "").replace(",", "");

            document.getElementById(thix.id).value = str;

        }


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
    <asp:MultiView ID="mvwPolizas" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwNuevaPoliza" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Nueva Poliza
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <table style="width: 100%; border: none; text-align: right;">

                <tr>
                    <td style="padding-right: 30px; width: 25%; height: 35px;">Ramo:</td>
                    <td>

                        <asp:DropDownList ID="ddlRamo" runat="server"></asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 30px; width: 25%; height: 35px;">SubRamo:</td>
                    <td>

                        <asp:DropDownList ID="ddlSubRamo" runat="server"></asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 30px; width: 25%; height: 35px;">Conducto:</td>
                    <td>

                        <asp:DropDownList ID="ddlCOnducto" runat="server">
                            <asp:ListItem Value="1" Text="AGENTE"></asp:ListItem>
                            <asp:ListItem Value="2" Text="ASESOR"></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="padding-right: 30px; width: 25%; height: 35px;">¿Quien solicito?:</td>
                    <td>

                        <asp:DropDownList ID="ddlSolicito" runat="server"></asp:DropDownList>

                    </td>
                </tr>
            </table>
            <div class="col-sm-12">
                <asp:Label ID="lblOrdenTrabajoID" runat="server" Text="0" Visible="false"></asp:Label>
                <asp:Label ID="lblidCLiente" runat="server" Text="0" Visible="false"></asp:Label>
                <asp:Label ID="lblidFlotilla" runat="server" Text="0" Visible="false"></asp:Label>
                <asp:Panel ID="pnlCliente" runat="server">

                    <asp:Label ID="Label1" runat="server" Visible="false" Text="0"></asp:Label>
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

                                            <asp:DropDownList ID="ddlTipoPersonaAsegurado" runat="server" AutoPostBack="true">
                                                <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <asp:MultiView ID="mvwDatosAsegurado" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="vwPF" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Nombre:</td>
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

                                                <asp:TextBox ID="txtFecNacimientoAsegurado" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
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

                                            <asp:TextBox ID="txtRFCAsegurado" runat="server"></asp:TextBox>
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

                                            <asp:TextBox ID="txtCodigoPostalAsegurado" runat="server"></asp:TextBox>
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
                            <asp:CheckBox ID="cbEsIgual" runat="server" Text="El Contratante tiene los mismos datos que el Asegurado" Checked="true" />
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

                                            <asp:DropDownList ID="ddlTipoPersonaContratante" runat="server" AutoPostBack="true">
                                                <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="asterisco">*</p>
                                        </td>
                                    </tr>
                                    <asp:MultiView ID="mvwDatosContratante" runat="server" ActiveViewIndex="0">
                                        <asp:View ID="View1" runat="server">
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Nombre:</td>
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
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px;">Y/O:</td>
                                        <td>

                                            <asp:TextBox ID="txtYOContratante" runat="server"></asp:TextBox>
                                            <p class="asterisco"></p>
                                        </td>
                                    </tr>
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

                                                <asp:TextBox ID="txtFecNacimientoContratante" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
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

                                            <asp:TextBox ID="txtRFCContratante" runat="server"></asp:TextBox>
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

                                            <asp:TextBox ID="txtCodigoPostalContratante" runat="server"></asp:TextBox>
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
                <asp:Panel ID="pnlInfoAdicionalDetalle" runat="server">
                    <div class="col-sm-12">
                        <h3>Detalle</h3>
                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
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
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <div class="col-sm-12">
                                    <br />
                                </div>
                            </asp:View>
                            <asp:View ID="vwEndososCancelacion" runat="server">
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </asp:Panel>
                <div class="col-sm-12">
                    <h3>Datos de la Poliza</h3>
                </div>
                <asp:Label ID="lblidPoliza" runat="server" Text="0" Visible="false"></asp:Label>
                <div class="col-sm-12" style="text-align: right;">
                    <br />
                    <div class="col-sm-6" style="text-align: right;">

                        <table style="width: 100%; border: none; text-align: right;">
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Número de Poliza</td>
                                <td>

                                    <asp:TextBox ID="txtNumPoliza" runat="server"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Número de Inciso</td>
                                <td>

                                    <asp:TextBox ID="txtInciso" runat="server"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
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
                                <td style="padding-right: 30px; height: 35px;">Documento de Cotización</td>
                                <td>


                                    <asp:Label ID="lblDocumentoCotizacion" runat="server"></asp:Label>
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
                                <td style="padding-right: 30px; height: 35px;">Fecha de Expedicion:</td>
                                <td>

                                    <asp:TextBox ID="txtFecEmision" runat="server" placeholder="dd/MM/yyyy" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Inicio de Vigencia:</td>
                                <td>

                                    <asp:TextBox ID="txtInicioVigencia" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Fin de Vigencia:</td>
                                <td>

                                    <asp:TextBox ID="txtFinVigencia" runat="server"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>




                        </table>
                    </div>

                    <div class="col-sm-6" style="text-align: right;">
                        <table style="width: 100%; border: none;">
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
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Descuento:</td>
                                <td>

                                    <asp:TextBox ID="txtDescuento" runat="server" Text="0.0" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Prima Neta:</td>
                                <td>

                                    <asp:TextBox ID="txtPrimaNeta" runat="server" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Financiamiento:</td>
                                <td>

                                    <asp:TextBox ID="txtFinanciamiento" runat="server" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Gastos por Expedicion:</td>
                                <td>

                                    <asp:TextBox ID="txtDerrechoPoliza" runat="server" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">I.V.A.:</td>
                                <td>

                                    <asp:TextBox ID="txtImpuestos" runat="server" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Prima Total:</td>
                                <td>

                                    <asp:TextBox ID="txtPrimaTotal" runat="server" onkeypress="return cleanCoin(event,this);"></asp:TextBox>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Moneda:</td>
                                <td>

                                    <asp:DropDownList ID="ddlMoneda" runat="server">
                                        <asp:ListItem Value="1" Text="PESOS MEXICANOS (MXN)"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="DOLARES (USD)"></asp:ListItem>
                                    </asp:DropDownList>
                                    <p class="asterisco"></p>
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
                                <td style="padding-right: 30px; height: 35px;">Status Poliza:</td>
                                <td>

                                    <asp:DropDownList ID="ddlStatusPoliza" runat="server">
                                        <asp:ListItem Value="1" Text="ACTIVA"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="INACTIVA"></asp:ListItem>
                                    </asp:DropDownList>
                                    <p class="asterisco">*</p>
                                </td>
                            </tr>


                            <tr>
                                <td colspan="2">
                                    <br />
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnGuardarPoliza" runat="server" Text="GUARDAR INFORMACION" CssClass="Boton_PRM" OnClick="btnGuardarPoliza_Click" />
                                    </div>

                                </td>
                            </tr>


                        </table>
                    </div>


                </div>
                <div class="col-sm-12">
                    <asp:Panel ID="pnlInfoAdicional" runat="server" Visible="true">
                        <div class="col-sm-12" style="text-align: center;">
                            <div class="col-sm-2">
                                <asp:LinkButton ID="lnkCOberturas" runat="server" Text="COBERTURAS" CssClass="Boton_PRM_LINK" OnClick="lnkCOberturas_Click" />
                            </div>
                            <div class="col-sm-2">
                                <asp:LinkButton ID="lnkDocumentos" runat="server" Text="DOCUMENTOS" CssClass="Boton_PRM_LINK" OnClick="lnkDocumentos_Click"></asp:LinkButton>
                            </div>
                            <div class="col-sm-2">
                                <asp:LinkButton ID="lnkRecibos" runat="server" Text="RECIBOS" CssClass="Boton_PRM_LINK" OnClick="lnkRecibos_Click" />
                            </div>
                        </div>
                        <asp:MultiView ID="mvwInfoAdicional" runat="server" ActiveViewIndex="0">
                            <asp:View ID="vwCoberturas" runat="server">
                            </asp:View>
                            <asp:View ID="vwDocumentacion" runat="server">
                                <table style="width: 100%; border: none; text-align: left;">
                                    <tr>
                                        <td style="width: 10px">
                                            <br />
                                        </td>

                                        <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 150px;">Documentación
                                        </td>
                                        <td>
                                            <hr style="border: 2px solid #317ABF; width: 100%;" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="col-sm-12" style="text-align: right;">
                                    <div class="col-sm-6" style="text-align: right;">
                                        <br />
                                        <br />
                                        <table style="width: 100%; border: none;">

                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Nombre del Documento:</td>
                                                <td>
                                                    <asp:FileUpload ID="fuDocumento" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Tipo de Documento:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTipoDocumento" runat="server">
                                                        <asp:ListItem Value="1" Text="CARATULA"></asp:ListItem>

                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-6 col-sm-offset-6">
                                                        <asp:Button ID="btmGuardaDocumentos" runat="server" Text="GUARDAR DOCUMENTOS" CssClass="Boton_PRM" OnClick="btmGuardaDocumentos_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-6" style="text-align: right;">

                                        <div class="col-sm-12">
                                            <asp:GridView ID="gvDocument" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>

                                                    <asp:TemplateField HeaderText="Documentos">
                                                        <ItemTemplate>
                                                            <%#Eval("Name_Document") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Documentos">
                                                        <ItemTemplate>
                                                            <a href='Files/<%#Eval("Name_Document") %>' target="_blank">DESCARGAR</a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                    </div>

                                </div>
                            </asp:View>

                            <asp:View ID="vwRecibos" runat="server">
                                <table style="width: 100%; border: none; text-align: left;">
                                    <tr>
                                        <td style="width: 10px">
                                            <br />
                                        </td>
                                        <td style="width: 80px">
                                            <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                        </td>
                                        <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Administración de Recibos
                                        </td>
                                        <td>
                                            <hr style="border: 2px solid #317ABF; width: 100%;" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="col-sm-12" style="text-align: right;">
                                    <br />

                                    <div class="col-sm-6" style="text-align: right;">
                                        <asp:Label ID="lblReciboID" runat="server" Visible="false"></asp:Label>
                                        <table style="width: 100%; border: none;">


                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Recibo No.:</td>
                                                <td>

                                                    <asp:TextBox ID="txtReciboNo" runat="server"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Fecha de Emisión:</td>
                                                <td>

                                                    <asp:TextBox ID="txtFecEMisionRecibo" runat="server" placeholder="dd/MM/yyyy" onkeypress="return onKeyDate(event,this);"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Periodo (Desde):</td>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 60%">
                                                                <asp:TextBox ID="txtPeriodoDesde" runat="server" placeholder="dd/MM/yyyy" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtHoraDesde" runat="server" Text="12:00 PM"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>




                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Periodo (Hasta):</td>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 60%">
                                                                <asp:TextBox ID="txtPeriodoHasta" runat="server" placeholder="dd/MM/yyyy" onkeypress="return onKeyDate(event,this);"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtHoraHasta" runat="server" Text="12:00 PM"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>



                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40%; padding-right: 30px; height: 35px;">Fecha Limite de Pago:</td>
                                                <td>

                                                    <asp:TextBox ID="txtFecLimitePago" runat="server" placeholder="dd/MM/yyyy" onkeypress="return onKeyDate(event,this);"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Importe a Pagar:</td>
                                                <td>

                                                    <asp:TextBox ID="txtImportePagar" runat="server"></asp:TextBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Documento:</td>
                                                <td>

                                                    <asp:FileUpload ID="fuDocumentoRecibo" runat="server" />
                                                    <asp:Label ID="lblDocumento" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-12">
                                                        <asp:Button ID="btnGUardarRecibo" runat="server" Text="GUARDAR RECIBO" CssClass="Boton_PRM" OnClick="btnGUardarRecibo_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="col-sm-6" style="text-align: right;">
                                        <asp:GridView ID="gvRecibos" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                            <Columns>

                                                <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                                <asp:ButtonField HeaderText="Fecha de Emsion" DataTextField="EmissionDate" />
                                                <asp:TemplateField HeaderText="Desde">
                                                    <ItemTemplate>
                                                        <%#Eval("SinceDate") %><br />
                                                        <%#Eval("SinceTime") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hasta">
                                                    <ItemTemplate>
                                                        <%#Eval("VigenceDate") %><br />
                                                        <%#Eval("VigenceTime") %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                                <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                                <asp:TemplateField HeaderText="Archivo">
                                                    <ItemTemplate>
                                                        <a href="Receipts/<%#Eval("Document_Name") %>" target="_blank">DESCARGAR</a>

                                                    </ItemTemplate>
                                                </asp:TemplateField>

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
                                </div>
                            </asp:View>
                        </asp:MultiView>
                    </asp:Panel>
                </div>
            </div>

        </asp:View>
        <asp:View ID="vwVerPolizas" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Administración de Polizas
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>

            <div class="col-sm-12">
                <table style="width: 100%; border: none;">


                    <tr>
                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Serie o Poliza:</td>
                        <td style="padding-right: 30px; height: 35px; width: 25%;">

                            <asp:DropDownList ID="ddlBusqueda" runat="server">
                                <asp:ListItem Value="1" Text="NÚMERO DE POLIZA"></asp:ListItem>
                                <asp:ListItem Value="2" Text="NÚMERO DE SERIE"></asp:ListItem>
                                <asp:ListItem Value="3" Text="CLIENTE"></asp:ListItem>
                                <asp:ListItem Value="4" Text="COMPAÑIA"></asp:ListItem>
                                <asp:ListItem Value="5" Text="FECHA DE EXPEDICIÓN"></asp:ListItem>

                            </asp:DropDownList>

                        </td>
                        <td style="padding-right: 30px; height: 35px; width: 25%;">

                            <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>

                        </td>
                        <td>
                            <div class="col-sm-8 col-sm-offset-4">
                                <asp:Button ID="btnBuscar" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar_Click" />
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
            </div>

            <div class="col-sm-12">

                <asp:GridView ID="gvPolizas" CssClass="table table-bordered" OnRowCommand="gvOrdenesTrabajo_RowCommand" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="VerPoliza" CommandArgument='<%#Eval("Work_Order_ID") %>' ToolTip="Ver Poliza" />
                                <asp:ImageButton ID="imgEmitir" runat="server" ImageUrl="~/images/icons/check.png" CssClass="Botones" CommandName="Emitir" CommandArgument='<%#Eval("Work_Order_ID") %>' ToolTip="Modificar Poliza" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderText="Número de Poliza" DataTextField="Number_Policy" />
                        <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                        <asp:ButtonField HeaderText="Cliente" DataTextField="Name_RS" />
                        <asp:ButtonField HeaderText="Numero de Serie" DataTextField="Serie" />
                        <asp:ButtonField HeaderText="Fecha de Expedición" DataTextField="Date_Expedition" />
                        <asp:ButtonField HeaderText="Inicio de Vigencia" DataTextField="Start_Term" />
                        <asp:ButtonField HeaderText="Fin de Vigencia" DataTextField="End_Term" />

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
        <asp:View ID="vwDetallePoliza" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Detalle de Poliza
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12">
                <asp:Panel ID="pnlInfoPoliza" runat="server" Visible="true">

                    <asp:Label ID="lblidPolizaDetalle" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblidOrdenTrabajoDetalle" runat="server" Visible="false"></asp:Label>

                    <h3>Número de Poliza:
                        <asp:Label ID="lblNumeroPoliza" runat="server"></asp:Label>
                        <br />
                        Inciso:
                        <asp:Label ID="lblInciso" runat="server"></asp:Label>
                    </h3>

                    <div class="col-sm-12" style="text-align: center;">
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnKPoliza" runat="server" Text="POLIZA" CssClass="Boton_PRM_LINK" OnClick="lnlPoliza_Click" />
                        </div>
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnkRecibosPoliza" runat="server" Text="RECIBOS" CssClass="Boton_PRM_LINK" OnClick="lnkRecibosPoliza_Click"></asp:LinkButton>
                        </div>
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnkMovimientosPoliza" runat="server" Text="MOVIMIENTOS" CssClass="Boton_PRM_LINK" OnClick="lnkMovimientosPoliza_Click" />
                        </div>
                    </div>
                    <asp:MultiView ID="mvwInfoPoliza" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vwPoliza" runat="server">
                            <div class="col-sm-12">
                                <br />
                                <br />
                            </div>
                            <div class="col-sm-8">
                                <table style="width: 100%; border: none;">
                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 150px">
                                            <h4>Correo a Enviar:</h4>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtCorreoEnviar" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="padding-right: 30px; height: 35px; width: 150px">
                                            <h4>
                                                <asp:LinkButton ID="lnkEnviarPolizaMail" runat="server" Text="ENVIAR POLIZA" OnClick="lnkEnviarPolizaMail_Click"></asp:LinkButton></h4>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-sm-12">
                                <iframe id="ifrPDF" runat="server" style="width: 100%; height: 800px"></iframe>
                            </div>
                        </asp:View>

                        <asp:View ID="vwRecibosDetalle" runat="server">

                            <div class="col-sm-12">
                                <asp:GridView ID="gvRecibosDetalle" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                    <Columns>

                                        <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                        <asp:ButtonField HeaderText="Fecha de Emsion" DataTextField="EmissionDate" />
                                        <asp:TemplateField HeaderText="Desde">
                                            <ItemTemplate>
                                                <%#Eval("SinceDate") %><br />
                                                <%#Eval("SinceTime") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hasta">
                                            <ItemTemplate>
                                                <%#Eval("VigenceDate") %><br />
                                                <%#Eval("VigenceTime") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                        <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                        <asp:TemplateField HeaderText="Archivo">
                                            <ItemTemplate>
                                                <a href="Receipts/<%#Eval("Document_Name") %>" target="_blank">DESCARGAR</a>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:ButtonField HeaderText="Status" DataTextField="Status" />
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
                    </asp:MultiView>
                </asp:Panel>

            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

