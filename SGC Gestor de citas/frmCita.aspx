<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmCita.aspx.cs" Inherits="SGC_Gestor_de_citas.frmCita" %>

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
         <div class="fixed-plugin">
        <div class="dropdown show-dropdown">
            <a href="#" data-toggle="dropdown">
                <i class="fa fa-cog fa-2x"></i>
            </a>
            
            <ul class="dropdown-menu"> 
               
                <li class="button-container">
                    
                    <a href="frmCita.aspx" target="_blank" style="width: 50px;">
                        <div  style="overflow: scroll">
                           <p style="color:dimgrey">Ayuda<br />En este formulario se muestran todos los servicios que se ofrecen. <br />Botón reservar: Al elegir el servicio se redirige automáticamente al formulario de reservación de su cita.</p>
                        </div>
                         

                       
                       
                    </a>

                </li>
            </ul>
            </div>
        
    </div>
 
        
</asp:Content>
