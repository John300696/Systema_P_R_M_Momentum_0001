<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Administracion_Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=tvAccesos] input[type=checkbox]").bind("click", function () {
                var table = $(this).closest("table");
                if (table.next().length > 0 && table.next()[0].tagName == "DIV") {
                    //Is Parent CheckBox
                    var childDiv = table.next();
                    var isChecked = $(this).is(":checked");
                    $("input[type=checkbox]", childDiv).each(function () {
                        if (isChecked) {
                            $(this).attr("checked", "checked");
                        } else {
                            $(this).removeAttr("checked");
                        }
                    });
                } else {
                    //Is Child CheckBox
                    var parentDIV = $(this).closest("DIV");

                    if ($("input[type=checkbox]", parentDIV).length == $("input[type=checkbox]:checked", parentDIV).length) {
                        $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");
                    } else {
                        $("input[type=checkbox]", parentDIV.prev()).attr("checked", "checked");
                    }
                }
            });
        })


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="mvwUsuarios" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwmRegistro" runat="server">

            <table style="width: 100%; border: none; text-align: left;">
                <tr>
                    <td style="width: 10px">
                        <br />
                    </td>
                    <td style="width: 80px">
                        <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                    </td>
                    <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Información Principal del Usuario
                    </td>
                    <td>
                        <hr style="border: 2px solid #317ABF; width: 100%;" />
                    </td>
                </tr>
            </table>
            <div class="col-sm-12" style="text-align: right;">
                <asp:Panel ID="pnlDatosPrincipales" runat="server">
                    <div class="col-sm-12">
                        <div class="col-sm-6">
                            <asp:Button ID="btnRegresar" runat="server" Text="REGRESAR" CssClass="Boton_PRM" OnClick="btnRegresar_Click" />
                        </div>
                        <div class="col-sm-8">
                            <h2>
                                <asp:Label ID="lblCompleto" runat="server"></asp:Label></h2>
                            <h3>
                                <asp:Label ID="lblRFC" runat="server"></asp:Label></h3>
                        </div>
                        <div class="col-sm-4">
                            <div style="width: 90px; height: 120px; background-color: black;">
                                <asp:Image ID="imgFoto" runat="server" Style="width: 100%; height: 100%" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <div class="col-sm-12">
                    <br />
                </div>

                <asp:Label ID="lblidUsuario" runat="server" Visible="false" Text="0"></asp:Label>
                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">


                        <tr>
                            <td style="padding-right: 30px; height: 35px; width: 40%;">Nombre o Razón Social:</td>
                            <td>

                                <asp:TextBox ID="txtNombreU" runat="server" CssClass="mayus"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Apellido Paterno:</td>
                            <td>

                                <asp:TextBox ID="txtAPU" runat="server" CssClass="mayus"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Apellido Materno:</td>
                            <td>

                                <asp:TextBox ID="txtAMU" runat="server" CssClass="mayus"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">R.F.C.:</td>
                            <td>

                                <asp:TextBox ID="txtRFC" runat="server" CssClass="mayus"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Correo Electrónico:</td>
                            <td>

                                <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" OnTextChanged="txtCorreo_TextChanged" AutoPostBack="true"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Número Telefónico:</td>
                            <td>
                                <asp:TextBox ID="txtTelefono" runat="server" TextMode="Phone"></asp:TextBox>
                            </td>
                        </tr>
                        <asp:Panel ID="pnlInfoAdicionalCorreo" runat="server" Visible="false">
                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Correo Electrónico Adicional:</td>
                                <td>

                                    <asp:TextBox ID="txtCorreo2" runat="server" TextMode="Email" AutoPostBack="true"></asp:TextBox>

                                </td>
                            </tr>

                            <tr>
                                <td style="width: 40%; padding-right: 30px; height: 35px;">Número Telefónico Adicional:</td>
                                <td>
                                    <asp:TextBox ID="txtTelefono2" runat="server" TextMode="Phone"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Fecha de Ingreso:</td>
                            <td>
                                <asp:TextBox ID="txtFechaIngreso" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                        </tr>







                    </table>
                </div>
                <div class="col-sm-6" style="text-align: right;">
                    <table style="width: 100%; border: none;">
                        <tr>
                            <td style="width: 40%; padding-right: 30px; height: 35px;">Fotografía:</td>
                            <td>

                                <asp:FileUpload ID="fuFoto" runat="server" />

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Tipo de Usuario:</td>
                            <td>

                                <asp:DropDownList ID="ddlTipoUsuario" runat="server" OnSelectedIndexChanged="ddlTipoUsuario_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Oficina:</td>
                            <td>

                                <asp:DropDownList ID="ddlOficina" runat="server"></asp:DropDownList>

                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" style="text-align: left;"><b>DATOS DE ACCESO</b></td>

                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Usuario:</td>
                            <td>

                                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>


                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Contraseña:</td>
                            <td>

                                <asp:TextBox ID="txtPsw" runat="server" TextMode="Password"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="padding-right: 30px; height: 35px;">Confirmar Contraseña:</td>
                            <td>

                                <asp:TextBox ID="txtPsw2" runat="server" TextMode="Password"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <br />
                                <div class="col-sm-8 col-sm-offset-4">
                                    <asp:Button ID="btnGuardarUsuario" runat="server" Text="GUARDAR USUARIO" CssClass="Boton_PRM" OnClick="btnGuardarUsuario_Click" />
                                </div>

                            </td>
                        </tr>

                    </table>
                </div>

                <asp:Panel ID="pnlDatosAdicionales" runat="server" Visible="false">
                    <div class="col-sm-12">
                        <div class="col-sm-12">
                            <hr style="border: 2px solid #317ABF; width: 100%;" />
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-4">
                                <asp:Button ID="btnInfoAficional" runat="server" Text="INFO. ADICIONAL" CssClass="Boton_PRM" OnClick="btnInfoAficional_Click" />
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="btnDirecciones" runat="server" Text="DIRECCIONES" CssClass="Boton_PRM" OnClick="btnDirecciones_Click" />
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="btnMedios" runat="server" Text="MED. DE CONTACTO" CssClass="Boton_PRM" OnClick="btnMedios_Click" />
                            </div>

                            <div class="col-sm-12">
                                <br />
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="btnDocumentacion" runat="server" Text="DOCUMENTACIÓN" CssClass="Boton_PRM" OnClick="btnDocumentacion_Click" />
                            </div>
                            <div class="col-sm-4">
                                <asp:Button ID="btnAccesos" runat="server" Text="ACCESOS" CssClass="Boton_PRM" OnClick="btnAccesos_Click" />
                            </div>

                        </div>
                        <div class="col-sm-12">
                            <br />
                        </div>
                        <div class="col-sm-12">
                            <asp:MultiView ID="mvwInfoUsuarios" runat="server">
                                <asp:View ID="vwInfoAdicional" runat="server">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Información de Agente/Asesor
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:MultiView ID="mvwInfoAdicional" runat="server" ActiveViewIndex="1">
                                        <asp:View ID="vwAgente" runat="server">
                                            <asp:Label ID="lblidAgente" runat="server" Visible="false" Text="0"></asp:Label>
                                            <div class="col-sm-12">
                                                <table style="width: 100%; border: none;">


                                                    <tr>
                                                        <td style="width: 20%; padding-right: 30px; height: 35px;">Tipo de Persona:<br />
                                                            <br />
                                                        </td>
                                                        <td>

                                                            <asp:DropDownList ID="ddlTipoPersona" runat="server">
                                                                <asp:ListItem Value="1" Text="PERSONA FÍSICA"></asp:ListItem>
                                                                <asp:ListItem Value="2" Text="PERSONA MORAL"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-sm-6" style="text-align: right;">
                                                <table style="width: 100%; border: none;">
                                                    <tr>
                                                        <td colspan="2" style="text-align: center;"><b>CEDULA</b></td>

                                                    </tr>
                                                    <tr>
                                                        <td style="width: 40%; padding-right: 30px; height: 35px;">Número:</td>
                                                        <td>

                                                            <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Documento:</td>
                                                        <td>
                                                            <table style="width: 100%; border: none;">
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:FileUpload ID="fuCedula" runat="server" />
                                                                    </td>
                                                                    <td style="padding-left: 15px;">
                                                                        <asp:LinkButton ID="lnkCedula" runat="server" target="_blank">
                                                                           <div class="Boton_PRM" style="width:50px;padding:4px;height:30px;"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>

                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>



                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Vigencia:</td>
                                                        <td style="text-align: left;">
                                                            <table style="width: 100%; border: none;">
                                                                <tr>
                                                                    <td style="width: 50%">Desde:
                                                            <asp:TextBox ID="txtDesdeCedula" runat="server" TextMode="Date"></asp:TextBox>
                                                                    </td>
                                                                    <td style="padding-left: 15px;">Hasta:
                                                            <asp:TextBox ID="txtHastaCedula" runat="server" TextMode="Date"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>


                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="col-sm-6" style="text-align: right;">
                                                <table style="width: 100%; border: none;">

                                                    <tr>
                                                        <td colspan="2" style="text-align: center;"><b>POLIZA RC</b></td>

                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Número:</td>
                                                        <td>

                                                            <asp:TextBox ID="txtPolizaRC" runat="server"></asp:TextBox>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Documento:</td>
                                                        <td>
                                                            <table style="width: 100%; border: none;">
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:FileUpload ID="fuPolizaRC" runat="server" />
                                                                    </td>
                                                                    <td style="padding-left: 15px;">
                                                                        <asp:LinkButton ID="lnkPolizaRC" runat="server" target="_blank">
                                                                           <div class="Boton_PRM" style="width:50px;padding:4px;height:30px;"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>

                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>



                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-right: 30px; height: 35px;">Vigencia:</td>
                                                        <td style="text-align: left;">
                                                            <table style="width: 100%; border: none;">
                                                                <tr>
                                                                    <td style="width: 50%">Desde:
                                                            <asp:TextBox ID="txtDesdePolizaRC" runat="server" TextMode="Date"></asp:TextBox>
                                                                    </td>
                                                                    <td style="padding-left: 15px;">Hasta:
                                                            <asp:TextBox ID="txtHastaPolizaRC" runat="server" TextMode="Date"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>


                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2">
                                                            <br />
                                                            <div class="col-sm-8 col-sm-offset-4">
                                                                <asp:Button ID="btnGuardarInformacionAgente" runat="server" Text="GUARDAR INFORMACIÓN" CssClass="Boton_PRM" OnClick="btnGuardarInformacionAgente_Click" />
                                                            </div>

                                                        </td>
                                                    </tr>


                                                </table>
                                            </div>
                                            <div class="col-sm-12">
                                                <h3 style="text-align: left;">Claves de Aseguradoras</h3>
                                                <div class="col-sm-6">
                                                    <table style="width: 100%; border: none;">

                                                        <tr>
                                                            <td style="padding-right: 30px; height: 35px;">Aseguradora:</td>
                                                            <td>

                                                                <asp:DropDownList ID="ddlCia" runat="server"></asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="padding-right: 30px; height: 35px;">Clave:</td>
                                                            <td>

                                                                <asp:TextBox ID="txtCkave" runat="server"></asp:TextBox>

                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td colspan="2">
                                                                <br />
                                                                <div class="col-sm-8 col-sm-offset-4">
                                                                    <asp:Button ID="btnGuardarClave" runat="server" Text="GUARDAR CLAVE" CssClass="Boton_PRM" OnClick="btnGuardarClave_Click" />
                                                                </div>

                                                            </td>
                                                        </tr>


                                                    </table>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="col-sm-12">
                                                        <asp:GridView ID="gvClave" CssClass="table table-bordered" runat="server" OnRowCommand="gvUsuarios_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaCve" CommandArgument='<%#Eval("Cve_Agent_Cia_ID") %>' ToolTip="Eliminar Clave" OnClientClick="return confirm('¿Esta seguro de que desea eliminar este Cliente?');" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:ButtonField HeaderText="Compañia" DataTextField="Cia" />
                                                                <asp:ButtonField HeaderText="Clave" DataTextField="Cve" />
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
                                        <asp:View ID="vwAsesor" runat="server">
                                            <asp:Label ID="lblidAsesor" runat="server" Visible="false" Text="0"></asp:Label>
                                            <div class="col-sm-12">
                                                <table style="width: 100%; border: none;">


                                                    <tr>
                                                        <td style="width: 30%; padding-right: 30px; height: 35px;">Agente Vinculado:<br />
                                                            <br />
                                                        </td>
                                                        <td>

                                                            <asp:DropDownList ID="ddlAgentes" runat="server">
                                                            </asp:DropDownList>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <br />
                                                            <div class="col-sm-8 col-sm-offset-4">
                                                                <asp:Button ID="btnGuardarInformacionAsesor" runat="server" Text="GUARDAR INFORMACIÓN" CssClass="Boton_PRM" OnClick="btnGuardarInformacionAsesor_Click" />
                                                            </div>

                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                        </asp:View>
                                        <asp:View ID="vwOtro" runat="server">

                                            <div class="col-sm-12" style="text-align: center;">
                                                <h2>Información Adicional No Requerida</h2>
                                            </div>

                                        </asp:View>
                                    </asp:MultiView>
                                </asp:View>
                                <asp:View ID="vwDirecciones" runat="server">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Direcciones
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="col-sm-6">
                                        <asp:Label ID="lblidDireccion" runat="server" Visible="false" Text="0"></asp:Label>
                                        <table style="width: 100%; border: none;">


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
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-8 col-sm-offset-4">
                                                        <asp:Button ID="bntnGuardarDireccion" runat="server" Text="GUARDAR DIRECCIÓN" CssClass="Boton_PRM" OnClick="bntnGuardarDireccion_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:GridView ID="gvDireccion" CssClass="table table-bordered" runat="server" OnRowCommand="gvDireccion_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaDireccion" CommandArgument='<%#Eval("Address_ID") %>' ToolTip="Eliminar Dirección" OnClientClick="return confirm('¿Esta seguro de que desea eliminar este Cliente?');" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Direccíón" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <%#Eval("Address") %> Colonia: <%#Eval("Boulevard") %> C.P. <%#Eval("ZIP") %> <%#Eval("Federal_Entity") %>,<%#Eval("Municipality") %>
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
                                </asp:View>
                                <asp:View ID="vwContacto" runat="server">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Medios de Contacto
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblidMedio" runat="server" Visible="false" Text="0"></asp:Label>
                                        <table style="width: 100%; border: none;">

                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Tipo de Medio:</td>
                                                <td>

                                                    <asp:DropDownList ID="ddlMedio" runat="server">
                                                    </asp:DropDownList>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40%; padding-right: 30px; height: 35px;">Valor:</td>
                                                <td>

                                                    <asp:TextBox ID="txtValorMedio" runat="server"></asp:TextBox>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-8 col-sm-offset-4">
                                                        <asp:Button ID="btnGuardarMedio" runat="server" Text="GUARDAR MEDIO DE CONTACTO" CssClass="Boton_PRM" OnClick="btnGuardarMedio_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:GridView ID="gvMedioContacto" CssClass="table table-bordered" runat="server" OnRowCommand="gvMedioContacto_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaDireccion" CommandArgument='<%#Eval("Contact_Person_ID") %>' ToolTip="Eliminar Dirección" OnClientClick="return confirm('¿Esta seguro de que desea eliminar este Cliente?');" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="Tipo" DataField="Contact" />
                                                <asp:BoundField HeaderText="Valor" DataField="Value" />
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
                                <asp:View ID="vwDocumentacion" runat="server">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Documentación Adicional
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="col-sm-6">
                                        <asp:Label ID="lblidDocumento" runat="server" Visible="false" Text="0"></asp:Label>
                                        <table style="width: 100%; border: none;">

                                            <tr>
                                                <td style="padding-right: 30px; height: 35px;">Tipo de Documento:</td>
                                                <td>

                                                    <asp:DropDownList ID="ddlDocumento" runat="server">
                                                    </asp:DropDownList>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40%; padding-right: 30px; height: 35px;">Archivo:</td>
                                                <td>

                                                    <asp:FileUpload ID="fuDocumento" runat="server" />

                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-8 col-sm-offset-4">
                                                        <asp:Button ID="btnGuardarDocumento" runat="server" Text="GUARDAR DOCUMENTO" CssClass="Boton_PRM" OnClick="btnGuardarDocumento_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="col-sm-6">
                                    </div>
                                </asp:View>
                                <asp:View ID="vwAccesos" runat="server">
                                    <table style="width: 100%; border: none; text-align: left;">
                                        <tr>
                                            <td style="width: 10px">
                                                <br />
                                            </td>
                                            <td style="width: 80px">
                                                <img src="../images/gestoria/icon.png" style="width: 100%; height: 50px;" />
                                            </td>
                                            <td style="color: #317ABF; font-family: Helvetica; font-size: 24px; vertical-align: middle; padding: 20px; width: 400px;">Administracion de Accesos
                                            </td>
                                            <td>
                                                <hr style="border: 2px solid #317ABF; width: 100%;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="col-sm-6 col-sm-offset-3" style="text-align: left;">
                                        <asp:TreeView ID="tvAccesos" runat="server" ShowCheckBoxes="All"></asp:TreeView>

                                        <table style="width: 100%; border: none;">

                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                    <div class="col-sm-6 col-sm-offset-3">
                                                        <asp:Button ID="btnGuardarAccesos" runat="server" Text="GUARDAR ACCESOS" CssClass="Boton_PRM" OnClick="btnGuardarAccesos_Click" />
                                                    </div>

                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </asp:View>

                            </asp:MultiView>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </asp:View>
        <asp:View ID="vwCalaogoUsuario" runat="server">
            <div class="col-sm-12" style="text-align: center;">
                <h2>Catalogos de Clientes</h2>
            </div>
            <div class="col-sm-12">
                <table style="width: 100%; border: none;">


                    <tr>
                        <td style="padding-right: 30px; height: 35px; width: 30%;">Busqueda por Nombre o Correo:</td>
                        <td style="padding-right: 30px; height: 35px; width: 50%;">

                            <asp:TextBox ID="txtBusqueda" runat="server"></asp:TextBox>

                        </td>
                        <td>
                            <div class="col-sm-8 col-sm-offset-4">
                                <asp:Button ID="btnBuscar" runat="server" Text="BUSCAR" CssClass="Boton_PRM" OnClick="btnBuscar_Click"/>
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div class="col-sm-12">
                <asp:GridView ID="gvUsuarios" CssClass="table table-bordered" runat="server" OnRowCommand="gvUsuarios_RowCommand" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgElimina" runat="server" ImageUrl="~/images/icons/delete.png" CssClass="Botones" CommandName="EliminaUsuario" CommandArgument='<%#Eval("Person_ID") %>' ToolTip="Eliminar Cliente" OnClientClick="deletealert('¿Esta seguro de que desea eliminar este Cliente?');" />
                                <asp:ImageButton ID="imgCorreo" runat="server" ImageUrl="~/images/icons/check.png" CssClass="Botones" CommandName="EnviarMail" CommandArgument='<%#Eval("Email") %>' ToolTip="Enviar Mail" />

                                <asp:ImageButton ID="imgVer" runat="server" ImageUrl="~/images/icons/view.png" CssClass="Botones" CommandName="VerUsuario" CommandArgument='<%#Eval("Person_ID") %>' ToolTip="Ver Cliente" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderText="Nombre o Razón Social" DataTextField="Full_Name" />
                        <asp:ButtonField HeaderText="RFC" DataTextField="RFC" />
                        <asp:ButtonField HeaderText="Tipo de Usuario" DataTextField="Role" />
                        <asp:TemplateField HeaderText="Contacto">
                            <ItemTemplate>
                                Correo: <a href='mailto:"<%#Eval("Email") %>"' target="_blank"><%#Eval("Email") %></a><br />
                                Telefono: <a href='tel:"<%#Eval("Phone") %>"' target="_blank"><%#Eval("Phone") %></a><br />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:ButtonField HeaderText="Info. Adicional" DataTextField="Info_Adicional" />
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

