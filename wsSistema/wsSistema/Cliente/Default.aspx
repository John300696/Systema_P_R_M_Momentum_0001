<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Cliente_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwCliente" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwGuardaCliente" runat="server">
          
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
               
                <asp:Panel ID="pnlDatosAdicionales" runat="server">
                    
                    <div class="col-sm-12" style="text-align: center;">
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnkFlotillas" runat="server" Text="FLOTILLAS" CssClass="Boton_PRM_LINK" OnClick="lnkFlotillas_Click" />
                        </div>
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnkPolizas" runat="server" Text="POLIZAS" CssClass="Boton_PRM_LINK" OnClick="lnkPolizas_Click"></asp:LinkButton>
                        </div>
                        <div class="col-sm-2">
                            <asp:LinkButton ID="lnkSiniestros" runat="server" Text="SINIESTROS" CssClass="Boton_PRM_LINK" OnClick="lnkSiniestros_Click" />
                        </div>



                    </div>
                    <div class="col-sm-12">
                        <asp:MultiView ID="mvwClientesDetalle" runat="server" ActiveViewIndex="0">
                            <asp:View ID="vwFlotillas" runat="server">
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
                                                            <asp:ImageButton ID="btnEliminar" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" BorderStyle="None" CommandArgument='<%#Eval("Subclient_ID") %>' CommandName="EliminarFlotilla" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Flotilla" DataField="Subclient_Name" />
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
                            <asp:View ID="vwPolizas" runat="server">
                                <table style="width: 100%; border: none; text-align: left;">
                                    <tr>


                                        <td style="color: #000000; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; text-align: center;">Administración de Polizas
                                        </td>

                                    </tr>
                                </table>

                                <div class="col-sm-12" style="text-align: right;">
                                   AQUI VGAN LAS POLIZAS REGISTRADAS

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
            <asp:View ID="vwCalaogoCLientes" runat="server">
                <div class="col-sm-12" style="text-align: center;">
                <h2>Catalogos de Clientes</h2>
            </div>
            <div class="col-sm-12">
                <asp:GridView ID="gvClientes" CssClass="table table-bordered" runat="server" OnRowCommand="gvClientes_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaCliente" CommandArgument='<%#Eval("Client_ID") %>' ToolTip="Eliminar Cliente" OnClientClick="deletealert('¿Esta seguro de que desea eliminar este Cliente?');" />
                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="VerCliente" CommandArgument='<%#Eval("Client_ID") %>' ToolTip="Ver Cliente" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderText="Nombre o Razón Social" DataTextField="Name_RS" />
                        <asp:ButtonField HeaderText="RFC" DataTextField="RFC" />
                        <asp:ButtonField HeaderText="Tipo de Persona" DataTextField="Type_Person" />
                        <asp:ButtonField HeaderText="Contacto" DataTextField="Contact_Name" />
                        <asp:ButtonField HeaderText="Telefono" DataTextField="Contact_Phone" />
                        <asp:ButtonField HeaderText="Correo" DataTextField="Contact_Email" />
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

