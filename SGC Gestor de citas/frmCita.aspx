<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmCita.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <asp:ListView ID="listaServicios" runat="server" GroupItemCount="3"
                                DataKeyNames="id"
                                ItemType="Entidades.Servicio"
                                SelectMethod="listaServicios_GetData">
                                <EmptyDataTemplate>
                                    <div class="col-md">
                                        No hay datos
                                    </div>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <div class="text-center border-primary mb-4" >
                                    </div>
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <div class="row">
                                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <div class="col-md">
                                        <div class="card text-center border-primary mb-4" style="margin-top:30px">
                                            <div class="card-body" style="height:180px; width:350px" >
                                                <h5 class="card-title"><%#:Item.Nombre %></h5>
                                                <p class="card-text"><%#:Item.Descripcion %></p>
                                                <p class="card-text"><%# Eval("precioEstimado","₡{0:N2}") %></p>
                                                <asp:Button class=" btn-primary btn-round"
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
