<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado.Master" AutoEventWireup="true" CodeBehind="frmCitaEmpleado.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCitaEmpleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .btn{background-color:#626c7d}
    .btn:hover{background-color:#0c3254;}         
    </style>
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Gestión de citas</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <asp:ListView ID="listaServicios" runat="server" GroupItemCount="30"
                                DataKeyNames="id"
                                ItemType="Entidades.Servicio"
                                SelectMethod="listaServicios_GetData">
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
                                   <%-- <layouttemplate>
                                    <div class="container">
                                        <asp:PlaceHolder ID="groupPlaceHolder" runat="server"></asp:PlaceHolder>
                                    </div>
                                </layouttemplate>--%>
                                </ItemTemplate>

                            </asp:ListView>
                        </div>


                    </div>
                </div>
            </div>
        </div>
  </div>
</asp:Content>
