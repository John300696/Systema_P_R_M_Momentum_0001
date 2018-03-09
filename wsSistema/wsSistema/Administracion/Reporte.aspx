<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Reporte.aspx.cs" Inherits="Administracion_Reporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwReportes" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwProducción" runat="server">
            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 350px;">Reporte de Producción
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12">

                <br />
                <table style="width: 90%; border: none; text-align: right;">

                   
                    <tr>
                        <td style="padding-right: 30px; width: 20%; height: 35px;">Agente/Asesor/Empleado:</td>
                        <td>

                            <asp:DropDownList ID="ddlSolicito" runat="server" OnSelectedIndexChanged="ddlSolicito_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                        </td>
                    </tr>
                </table>
                <div class="col-sm-12">
                    <br />
                     <asp:GridView ID="gvOrdenesTrabajo" CssClass="table table-bordered" runat="server" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                       
                        <asp:ButtonField HeaderText="Folio" DataTextField="Folio" />
                        <asp:ButtonField HeaderText="Poliza" DataTextField="Number_Policy" />
                        <asp:ButtonField HeaderText="Inciso" DataTextField="Subsection_Policy" />
                        <asp:ButtonField HeaderText="¿Quien Solicito?" DataTextField="NameC" />
                        <asp:ButtonField HeaderText="Cliente/Prospecto" DataTextField="Name_RS" />
                       <asp:ButtonField HeaderText="¿Quien Realizo?" DataTextField="NameC2" />
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
            </div>
        </asp:View>
    </asp:MultiView>

</asp:Content>

