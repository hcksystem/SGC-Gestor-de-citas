<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado.Master" AutoEventWireup="true" CodeBehind="frmMenuEmpleado.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMenuEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karantina&display=swap" rel="stylesheet">

    <link href="assets/css/estiloLista.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <b>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></b>

    <style>
        .btn {
            background-color: #626c7d
        }

            .btn:hover {
                background-color: #0c3254;
            }

        .table {
            border-collapse: separate;
            padding: 15px 3px 0px 8px;
        }

            .table td, .table th {
                border: 1px dashed transparent;
                width: 230px;
                text-align: center;
                font-size: 23px;
            }

            .table th, .table th {
                border: 1px dashed transparent;
                width: 230px;
                text-align: center;
                font-size: 35px;
                color: #626c7d;
            }

        .letra {
            font-family: 'Karantina', cursive;
            font-size: 45px;
        }

        .panel-header-sm {
            background: #c0c3c8;
        }

        .table-hover tbody tr:hover {
            color: black;
        }

        .table-hover tbody th:hover {
            color: #626c7d;
        }

        .table-hover .table-primary:hover {
            background-color: #ff0000;
        }

        .table-hover tbody:hover {
            background-color: transparent;
        }

        .table-hover tbody tr:hover {
            color: black;
            background: transparent;
        }
         .h6, h6 {
            font-size: 1rem;
            font-weight: bold;
        }
    </style>

    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title"></h5>
                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Menú principal</h5>
                                <h6>Menu Horizontal color gris</h6>
                                <p>
                                    Este menú cuenta con dos opciones en la esquina superior derecha, al seleccionar el icono de tuerca se desplegarán dos opciones:
                                    <br />
                                    * Cerrar sesión: Al presionar cerrar sesión, se mostrará un mensaje que dice: "Sesión finalizada con éxito", al presionar aceptar, se redirigirá al formulario de inicio de sesión en donde ya no podrá ingresar a menos de que vuelva a digitar sus credenciales.
                                    <br />
                                    * Acerca de: Al presionar este botón, se abrirá un formulario con la información importante.
                                </p>
                                <br />
                                <h6>Menú vertical color azul</h6>
                                <p>Este menú muestra todos los formularios dentro del sistema: estos son los encargados de redireccionar a el usuaario por el formulario que desee, cada uno tiene un nombre representativo al formulario que le corresponde mostrar.</p>
                                <br />
                                <h6>Contenido central de la página</h6>
                                <p>
                                   El contenido del menú principal muestra el negocio creado desde el mantenimiento de negocios.
                                </p>
                                
                            </div>

                        </div>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row" style="overflow:scroll">


                            <fieldset class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="grvListado" runat="server" BorderStyle="NotSet" BorderColor="Transparent" BorderWidth="0px"
                                            AutoGenerateColumns="false" CssClass="table table-hover"
                                            CellSpacing="20" CellPadding="20"
                                            Width="100%" OnRowDataBound="grvListado_RowDataBound">


                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="id" Visible="false" ControlStyle-Width="100px" ControlStyle-Font-Size="23px"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Logo">
                                                    <ItemTemplate>
                                                        <img src='<%# Eval("logo") %>' id="imageControl" runat="server" width="150" height="160" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>

                                                <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>
                                                <asp:BoundField DataField="mision" HeaderText="Misión"></asp:BoundField>
                                                <asp:BoundField DataField="vision" HeaderText="Visión"></asp:BoundField>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="white" Font-Bold="True" ForeColor="black" VerticalAlign="Middle" CssClass="letra"></HeaderStyle>



                                        </asp:GridView>
                                    </ContentTemplate>

                                </asp:UpdatePanel>


                            </fieldset>

                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

