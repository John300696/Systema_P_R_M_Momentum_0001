<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Polizas.aspx.cs" Inherits="Cliente_Polizas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwPolizas" runat="server">
        <asp:View ID="vwNuevaPoliza" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Registro de Polizas
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12" style="text-align: right;">
                <br />
                <asp:Label ID="lblidPoliza" runat="server" Visible="false" Text="0"></asp:Label>
                <div class="col-sm-12" style="text-align: right;">
                    <table style="width: 100%; border: none;">



                        <tr>
                            <td style="padding-right: 30px; height: 35px; width: 20%;">Nombre del Cliente:</td>
                            <td>

                                <asp:DropDownList ID="ddlCliente" runat="server" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Flotilla:</td>
                            <td>

                                <asp:DropDownList ID="ddlFlotilla" runat="server">
                                </asp:DropDownList>

                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12" style="text-align: right;">
                    <br />

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

                                    <asp:TextBox ID="txtVIN" runat="server" AutoPostBack="true"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Número de Motor:</td>
                                <td>

                                    <asp:TextBox ID="txtNumMotor" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Número de Placa:</td>
                                <td>

                                    <asp:TextBox ID="txtNumPlaca" runat="server"></asp:TextBox>

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

                                    <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td style="padding-right: 30px; height: 35px;">SubMarca:</td>
                                <td>

                                    <asp:TextBox ID="txtDescripcionVehiculo" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Modelo:</td>
                                <td>

                                    <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Tipo de Servicio:</td>
                                <td><
                                    <asp:DropDownList ID="ddlTipoServicio" runat="server">
                                        <asp:ListItem Value="1" Text="SERVICIO 1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="SERVICIO 2"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Tipo de Uso:</td>
                                <td>

                                    <asp:DropDownList ID="ddlTipoUso" runat="server">
                                        <asp:ListItem Value="1" Text="USO 1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="USO 2"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Tipo de Carga:</td>
                                <td>
                                    <asp:DropDownList ID="ddlTipoCarga" runat="server">
                                        <asp:ListItem Value="1" Text="CARGA 1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="CARGA 2"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px;">Tipo de Vehiculo:</td>
                                <td>
                                    <asp:DropDownList ID="ddlTipoVehiculo" runat="server">
                                        <asp:ListItem Value="1" Text="VEHICULO 1"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="VEHICULO 2"></asp:ListItem>
                                    </asp:DropDownList>

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
            </div>

            <asp:Panel ID="pnlDatosAdicionales" runat="server">

                <div class="col-sm-12" style="text-align: center;">
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkDocumentacion" runat="server" Text="DOCUMENTACIÓN" CssClass="Boton_PRM_LINK" OnClick="lnkDocumentacion_Click" />
                    </div>




                </div>
                <div class="col-sm-12">
                    <asp:MultiView ID="mvwPoizasDetalle" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vwDocumentacion" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                    <tr>
                                        <td style="width: 10px">
                                            <br />
                                        </td>

                                        <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 150px;">Flotillas
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
                                                    <asp:FileUpload ID="fuDocumento" runat="server"/>
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
                                                        <asp:Button ID="btmGuardaDocumentos" runat="server" Text="GUARDAR DOCUMENTOS" CssClass="Boton_PRM" OnClick="btmGuardaDocumentos_Click"/>
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-6" style="text-align: right;">

                                        <div class="col-sm-12">
                                            <asp:GridView ID="gvDocument" CssClass="table table-bordered" OnRowCommand="gvDocument_RowCommand" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" BorderStyle="None" CommandArgument='<%#Eval("Document_ID") %>' CommandName="EliminarFlotilla" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Documentos">
                                                        <ItemTemplate>
                                                            <%#Eval("Name_Document") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Documentos">
                                                        <ItemTemplate>
                                                            <a href='media/<%#Eval("Name_Document") %>' target="_blank">DESCARGAR</a>
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
        <asp:View ID="vwCatalogoPolizas" runat="server">
             <div class="col-sm-12" style="text-align: right;">
                    <table style="width: 100%; border: none;">



                        <tr>
                            <td style="padding-right: 30px; height: 35px; width: 20%;">Nombre del Cliente:</td>
                            <td>

                                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="ddlCliente_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Flotilla:</td>
                            <td>

                                <asp:DropDownList ID="DropDownList2" runat="server">
                                </asp:DropDownList>

                            </td>
                        </tr>
                    </table>
                </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>

