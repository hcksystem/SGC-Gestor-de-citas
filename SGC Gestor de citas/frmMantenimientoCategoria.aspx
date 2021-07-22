<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoCategoria.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/acordeon.css" rel="stylesheet" />
    <link href="assets/css/estilogrid.css" rel="stylesheet" />

    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />

    <link href="assets/css/estiloLista.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <style>
        .tab label::after {
            top: 42px;
        }

        #btnAyuda {
            margin-left: 92%;
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
                        <h5 class="title">Categorías de productos</h5>

                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mantenimiento de categorías</h5>
                                <h6>Nombre de la categoría</h6>
                                <p>
                                    Espacio donde se debe indicar una categoría en la cual desee catalogar sus productos.
                             <br />
                                    Por ejemplo: cosméticos, electrónicos, cuidado para la piel, productos de latex etc.
                                </p>
                                <br />
                                <h6>Botón de guardar</h6>
                                <p>Se guardará la categoría que se digito en el espacio de nombre</p>
                                <br />
                                <h6>Mostrar Lista</h6>
                                <p>
                                    Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            de las categorías que tenemos almacenadas hasta el momento, en esa lista tendríamos acceso a la opción de seleccionar o eliminar una categoría.
                                </p>
                                <br />
                                <h6>Seleccionar</h6>
                                <p>
                                    Se habilitarán los espacios para que se edite la información necesaria y se llenarán los campos dentro del formulario para seguidamente editar lo que se desee y se le da al botón modificar. Luego de esto se podrán visualizar los cambios atualizados en la tabla.
                                </p>
                                <br />
                                <h6>Eliminar</h6>
                                <p>
                                    Al tocar este botón se mostrará un mensaje de confirmación como este, ("Esta seguro que desea eliminar este registro?"), si se le da aceptar, se eliminará el registro selecionado y si se le da cancelar la acción se anulará.
                                </p>

                            </div>

                        </div>

                    </div>


                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Nombre Categoría:</label>
                                    <br />
                                    <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteC"
                                        ControlToValidate="txtNombreCategoria" ErrorMessage="El nombre de la categoría es requerido" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                    <asp:Button ID="btnModificar" class="btn btn-primary btn-round" runat="server" Visible="false" Text="Modificar" OnClick="btnModificar_Click" />
                                </div>
                            </div>


                            <div class="col-12 tab">
                                <input id="tab-1" type="checkbox" style="display: none">
                                <hr />
                                <label for="tab-1">Mostrar lista</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridCategorias" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" AllowSorting="True" OnRowDeleting="gridCategorias_RowDeleting" OnPageIndexChanging="gridCategorias_PageIndexChanging" OnSelectedIndexChanged="gridCategorias_SelectedIndexChanged" OnRowDataBound="gridCategorias_RowDataBound" Width="100%">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" ShowHeader="true" HeaderText="Seleccionar" ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png" />
                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" HeaderText="Eliminar" ButtonType="Image" DeleteImageUrl="~/assets/img/basurero.jpg" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Nombre Categoría" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
