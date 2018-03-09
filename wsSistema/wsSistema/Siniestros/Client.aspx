<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Client.aspx.cs" Inherits="Siniestros_Client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwClientes" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwRegistroCliente" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Datos Generales del Cliente
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12" style="text-align: right;">
                <br />
                <asp:Label ID="lblidCliente" runat="server" Visible="false" Text="0"></asp:Label>
                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">


                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Nombre o Razón Social:</td>
                            <td>

                                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">R.F.C.:</td>
                            <td>

                                <asp:TextBox ID="txtRFC" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Tipo de Persona:</td>
                            <td>

                                <asp:DropDownList ID="ddlTipoPersona" runat="server">
                                    <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Giro de Negocio:</td>
                            <td>

                                <asp:TextBox ID="txtGiroNegocio" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Calle y Número:</td>
                            <td>

                                <asp:TextBox ID="txtCalleNumero" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Código Postal:</td>
                            <td>

                                <asp:TextBox ID="txtCP" runat="server" OnTextChanged="txtCP_TextChanged" AutoPostBack="true"></asp:TextBox>

                            </td>
                        </tr>






                    </table>
                </div>

                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">

                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Colonia:</td>
                            <td>

                                <asp:DropDownList ID="ddlColonia" runat="server">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Entidad Federativa:</td>
                            <td>

                                <asp:TextBox ID="txtEntidadFederativa" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Municipio:</td>
                            <td>

                                <asp:TextBox ID="txtMunicipio" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Nombre Contacto:</td>
                            <td>

                                <asp:TextBox ID="txtNombreContacto" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Telefono de Contacto:</td>
                            <td>

                                <asp:TextBox ID="txtTelefonoCOntacto" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Correo de Contacto:</td>
                            <td>

                                <asp:TextBox ID="txtCorreoCOntacto" runat="server"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px; vertical-align: top;">Descripcion:</td>
                            <td>

                                <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="50px"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br />
                                <div class="col-sm-8 col-sm-offset-4">
                                    <asp:Button ID="btnGuardarInformacion" runat="server" Text="GUARDAR INFORMACION" CssClass="Boton_PRM" OnClick="btnGuardarInformacion_Click" />
                                </div>

                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <asp:Panel ID="pnlFlotillas" runat="server">
                <div class="col-sm-12">
                    <div class="col-sm-7">
                        <asp:Button ID="btnAgregarFlotilla" runat="server" Text="ADMINISTRACIÓN DE FLOTILLAS" CssClass="Boton_PRM" OnClick="btnAgregarFlotilla_Click" />
                    </div>
                </div>
                <asp:Panel ID="pnlAgregarNuevaFlotilla" runat="server" Visible="false">
                    <div class="col-sm-6" style="text-align: right;">
                        <br />
                        <br />
                        <table style="width: 100%; border: none;">

                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Nombre de la Flotilla:</td>
                                <td>
                                    <asp:TextBox ID="txtNombreFlotilla" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <div class="col-sm-6 col-sm-offset-6">
                                        <asp:Button ID="btnGuardarFlotilla" runat="server" Text="GUARDAR FLOTILLA" CssClass="Boton_PRM" OnClick="btnGuardarFlotilla_Click" />
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-6" style="text-align: right;">

                        <div class="col-sm-12">
                            <asp:GridView ID="gvFlotillas" CssClass="table table-bordered" OnRowCommand="gvFlotillas_RowCommand" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" BorderStyle="None" CommandArgument='<%#Eval("idFlotilla") %>' CommandName="EliminarFlotilla" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Flotilla" DataField="NombreFlotilla" />
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
                </asp:Panel>
                <div class="col-sm-12">
                    <hr style="border: 2px solid #317ABF; width: 100%;" />
                </div>
                <div class="col-sm-12">
                    <asp:Repeater ID="rptFlotillas" runat="server" OnItemCommand="rptFlotillas_ItemCommand">
                        <ItemTemplate>
                            <div class="col-sm-3" style="padding-bottom: 15px;">
                                <asp:Button ID="btnFlotilla" runat="server" Text='<%#Eval("NombreFlotilla") %>' CssClass="Boton_PRM" CommandName="DetalleFlotilla" CommandArgument='<%#Eval("idFlotilla") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-sm-12">
                    <br />
                </div>

            </asp:Panel>
            <asp:Panel ID="pnlDatosAdicionales" runat="server">
                <div class="col-sm-12">
                    <asp:Label ID="lblidFLotilla" runat="server" Visible="false"></asp:Label>
                    <table style="width: 100%; border: none; text-align: left;">
                        <tr>
                            <td style="width: 10px">
                                <br />
                            </td>
                            <td style="width: 80px">
                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                            </td>
                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">
                                <asp:Label ID="lblNombreFlotilla" runat="server"></asp:Label>
                            </td>
                            <td>
                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="col-sm-12" style="text-align: center;">
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkVehiculos" runat="server" Text="VEHICULOS" CssClass="Boton_PRM_LINK" OnClick="lnkVehiculos_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkPolizas" runat="server" Text="POLIZAS" CssClass="Boton_PRM_LINK" OnClick="lnkPolizas_Click"></asp:LinkButton>
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkSiniestros" runat="server" Text="SINIESTROS" CssClass="Boton_PRM_LINK" OnClick="lnkSiniestros_Click" />
                    </div>

                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkReportes" runat="server" Text="REPORTES" CssClass="Boton_PRM_LINK" />
                    </div>

                </div>
                <div class="col-sm-12">
                    <asp:MultiView ID="mvwClientesDetalle" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vwVehiculos" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                <tr>
                                    <td style="width: 10px">
                                        <br />
                                    </td>

                                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Vehiculos
                                    </td>
                                    <td>
                                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12" style="text-align: right;">
                                <br />
                                <asp:Label ID="lblidVehiculo" Text="0" runat="server" Visible="false"></asp:Label>
                                <div class="col-sm-6" style="text-align: right;">
                                    <table style="width: 100%; border: none;">


                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Placa:</td>
                                            <td>

                                                <asp:TextBox ID="txtNumPlaca" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">V.I.N.</td>
                                            <td>

                                                <asp:TextBox ID="txtVIN" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Marca:</td>
                                            <td>

                                                <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Modelo:</td>
                                            <td>

                                                <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Descripción:</td>
                                            <td>

                                                <asp:TextBox ID="txtDescripcionVehiculo" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Motor:</td>
                                            <td>

                                                <asp:TextBox ID="txtNumeroMotor" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Vehiculo:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlTipoVehiculo" runat="server">
                                                    <asp:ListItem Value="1" Text="AUTOMOVIL"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="MOTOCICLETA"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <br />
                                                <div class="col-sm-12">
                                                    <asp:Button ID="btnGuardarVehiculo" runat="server" Text="GUARDAR INFORMACION" CssClass="Boton_PRM" OnClick="btnGuardarVehiculo_Click" />
                                                </div>

                                            </td>
                                        </tr>


                                    </table>
                                </div>

                                <div class="col-sm-6" style="text-align: right;">
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="vwPolizas" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                <tr>


                                    <td style="color: #000000; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; text-align: center;">Administración de Polizas
                                    </td>

                                </tr>
                            </table>

                            <div class="col-sm-12" style="text-align: right;">
                                <br />
                                <asp:Label ID="lblVehiculo" Text="" runat="server" Visible="false"></asp:Label>

                                <asp:Label ID="lblidPoliza" Text="0" runat="server" Visible="false"></asp:Label>
                                <div class="col-sm-6" style="text-align: right;">
                                    <table style="width: 100%; border: none;">
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Poliza</td>
                                            <td>

                                                <asp:TextBox ID="txtNumPoliza" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Inciso</td>
                                            <td>

                                                <asp:TextBox ID="txtInciso" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>

                                            <td colspan="2" style="text-align: left;">
                                                <b>DATOS DEL VEHICULO</b>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Serie</td>
                                            <td>

                                                <asp:TextBox ID="txtVIN2" runat="server" AutoPostBack="true" OnTextChanged="txtVIN2_TextChanged"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Motor:</td>
                                            <td>

                                                <asp:TextBox ID="txtNumMotor2" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Número de Placa:</td>
                                            <td>

                                                <asp:TextBox ID="txtNumPlaca2" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Clave de Cia:</td>
                                            <td>

                                                <asp:TextBox ID="txtClaveCia" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Marca:</td>
                                            <td>

                                                <asp:TextBox ID="txtMarca2" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">SubMarca:</td>
                                            <td>

                                                <asp:TextBox ID="txtDescripcionVehiculo2" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Modelo:</td>
                                            <td>

                                                <asp:TextBox ID="txtModelo2" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Servicio:</td>
                                            <td>

                                                <asp:TextBox ID="txtTipoServicio" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Uso:</td>
                                            <td>

                                                <asp:TextBox ID="txtTipoUso" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Carga:</td>
                                            <td>

                                                <asp:TextBox ID="txtTipoCarga" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                <div class="col-sm-6">
                                    <table style="width: 100%; border: none;">
                                        <tr>

                                            <td colspan="2" style="text-align: left;">
                                                <b>DATOS DE LA POLIZA</b>

                                            </td>
                                        </tr>


                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Compañia:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCia" runat="server">
                                                    <asp:ListItem Value="1" Text="AXA"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="GNP"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Fecha de Expedicion:</td>
                                            <td>

                                                <asp:TextBox ID="txtFecEmision" TextMode="Date" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Inicio de Vigencia:</td>
                                            <td>

                                                <asp:TextBox ID="txtInicioVigencia" TextMode="Date" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Fin de Vigencia:</td>
                                            <td>

                                                <asp:TextBox ID="txtFinVigencia" TextMode="Date" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Cobertura:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlCObertura" runat="server">
                                                    <asp:ListItem Value="1" Text="AMPLIA"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="ESTANDAR"></asp:ListItem>
                                                </asp:DropDownList>

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
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Moneda:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlMoneda" runat="server">
                                                    <asp:ListItem Value="1" Text="PESOS MEXICANOS (MXN)"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="DOLARES (USD)"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Prima Neta:</td>
                                            <td>

                                                <asp:TextBox ID="txtPrimaNeta" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Impuestos:</td>
                                            <td>

                                                <asp:TextBox ID="txtImpuestos" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Prima Total:</td>
                                            <td>

                                                <asp:TextBox ID="txtPrimaTotal" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 40%; padding-right: 30px; height: 35px;">Financiamiento:</td>
                                            <td>

                                                <asp:TextBox ID="txtFinanciamiento" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Derecho de Poliza:</td>
                                            <td>

                                                <asp:TextBox ID="txtDerrechoPoliza" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>

                                      
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Status Poliza:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlStatusPoliza" runat="server">
                                                    <asp:ListItem Value="1" Text="ACTIVA"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="INACTIVA"></asp:ListItem>
                                                </asp:DropDownList>

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
                        </asp:View>
                        <asp:View ID="vwSiniestros" runat="server">
                        </asp:View>

                    </asp:MultiView>
                </div>

                <div class="col-sm-12">
                    <table style="width: 100%; text-align: right;">
                        <tr>
                            <td colspan="2">
                                <br />

                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </asp:View>
        <asp:View ID="vwCatalogClientes" runat="server">
            <div class="col-sm-12" style="text-align: center;">
                <h2>Catalogos de Clientes</h2>
            </div>
            <div class="col-sm-12">
                <asp:GridView ID="gvClientes" CssClass="table table-bordered" runat="server" OnRowCommand="gvClientes_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaCliente" CommandArgument='<%#Eval("idCliente") %>' ToolTip="Eliminar Cliente" OnClientClick="deletealert('¿Esta seguro de que desea eliminar este Cliente?');" />
                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="VerCliente" CommandArgument='<%#Eval("idCliente") %>' ToolTip="Ver Cliente" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderText="Nombre o Razón Social" DataTextField="NombreRS" />
                        <asp:ButtonField HeaderText="RFC" DataTextField="RFC" />
                        <asp:ButtonField HeaderText="Tipo de Persona" DataTextField="TipoPersona" />
                        <asp:ButtonField HeaderText="Contacto" DataTextField="NombreContacto" />
                        <asp:ButtonField HeaderText="Telefono" DataTextField="TelefonoContacto" />
                        <asp:ButtonField HeaderText="Correo" DataTextField="CorreoContacto" />
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


</asp:Content>

