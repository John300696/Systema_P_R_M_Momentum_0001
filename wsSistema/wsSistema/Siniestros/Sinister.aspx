<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Sinister.aspx.cs" Inherits="Siniestros_Sinister" ValidateRequest="false" %>

<%@ Register TagPrefix="ftb" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwSiniestros" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwRegistroCliente" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Datos del Siniestro
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12" style="text-align: right;">
                <br />
                <asp:Label ID="lblidSiniestro" runat="server" Visible="false" Text="0"></asp:Label>
                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">


                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Número de Siniestro:</td>
                            <td>

                                <asp:TextBox ID="txtNumSiniestro" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Número de Reporte:</td>
                            <td>

                                <asp:TextBox ID="txtNumReporte" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Nombre Conductor:</td>
                            <td>

                                <asp:TextBox ID="txtNombreCodunctor" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Nombre del Reportante:</td>
                            <td>

                                <asp:TextBox ID="txtNombreReportante" runat="server"></asp:TextBox>


                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Telefono del COnductor:</td>
                            <td>

                                <asp:TextBox ID="txtTelCOnductor" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Telefono del Reportante:</td>
                            <td>

                                <asp:TextBox ID="txtTelReportante" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Tipo de Emergencia:</td>
                            <td>

                                <asp:DropDownList ID="ddlTipoEmergencia" runat="server">
                                    <asp:ListItem Value="1" Text="CHOQUE O COLISIÓN"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="ROBO TOTAL"></asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Descripcion:</td>
                            <td>

                                <asp:TextBox ID="txtDescripcionSiniestro" runat="server" TextMode="MultiLine"></asp:TextBox>

                            </td>
                        </tr>




                    </table>
                </div>

                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">

                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Poliza:</td>
                            <td>

                                <asp:TextBox ID="txtPoliza" runat="server" OnTextChanged="txtPoliza_TextChanged" AutoPostBack="true"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Inciso:</td>
                            <td>

                                <asp:TextBox ID="txtInciso" runat="server" OnTextChanged="txtInciso_TextChanged" AutoPostBack="true"></asp:TextBox>
                                <asp:Label ID="lblidPoliza" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Aseguradora:</td>
                            <td>

                                <asp:DropDownList ID="ddlCia" runat="server">
                                    <asp:ListItem Value="1" Text="AXA"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="GNP"></asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Cliente:</td>
                            <td>

                                <asp:TextBox ID="txtCliente" runat="server"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Fecha de Siniestro:</td>
                            <td>

                                <asp:TextBox ID="txtFecSiniestro" runat="server" TextMode="Date"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Hora de Siniestro:</td>
                            <td>

                                <asp:TextBox ID="txtHoraSiniestro" runat="server" TextMode="Time"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Fecha de Reporte:</td>
                            <td>

                                <asp:TextBox ID="txtFecReporte" runat="server" TextMode="Date"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Hora de Reporte:</td>
                            <td>

                                <asp:TextBox ID="txtHoraReporte" runat="server" TextMode="Time"></asp:TextBox>

                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-4 col-sm-offset-8">
                        <br />
                        <br />
                        <asp:Button ID="btnGuardarInformacion" runat="server" Text="GUARDAR INFORMACION"
                            CssClass="Boton_PRM" OnClick="btnGuardarInformacion_Click" Width="100%" />

                    </div>

                </div>


            </div>

            <asp:Panel ID="pnlDatosAdicionales" runat="server">
                <div class="col-sm-12">
                    <br />
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <asp:Button ID="btnUbicacion" runat="server" Text="UBICACION" CssClass="Boton_PRM" OnClick="btnUbicacion_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnVehiculo" runat="server" Text="VEHICULO" CssClass="Boton_PRM" OnClick="btnVehiculo_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnInformacionAdicional" runat="server" Text="INFO. ADICIONAL" CssClass="Boton_PRM" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnSiniestros" runat="server" Text="AJUSTADOR" CssClass="Boton_PRM" />
                    </div>
                    <div class="col-sm-12">
                        <br />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnOperadores" runat="server" Text="COB. AFECTADAS" CssClass="Boton_PRM" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnObservaciones" runat="server" Text="OBSERVACIONES" CssClass="Boton_PRM" OnClick="btnObservaciones_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnEvidencia" runat="server" Text="EVIDENCIA" CssClass="Boton_PRM" OnClick="btnEvidencia_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnPagos" runat="server" Text="PAGOS" CssClass="Boton_PRM" OnClick="btnPagos_Click" />
                    </div>
                </div>
                <div class="col-sm-12">
                    <asp:MultiView ID="mvwClientesDetalle" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vwUbicacion" runat="server">
                            <div class="col-sm-12">
                                <div class="col-sm-12">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Ubicación del Siniestro
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="col-sm-6" style="text-align: right;">
                                    <table style="width: 100%; border: none;">


                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Calle y Número:</td>
                                            <td>

                                                <asp:TextBox ID="txtCalleNumeroS" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">COdigo Postal:</td>
                                            <td>

                                                <asp:TextBox ID="txtCodigoPostal" runat="server" OnTextChanged="txtCodigoPostal_TextChanged" AutoPostBack="true"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Colonia:</td>
                                            <td>

                                                <asp:DropDownList ID="ddlColoniaS" runat="server">
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Entidad Federativa:</td>
                                            <td>

                                                <asp:TextBox ID="txtEntidadFederativaS" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Municipio:</td>
                                            <td>

                                                <asp:TextBox ID="txtMunicipioS" runat="server"></asp:TextBox>

                                            </td>
                                        </tr>





                                    </table>
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <br />
                                        <asp:Button ID="btnBuscarUbicacion" runat="server" Text="BUSCAR UBICACIÓN"
                                            CssClass="Boton_PRM" OnClick="btnBuscarUbicacion_Click" Width="100%" />
                                        <br />
                                        <br />
                                        <asp:Button ID="btnGuardarUbicacion" runat="server" Text="GUARDAR UBICACIÓN"
                                            CssClass="Boton_PRM" OnClick="btnGuardarUbicacion_Click" Width="100%" />

                                    </div>
                                </div>
                                <div class="col-sm-6" style="background-color: #808080; min-height: 300px;">
                                    <iframe name="myUbicacion" id="myUbicacion" runat="server" style="width: 100%; min-height: 340px;"></iframe>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View ID="vwVehiculos" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                <tr>
                                    <td style="width: 10px">
                                        <br />
                                    </td>
                                    <td style="width: 80px">
                                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                    </td>
                                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Datos del Vehiculo
                                    </td>
                                    <td>
                                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12" style="text-align: right;">

                                <div class="col-sm-6">
                                    <table style="width: 100%">
                                    
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
                                      
                                    </table>
                                </div>

                               <div class="col-sm-6">
                                    <table style="width: 100%">
                                    
                                       

                                     
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

                                                <asp:DropDownList ID="ddlUso" runat="server">
                                                    <asp:ListItem Value="1" Text="USO 1"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="USO 2"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Carga:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCarga" runat="server">
                                                    <asp:ListItem Value="1" Text="CARGA 1"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="CARGA 2"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;">Tipo de Vehiculo:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlVehiculo" runat="server">
                                                    <asp:ListItem Value="1" Text="VEHICULO 1"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="VEHICULO 2"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </asp:View>

                        <asp:View ID="vwArchivos" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                <tr>
                                    <td style="width: 10px">
                                        <br />
                                    </td>
                                    <td style="width: 80px">
                                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                    </td>
                                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Evidencia Gráfica
                                    </td>
                                    <td>
                                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12" style="background-color: #282828;">
                                <div class="col-sm-6" style="padding: 10px; padding-left: 0px !important; padding-right: 25px !important;">
                                    <asp:Panel ID="pnlFotos" runat="server" Height="350px" ScrollBars="Vertical">
                                        <asp:Repeater ID="rptFotografias" runat="server" OnItemCommand="rptFotografias_ItemCommand">
                                            <ItemTemplate>


                                                <a href='<%#Eval("Ruta") %>' target="myIframe">
                                                    <div class="col-sm-3" style="padding: 5px !important;">

                                                        <img src='<%#Eval("Imagen") %>' style="width: 100%; height: 100px;" />
                                                        <asp:ImageButton ID="imgEliminaFoto" Style="z-index: 3000; position: relative; top: -100px; right: 5px;" BorderStyle="None" runat="server" ImageUrl="~/images/icons/delete.png" Width="25px" Height="25px" CommandName="EliminaFoto" CommandArgument='<%#Eval("Ruta") %>' />


                                                    </div>
                                                </a>
                                            </ItemTemplate>

                                        </asp:Repeater>


                                    </asp:Panel>
                                </div>
                                <div class="col-sm-6" style="padding: 15px;">
                                    <iframe name="myIframe" id="myIframe" style="width: 100%; min-height: 340px;"></iframe>


                                </div>

                            </div>

                            <div class="col-sm-12">
                                <div class="col-sm-12">
                                    <br />
                                </div>
                                <div class="col-sm-3">
                                    <asp:FileUpload ID="fuSubirArchivos" runat="server" />
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button ID="btnSubirArchivos" runat="server" Text="SUBIR" OnClick="btnSubirArchivos_Click" />
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button ID="btnDescargarImagenes" runat="server" Text="DESCARGAR" OnClick="btnDescargarImagenes_Click" />
                                </div>
                                <div class="col-sm-12">
                                    <br />
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <br />
                            </div>
                        </asp:View>
                        <asp:View ID="vwComentarios" runat="server">
                            <table style="width: 100%; border: none; text-align: left;">
                                <tr>
                                    <td style="width: 10px">
                                        <br />
                                    </td>
                                    <td style="width: 80px">
                                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                    </td>
                                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Comentarios y/u Observaciones
                                    </td>
                                    <td>
                                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                                    </td>
                                </tr>
                            </table>
                            <div class="col-sm-12" style="width: 100%; height: auto; border-radius: 0 0 10px 10px; border: solid 3px #e84e1c; position: relative; top: -9px;">
                                <br />
                                <div class="col-sm-12">
                                    <table style="width: 100%; border: none;">

                                        <tr>
                                            <td style="width: 20%; padding-right: 30px; height: 35px;">Información Cliente:</td>
                                            <td>
                                                <ftb:FreeTextBox ID="txtInformacionAdicionalCliente" runat="server" Height="100px" Width="100%" ToolbarStyleConfiguration="OfficeMac" ToolbarLayout="ParagraphMenu, FontFacesMenu, FontSizesMenu, FontForeColorsMenu, FontForeColorPicker, FontBackColorsMenu, FontBackColorPicker, Bold, Italic, Underline, Strikethrough, Superscript, Subscript, CreateLink, Unlink, RemoveFormat, JustifyLeft, JustifyRight, JustifyCenter, JustifyFull, BulletedList, NumberedList, Indent, Outdent| Cut, Copy, Paste, Delete, Undo, Redo, Print, SymbolsMenu, InsertRule, InsertDate, InsertTime" ToolbarBackColor="Transparent">
                                                </ftb:FreeTextBox>


                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="padding-right: 30px; height: 35px;"></td>
                                            <td style="padding-left: 10px;">
                                                <asp:Button ID="btnAgregarInfoCliente" runat="server" OnClick="btnAgregarInfoCliente_Click" Text="AGREGAR INFORMACIÓN" Width="250px" />
                                            </td>

                                        </tr>

                                    </table>
                                </div>
                                <div class="col-sm-12">
                                    <asp:GridView ID="gvInformacionCLiente" CssClass="tablainnova" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Comentario" ItemStyle-Width="70%" ItemStyle-HorizontalAlign="Justify">
                                                <ItemTemplate>
                                                    <div style="text-align: justify !important; width: 100%; padding: 5px;">
                                                        <asp:Label ID="lblComentario" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="Fecha" DataField="Registered_Date" />
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" />
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
                                </div>
                                <div class="col-sm-12">
                                    <br />
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
        <asp:View ID="vwCatalogClientes" runat="server">
            <div class="col-sm-12" style="text-align: center;">
                <h2>Administracion de Siniestros</h2>
            </div>
            <div class="col-sm-12">
                <asp:GridView ID="gvSiniestros" CssClass="table table-bordered" AutoGenerateColumns="false" OnRowCommand="gvSiniestros_RowCommand" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="Delete" CommandArgument='<%#Eval("Sinister_ID") %>' ToolTip="Eliminar Cliente" OnClientClick="deletealert('¿Esta seguro de que desea eliminar este Cliente?');" />
                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="View" CommandArgument='<%#Eval("Sinister_ID") %>' ToolTip="Ver Cliente" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="# Siniestro" DataField="Number_Sinister" />
                        <asp:BoundField HeaderText="# Reporte" DataField="Number_Report" />
                        <asp:BoundField HeaderText="# Poliza" DataField="Number_Policy" />
                        <asp:BoundField HeaderText="# Inciso" DataField="Subsection_Policy" />
                        <asp:BoundField HeaderText="Cliente" DataField="Name_RS" />
                        <asp:BoundField HeaderText="Poliza" DataField="Subclient_Name" />
                        <asp:BoundField HeaderText="Fecha de Siniestro" DataField="Date_Sinister" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
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

