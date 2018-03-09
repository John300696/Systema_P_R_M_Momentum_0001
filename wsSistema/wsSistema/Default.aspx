<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/bootstrap/css/bootstrap.min.css") %>" />
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/bootstrap/css/style.css") %>" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/dist/css/AdminLTE.min.css") %>" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/dist/css/skins/_all-skins.min.css") %>" />
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/style/style1.css") %>" />
    <link rel="stylesheet" href="<%=Page.ResolveUrl("~/dist/css/sweetalert.css") %>" />
    <script src="<%=Page.ResolveUrl("~/dist/js/sweetalert-dev.js") %>"></script>
    <script>

        function myFunction() {
            if ((navigator.userAgent.indexOf("MSIE") != -1) || (!!document.documentMode == true)) //IF IE > 10
            {
                alert('Se recomienda abrir el sitio en cualquier otro navegador para que funcionen todos los complementos');
            }

        }
    </script>
    <title>::.PRM.::</title>
</head>
<body class="general" onload="myFunction()">
    <form id="form1" runat="server">
        <div class="row">

            <div class="login">
                <div class="col-sm-12" style="text-align: center; position: relative; top: -210px;">
                    <img src="<%=Page.ResolveUrl("~/images/PRM.png") %>" style="position: relative; top: 20px;" width="150" />
                    <br />
                    <h2 style="color: #000000"><b>Bienvenido</b> al sistema</h2>
                </div>
                <div style="position: relative; top: -150px;">

                    <h3>Inicio de sesión</h3>

                    <asp:TextBox ID="txtUsuario" runat="server" Width="100%" CssClass="inputlogin" Style="position: relative; top: 5px;" placeholder="UserName"></asp:TextBox>
                    <div style="height: 15px;">
                        <hr style="border: solid #ffffff 2px; width: 100%;" />
                    </div>
                    <asp:TextBox ID="txtPsw" runat="server" Width="100%" CssClass="inputlogin" TextMode="Password"></asp:TextBox>
                    <div style="height: 15px;">
                        <br />
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td style="border: solid 2px white; border-right: none; padding: 5px;">

                                <asp:CheckBox ID="chRemember" runat="server" />

                            </td>
                            <td style="font-size: 11px; width: 200px; padding: 5px; border: solid 2px white; border-left: none;">
                                <h5>Recordar Contraseña</h5>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnLogin" runat="server" Width="80px" Height="40px" BorderStyle="None" ImageUrl="~/images/gestoria/btn entrar-reposo.png" OnClick="btnLogin_Click" />

                            </td>
                        </tr>
                    </table>

                    <br />
                    <p style="font-size: 16px; position: relative; top: -7px;">¿Olvido su contraseña o tiene problemas para ingresar?</p>

                </div>

            </div>
        </div>

        <div class="footer" style="text-align: center; position: relative; top: 350px;">
        </div>
    </form>
</body>
</html>
