<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMenuAdministrador.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMenuAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <style>
        .btn {
            background-color: #626c7d
        }

            .btn:hover {
                background-color: #0c3254;
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
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <asp:ListView ID="listaNegocio" runat="server" GroupItemCount="10"
                                DataKeyNames="id"
                                ItemType="Entidades.Negocio"
                                SelectMethod="listaNegocio_GetData">
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
                                                <p class="card-title"><%# Item.Logo %></p>
                                                <h5class="card-text"><%#:Item.Nombre %></h5>
                                                <p class="card-text"><%#:Item.Descripcion %></p>
                                                <p class="card-text"><%#:Item.Mision %></p>
                                                <p class="card-text"><%#:Item.Vision %></p>
                                                <asp:Button CssClass="btn"
                                                    ID="btnReservar"
                                                    runat="server" Text=""
                                                    CommandArgument='<%#:Item.ID %>'
                                                    OnCommand="btnReservar_Command"
                                                   
                                                    />

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
