<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.master" AutoEventWireup="true" CodeFile="Example_Vida.aspx.cs" Inherits="Examples_Example" %>

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
        <
                <br />
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div id="home menu-content" class="tab-pane fade in active">
                    <div class="container-fluid">
                        <ul class="nav nav-tabs">

                            <li><a data-toggle="tab" href="#prudential">PRUDENTIAL</a></li>
                            <li><a data-toggle="tab" href="#mapfre">MAPFRE</a></li>

                        </ul>


                    </div>
                </div>
                <br />
                <div class="tab-content">
                    <div id="prudential" class="tab-pane fade">
                        <ul class="nav nav-tabs">

                            <li><a data-toggle="tab" href="#menu3">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="inicio" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10 header-mid">
                                        <p>PRUDENTIAL</p>
                                    </div>
                                </div>
                                <br>
                                <div class="row content-middle">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10" style="text-align: justify;">
                                        <p>
                                            Somos una empresa a nivel Internacional en Seguros de Vida, Pensiones, Fondos para el Retiro y Administración de Fondos, Títulos y Valores, Fideicomisos, Inmobiliaria entre otras.
                                            <center>
                                                <img src="img/prudential/img1.jpg" style="width:40%;"/>
                                            </center>
                                            •	Cotiza en bolsa NYSE bajo la clave ¨PRU¨ desde 2001
                                            <br />
                                            •	3er lugar en la categoría “Insurance: Life and Health” de la revista Fortune en su lista 2015 de las empresas más admiradas 
                                            <br />
                                            •   2a. Aseguradora de Vida más grande en Estados Unidos (combinado individual y grupo),             basado en total de activos 
                                            <br />
                                            •   9a. Entre las más grandes instituciones administradoras de activos del mundo (AM Best) 
                                            <br />
                                            •	Prudential Financial, Inc. 751 Broad Street Newark, NJ 07102
                                            Teniendo alcance en los siguientes países
                                            <center>
                                                <img src="img/prudential/img2.jpg" style="width:80%;"/>
                                            </center>

                                            •	Presencia en México: Prudential Seguros México S.A. 
                                            •	Se establecen en el año 2006
                                            •	Empresa filial de Prudential Financial Inc. 


                                            Av. Ejército Nacional 843-B, Acceso B, Piso 2, Antara Polanco, Col. Granada, C. P. 11520 
                                            México, D.F. (administración)
                                            Punto Polanco Lago Alberto 319, Anáhuac I Secc., 11520 Miguel Hidalgo, CDMX (fuerza de venta)

                                        </p>
                                    </div>
                                </div>

                            </div>
                            <div id="menu3" class="tab-pane fade">

                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="VIDA PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">VIDA PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="BIENESTAR PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">BIENESTAR PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="Folleto_Hombre_Clave.pdf" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">HOMBRE CLAVE</button></a>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="GARANTIA PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">GARANTÍA PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="RESPALDO PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">RESPALDO PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="RESPALDO PRUDENTIAL PREMIUM.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">RESPALDO PRUDENTIAL PREMIUM</button></a>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <br />
                                        <br />
                                        <iframe id="producto" name="producto" style="width: 100%; height: 500px;"></iframe>

                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>

                                    <iframe src="../Examples/condiciones.pdf" style="width: 100%; height: 500px;"></iframe>
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
                    <div id="mapfre" class="tab-pane fade">
                        <ul class="nav nav-tabs">

                            <li><a data-toggle="tab" href="#menu3">Productos</a></li>
                            <li><a data-toggle="tab" href="#menu1">Condiciones Generales</a></li>
                            <li><a data-toggle="tab" href="#menu2">Ventajas de PRM</a></li>
                        </ul>
                        <br>
                        <div class="tab-content">
                            <div id="inicio" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10 header-mid">
                                        <p>MAPFRE</p>
                                    </div>
                                </div>
                                <br>
                                <div class="row content-middle">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-10" style="text-align: justify;">
                                        <p>
                                            Tenemos los mejores planes de protección para garantizar que nuestros Asegurados hagan realidad sus planes y proyectos
Integramos planes de protección de Vida Entera, Seguro Temporal y Planes de Ahorro para brindar a nuestros Asegurados la tranquilidad de contar con las mejores coberturas del mercado a precios muy competitivos
<center><img src="img/mapfre/img1.jpg" style="width:60%"/></center>
Nuestros productos

Planes de protección:
	Plan temporal 
	Plan temporal Preferente
	Temporal uno masiva
	Meridiano Venta masiva
	Plan Temp. Básico Estandarizado
	Servicios Funerarios

Plan de Protección y Ahorro 
	Plan Vida Entera
	Plan Vida Entera Pagos Limitados
	Plan de Ahorro Mixto 
	Plan Devolución Plus

Plan de Ahorro para la Educación

	Plan Superación Plus

                                        </p>
                                    </div>
                                </div>

                            </div>
                            <div id="menu3" class="tab-pane fade">

                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="VIDA PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">VIDA PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="BIENESTAR PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">BIENESTAR PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="Folleto_Hombre_Clave.pdf" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">HOMBRE CLAVE</button></a>
                                        </div>

                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <a href="GARANTIA PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">GARANTÍA PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="RESPALDO PRUDENTIAL.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">RESPALDO PRUDENTIAL</button></a>
                                        </div>
                                        <div class="col-lg-4">
                                            <a href="RESPALDO PRUDENTIAL PREMIUM.PDF" target="producto">
                                                <button type="button" class="btn btn-x btn-default" style="width: 100%">RESPALDO PRUDENTIAL PREMIUM</button></a>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <br />
                                        <br />
                                        <iframe id="producto" name="producto" style="width: 100%; height: 500px;"></iframe>

                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Condiciones Generales</h3>
                                <p>

                                    <iframe src="../Examples/condiciones.pdf" style="width: 100%; height: 500px;"></iframe>
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


            </div>
        </div>

    </div>

</asp:Content>

