<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Productos_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .my-header {
            background-color: #525c74;
            height: 200px;
        }

            .my-header > img {
                width: 150px;
                margin-top: 25px;
                right: 50px;
                position: absolute;
            }

            .my-header > p {
                color: white;
                margin-left: 300px;
                top: 50px;
                font-size: 18px;
                position: absolute;
                text-align: center;
            }

        .header-mid {
            background-color: #525c74;
            height: 30px;
            margin-top: 20px;
            color: white;
            font-size: 16px;
        }

            .header-mid > p {
                margin-top: 5px;
            }

        .content-middle {
            text-align: justify;
            font-size: 15px;
            color: #666;
        }

        .nav-tabs > li.active > a {
            color: #00BFFF;
            border-top-style: none;
            border-bottom-style: none;
            border-radius: 0;
            border-color: #00BFFF;
            border-left-style: none;
        }

            .nav-tabs > li.active > a:hover {
                color: #0489B1;
                border-top-style: none;
                border-bottom-style: none;
                border-radius: 0;
                border-color: #0489B1;
                border-left-style: none;
            }

        .nav-tabs > li > a {
            color: #2F3b41;
            border-top-style: none;
            border-bottom-style: none;
            border-radius: 0;
            border-color: #2F3b41;
            border-left-style: none;
        }

            .nav-tabs > li > a:hover {
                border-color: #0489B1;
                color: #0489B1;
            }

        .nav-tabs {
            border-style: solid;
            border-radius: 5px;
            border-color: #ccc;
            border-width: 1px;
            height: 60px;
            box-shadow: 0px 4px 2px #eee inset;
        }

            .nav-tabs > li {
                margin-top: 8px;
            }

        button.btn-x {
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-sm-12">
        <br />
    </div>
    <asp:MultiView ID="mvwProductos" runat="server">
        <asp:View ID="vwProducto" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/car.png">
                        <p>
                            Auto<br>
                            <br>
                            Poliza de seguro
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Auto individual</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Camiones</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vehículos Importados</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Motos</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Pick Up</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Turistas</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de automóvil</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Comercializamos una excelente oferta de seguros para automóviles, con diversas opciones de coberturas y formas de pago.<br>
                            Somos la única companía en el sector que gestiona su propio servicio de Asistencia Vial, esto significa que no interviene ninguna compañía concentradora de Asistencia, lo cual nos permite brindar un servicio personalizado, oportuno y con la mejor calidad, acorde a nuestra filosofía de atención al Cliente.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/redcar.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>
        <asp:View ID="View1" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/daños.png">
                        <p>
                            Daños<br>
                            <br>
                            Poliza de seguros
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">daños 1</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Daños 2</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Daños 3</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Daños 4</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Daños 5</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Daños 6</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de daños</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/coldaños.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/vida.png">
                        <p>
                            Vida (individual y colectiva)<br>
                            <br>
                            Poliza de seguros
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 1</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 2</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 3</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 4</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 5</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Vida 6</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de vida (individual y colectiva)</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/colvida.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/acc.png">
                        <p>
                            Accidentes y enfermedades<br>
                            <br>
                            Poliza de seguros
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 1</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 2</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 3</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 4</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 5</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Accidentes 6</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de vida (individual y colectiva)</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/colacc.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>
        <asp:View ID="View4" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/fianzas.png">
                        <p>
                            Fianzas<br>
                            <br>
                            Poliza de seguros
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 1</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 2</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 3</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 4</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 5</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">Fianzas 6</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de vida (individual y colectiva)</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/colfianzas.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>
        <asp:View ID="View5" runat="server">
            <div class="container-fluid">
                <div class="row ">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 my-header">
                        <img src="../images/gmm.png">
                        <p>
                            Gastos Medicos Mayores<br>
                            <br>
                            Poliza de seguros
                        </p>
                    </div>
                    <div class="col-lg-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="home menu-content" class="tab-pane fade in active">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 1</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 2</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 3</button>
                                        </div>
                                        <div class="col-lg-6"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 4</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 5</button>
                                        </div>
                                        <div class="col-lg-2">
                                            <button type="button" class="btn btn-x btn-default">GMM 6</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Ventajas</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                </p>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 header-mid">
                        <p>Seguros de vida (individual y colectiva)</p>
                    </div>
                </div>
                <br>
                <div class="row content-middle">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
          tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
          quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
          consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
          cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
          proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-6">
                        <img src="../images/colgmm.jpg" class="img-thumbnail" width="400">
                    </div>
                </div>
            </div>

        </asp:View>

    </asp:MultiView>
</asp:Content>

