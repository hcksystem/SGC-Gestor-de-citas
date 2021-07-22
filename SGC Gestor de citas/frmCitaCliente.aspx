<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente.Master" AutoEventWireup="true" CodeBehind="frmCitaCliente.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCitaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
    .btn{background-color:#626c7d}
    .btn:hover{background-color:#0c3254;} 
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
                        <h5 class="title">Gestión de citas</h5>

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
                            <asp:ListView ID="listaServicios" runat="server" GroupItemCount="30"
                                DataKeyNames="id"
                                ItemType="Entidades.Servicio"
                                SelectMethod="listaServicios_GetData" >
                                <EmptyDataTemplate>
                                    <div class="col-md">
                                        No hay datos
                                    </div>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <div class="text-center border-primary mb-4">
                                    </div>
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <div class="row">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <div class="col-md">
                                        <div class="card text-center border-primary mb-4">
                                            <div class="card-body">
                                                <h5 class="card-title"><%#:Item.Nombre %></h5>
                                                <p class="card-text"><%#:Item.Descripcion %></p>
                                                <p class="card-text"><%# Eval("precioEstimado","${0:N2}") %></p>
                                                <asp:Button CssClass="btn"
                                                    ID="btnReservar"
                                                    runat="server" Text="Reservar Cita"
                                                    CommandArgument='<%#:Item.ID %>'
                                                    OnCommand="btnReservar_Command" />

                                            </div>
                                        </div>
                                    </div>
                           
                                </ItemTemplate>

                            </asp:ListView>
                        </div>


                    </div>
                </div>
            </div>
        </div>
  </div>
</asp:Content>
