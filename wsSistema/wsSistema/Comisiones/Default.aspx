<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Comisiones_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table style="width: 100%; border: none; text-align: left;">
        <tr>
            <td style="width: 10px">
                <br />
            </td>
            <td style="width: 80px">
                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
            </td>
            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Liquidaciones y Comisiones
            </td>
            <td>
                <hr style="border: 2px solid #317ABF; width: 100%;" />
            </td>
        </tr>
    </table>
    <div class="col-sm-12">
        <div class="col-sm-12">
            <div class="col-sm-2">
                <asp:LinkButton ID="lnkAsignación" runat="server" Text="ASIGNACIÓN DE COMISIONES" CssClass="Boton_PRM_LINK" OnClick="lnkAsignación_Click" />
            </div>
            <div class="col-sm-2">
                <asp:LinkButton ID="lnkCOnsultaLiquidacion" runat="server" Text="CONSULTA DE LIQUIDACIONES" CssClass="Boton_PRM_LINK" OnClick="lnkCOnsultaLiquidacion_Click" />
            </div>
            <div class="col-sm-2">
                <asp:LinkButton ID="lnkConsultaComisiones" runat="server" Text="CONSULTA DE COMISIONES" CssClass="Boton_PRM_LINK" OnClick="lnkConsultaComisiones_Click" />
            </div>

        </div>
        <div class="col-sm-12">
            <asp:MultiView ID="mvwComisiones" runat="server" ActiveViewIndex="0">
                <asp:View ID="vwAsignacion" runat="server">
                    <h2>LIQUIDACIÓN
                                <asp:Label ID="lblFolioLiquidacion" runat="server"></asp:Label></h2>
                    <div class="col-sm-6">
                        <asp:Label ID="lblLiquidacion" runat="server"></asp:Label>
                        <table style="width: 100%; border: none;">


                            <tr>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">Fecha:</td>

                                <td style="padding-right: 30px; height: 35px; width: 50%;">

                                    <asp:TextBox ID="txtFecha" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">Importe de la Liquidación:</td>

                                <td style="padding-right: 30px; height: 35px; width: 50%;">

                                    <asp:TextBox ID="txtImporteLiquidacion" runat="server"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">Compañia:</td>

                                <td style="padding-right: 30px; height: 35px; width: 50%;">

                                    <asp:DropDownList ID="ddlCia" runat="server">
                                        <asp:ListItem Value="1" Text="AXA"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="GNP"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnGuardaLiquidacion" runat="server" Text="GUARDAR LIQUIDACIÓN" CssClass="Boton_PRM" OnClick="btnGuardaLiquidacion_Click" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-12">
                        <br />
                        <br />
                    </div>
                    <div class="col-sm-12">
                        <table style="width: 100%; border: none;">


                            <tr>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">Busqueda por Poliza,Asegurado O Recibo:</td>

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
                    <div class="col-sm-12">
                        <br />
                        <br />
                    </div>
                    <div class="col-sm-8">
                        <h3>AGREGAR BONO</h3>
                        <table style="width: 100%; border: none;">


                            <tr>
                               
                                <td style="padding-right: 30px; height: 35px; width: 20%;">
                                    CONCEPTO:<br />
                                    <asp:TextBox ID="txtConcepto" runat="server"></asp:TextBox>

                                </td>
                                 <td style="padding-right: 30px; height: 35px; width: 20%;">
                                     PRIMA NETA:<br />
                                    <asp:TextBox ID="txtImporte" runat="server"></asp:TextBox>

                                </td>
                                <td style="padding-right: 30px; height: 35px; width: 10%;">
                                     PORCENTAJE:<br />
                                    <asp:TextBox ID="txtPorcentaje" runat="server" OnTextChanged="txtPorcentaje_TextChanged1" AutoPostBack="true"></asp:TextBox>

                                </td>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">
                                     COMISION:<br />
                                    <asp:TextBox ID="txtComision" runat="server"></asp:TextBox>

                                </td>
                                <td>
                                    <div class="col-sm-8 col-sm-offset-4">
                                        <asp:Button ID="btnAgregarBono" runat="server" Text="AGREGAR" CssClass="Boton_PRM" OnClick="btnAgregarBono_Click" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-12">
                        <asp:GridView ID="gvAsignacionStatus" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvAsignacionStatus_RowCommand">
                            <Columns>

                                <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                                <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />

                                <asp:TemplateField HeaderText="Recibo">
                                    <ItemTemplate>
                                        <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                                <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                <asp:ButtonField HeaderText="Agente" DataTextField="Persona" />
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
                                <asp:TemplateField HeaderText="Prima Neta">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtSubTotal" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Porcentaje">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtPorcentaje" runat="server" OnTextChanged="txtPorcentaje_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Agregar a Liq.">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="imgAgregar" runat="server" ImageUrl="~/images/icons/add.png" CssClass="Botones" CommandName="Comisiones" CommandArgument='<%#Eval("Policy_Receipt_ID") %>' ToolTip="Agregar a Liquidacion" />
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

                    <div class="col-sm-12">
                        <br />
                        <br />
                    </div>

                    <h4>RECIBOS DE LIQUIDACIÓN</h4>
                    <br />
                    <asp:GridView ID="gvRecibosLiquidacion" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvAsignacionStatus_RowCommand">
                        <Columns>

                            <asp:ButtonField HeaderText="Recibo No." DataTextField="NumberReceipt" />
                            <asp:ButtonField HeaderText="Limite de Pago" DataTextField="PayDayLimit" />

                            <asp:TemplateField HeaderText="Recibo">
                                <ItemTemplate>
                                    <a href="../Emision/Receipts/<%#Eval("Document_Name") %>" target="_blank">RECIBO</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField HeaderText="Importe" DataTextField="Total" />
                            <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                            <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                            <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                            <asp:ButtonField HeaderText="Asesor" DataTextField="Persona" />
                            <asp:ButtonField HeaderText="Cobranza" DataTextField="Status" />
                            <asp:ButtonField HeaderText="SubTotal" DataTextField="SubTotal" />
                            <asp:ButtonField HeaderText="Porcentaje" DataTextField="Porcentaje" />
                            <asp:ButtonField HeaderText="Total" DataTextField="Total1" />
                            <asp:ButtonField HeaderText="Liquidacion" DataTextField="Liquidacion" />


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
                    TOTAL DE LIQUIDACIÓN:
                    <asp:Label ID="lblTotalLiquidacion" runat="server"></asp:Label>
                    <br />
                    TOTAL DE COMISIONES:
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                    <br />
                    <br />
                    DIFERENCIA:
                    <asp:Label ID="lblDiferencia" runat="server"></asp:Label>
                </asp:View>
                <asp:View ID="vwConsultaLiquidaciones" runat="server">
                    <h2>LIQUIDACIONES</h2>
                    <div class="col-sm-12">
                        <asp:GridView ID="gvLiquidaciones" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvLiquidaciones_RowCommand">
                            <Columns>

                                <asp:TemplateField HeaderText="Ver">
                                    <ItemTemplate>

                                        <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="Ver_Liquidacion" CommandArgument='<%#Eval("Liquidation_Receipts_ID") %>' ToolTip="Ver Liquidación" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField HeaderText="Folio" DataTextField="Folio" />
                                <asp:ButtonField HeaderText="Fecha" DataTextField="RegisteredDate" />
                                <asp:ButtonField HeaderText="Compañia" DataTextField="Cia" />
                                <asp:ButtonField HeaderText="Importe" DataTextField="Import_Liquidation" />
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
                <asp:View ID="vwConsultaComisiones" runat="server">
                    <div class="col-sm-6">
                        <table style="width: 100%; border: none;">


                            <tr>
                                <td style="padding-right: 30px; height: 35px; width: 20%;">Seleccione un Asesor:</td>

                                <td style="padding-right: 30px; height: 35px; width: 50%;">

                                    <asp:DropDownList ID="ddlAsesor" runat="server" OnSelectedIndexChanged="ddlAsesor_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-sm-12">
                        <asp:GridView ID="gvLiquidacionAsesor" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false" OnRowCommand="gvLiquidaciones_RowCommand">
                            <Columns>
                                <asp:ButtonField HeaderText="Ramo" DataTextField="SubRamo" />
                                <asp:ButtonField HeaderText="Subramo" DataTextField="Ramo" />
                                <asp:ButtonField HeaderText="Num. Recibo" DataTextField="NumberReceipt" />
                                <asp:ButtonField HeaderText="Lim. de Pago" DataTextField="PayDayLimit" />
                                <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                                <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                                <asp:ButtonField HeaderText="Cliente" DataTextField="CLiente" />
                                <asp:ButtonField HeaderText="Asesor" DataTextField="Persona" />
                                <asp:ButtonField HeaderText="Status" DataTextField="Status" />
                                <asp:ButtonField HeaderText="Fec. Aplicacion" DataTextField="FecAplicacion" />
                                <asp:ButtonField HeaderText="Prima Neta" DataTextField="SubTotal" />
                                <asp:ButtonField HeaderText="Porcentaje" DataTextField="Porcentaje" />
                                <asp:ButtonField HeaderText="Comision" DataTextField="Total" />
                                <asp:ButtonField HeaderText="Liquidacion" DataTextField="Liquidacion" />
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
                        <br />
                        TOTAL DE COMISIONES:
                    <asp:Label ID="lblTOtalAsesor" runat="server"></asp:Label>
                        <div class="col-sm-8 col-sm-offset-4">
                            <asp:Button ID="btnExportarPDF" runat="server" Text="EXPORTAR COMISIONES" CssClass="Boton_PRM" OnClick="btnExportarPDF_Click" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>

    </div>


</asp:Content>

