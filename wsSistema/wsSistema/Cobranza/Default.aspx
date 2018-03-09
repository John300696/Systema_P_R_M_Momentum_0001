<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Cobranza_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwCobranza" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwVerPolizas" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Cobranza
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12">
                <div class="col-sm-12">
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkAsignación" runat="server" Text="CAMBIAR STATUS DE COBRANZA" CssClass="Boton_PRM_LINK" OnClick="lnkAsignación_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkPendientes" runat="server" Text="RECIBOS PENDIENTES" CssClass="Boton_PRM_LINK" OnClick="lnkPendientes_Click"></asp:LinkButton>
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkPagadas" runat="server" Text="RECIBOS PAGADOS" CssClass="Boton_PRM_LINK" OnClick="lnkPagadas_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkCanFaltaPago" runat="server" Text="RECIBOS CANC. POR FALTA PAGO" CssClass="Boton_PRM_LINK" OnClick="lnkCanFaltaPago_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkCanPeticion" runat="server" Text="RECIBOS CANC. A PETICIÓN" CssClass="Boton_PRM_LINK" OnClick="lnkCanPeticion_Click" />
                    </div>
                    <div class="col-sm-2">
                        <asp:LinkButton ID="lnkEnviarPolizasPendiente" runat="server" Text="ENVIAR POLIZAS PENDIENTES" CssClass="Boton_PRM_LINK" OnClick="lnkEnviarPolizasPendiente_Click" />
                    </div>

                </div>
                <div class="col-sm-12">
                    <asp:MultiView ID="mvwPolizas" runat="server" ActiveViewIndex="0">
                        <asp:View ID="vwAsignacion" runat="server">
                            <h2>Modificar Status de los Recibos</h2>
                            <div class="col-sm-12">
                                <table style="width: 100%; border: none;">


                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Número de Serie, Poliza o  Asegurado:</td>

                                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                                            <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <asp:Button ID="btnBuscar" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvAsignacionStatus" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />

                                    <asp:TemplateField HeaderText="Modificar Status">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtFecAplicacion" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox><br />
                                            <asp:DropDownList ID="ddlStatus" runat="server">
                                                <asp:ListItem Value="0" Text="Seleccione----->"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="PENDIENTE"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="PAGADO"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="CANCELADO POR FALTA DE PAGO"></asp:ListItem>
                                                <asp:ListItem Value="4" Text="CANCELADO A PETICIÓN"></asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:ImageButton ID="imgModificar" runat="server" ImageUrl="~/images/icons/update.png" CssClass="Botones" CommandName="Status" CommandArgument='<%#Eval("Policy_Receipt_ID") %>' ToolTip="Modificar Status" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                     <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                        <asp:View ID="View1" runat="server">
                            <h2>Polizas Pendientes</h2>
                            <div class="col-sm-12">
                                <table style="width: 100%; border: none;">


                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Número de Serie, Poliza o  Asegurado:</td>

                                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                                            <asp:TextBox ID="txtBuscar2" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <asp:Button ID="btnBuscar2" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar2_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvPolizasPendientes" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>'
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                    <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <h2>Polizas Pagadas</h2>
                            <div class="col-sm-12">
                                <table style="width: 100%; border: none;">


                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Número de Serie, Poliza o  Asegurado:</td>

                                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                                            <asp:TextBox ID="txtBusqueda3" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <asp:Button ID="btnBuscar3" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar3_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvPolizasPagadas" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                    <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <h2>Polizas Canceladas por Falta de Pago</h2>
                            <div class="col-sm-12">
                                <table style="width: 100%; border: none;">


                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Número de Serie, Poliza o  Asegurado:</td>

                                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                                            <asp:TextBox ID="txtBusqueda4" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <asp:Button ID="btnBuscar4" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar4_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvPolizasCanceladasFaltaPago" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                    <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <h2>Polizas Canceladas a Petición</h2>
                            <div class="col-sm-12">
                                <table style="width: 100%; border: none;">


                                    <tr>
                                        <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Número de Serie, Poliza o  Asegurado:</td>

                                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                                            <asp:TextBox ID="txtBusqueda5" runat="server"></asp:TextBox>

                                        </td>
                                        <td>
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <asp:Button ID="btnBuscar5" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar5_Click" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvPolizasCanceladas" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                    <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                       
                        <asp:View ID="vwEnviarCorreos" runat="server">
                            <h1>
                                <asp:LinkButton ID="lnkEnviaCorreos" runat="server" OnClick="lnkEnviaCorreos_Click">ENVIAR CORREOS</asp:LinkButton></h1>
                            <asp:GridView ID="gvRecibosDetalle" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvRecibosDetalle_RowCommand">
                                <Columns>

                                    <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                    <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />
                                    <asp:TemplateField HeaderText="Vigencia">
                                        <ItemTemplate>
                                            <%#Eval("SinceDate") %> -
                            <%#Eval("VigenceDate") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recibo">
                                        <ItemTemplate>
                                            <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                    <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                    <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                    <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                    <asp:ButtonField HeaderText="Email Cliente" DataTextField="Contact_Email" />

                                    <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
                                    <asp:ButtonField HeaderText="Email Agente" DataTextField="Email" />

                                   
                                    <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                    <asp:ButtonField HeaderText="Aplicacion" DataTextField="FecAplicacion" />
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
                        </asp:View>
                    </asp:MultiView>
                </div>

            </div>

        </asp:View>
        <asp:View ID="vwPolizasPorPagar">
        </asp:View>
    </asp:MultiView>
</asp:Content>

