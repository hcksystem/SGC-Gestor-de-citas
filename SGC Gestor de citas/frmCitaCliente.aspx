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

    <link href="assets/css/estiloLista.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
    
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
                                <h5>Citas</h5>
                                <p>
                                    Este es el formulario principal de citas, en este se mostrará un listado de todos los servicios que brinda el negocio, en cada uno se muestra:<br />
                                    * El nombre del servicio.<br />
                                    * La descripción del servicio.<br />
                                    * El precio del servicio.
                             <br />
                                </p>
                                <br />
                                <h6>Botón reservar cita</h6>
                                <p>Al seleccionar este botón se mostrará el formulario encargado de facilitar el horario y su respectivo trámite para sacar su cita.</p>

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
                                            <div class="card-body" style="height:180px; width:300px">
                                                <h5 class="card-title"><%#:Item.Nombre %></h5>
                                                <p class="card-text"><%#:Item.Descripcion %></p>
                                                <p class="card-text"><%# Eval("precioEstimado","₡{0:N2}") %></p>
                                                <asp:Button CssClass= "btn-primary btn-round"
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
