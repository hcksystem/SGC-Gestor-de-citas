﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente.Master" AutoEventWireup="true" CodeBehind="frmPerfilCliente.aspx.cs" Inherits="SGC_Gestor_de_citas.frmPerfilCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Cliente</h5>
                    </div>
                    <hr />
                    <div class="card-body">



                        <div class="row">
                        </div>
                        <table class="table table-hover">
            <tr>
                <th>Identificación</th>
                <td colspan="2">
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtID" placeholder="Identificación"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Nombre Completo</th>
                <td colspan="2">
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtNombre" placeholder="Nombre"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Apellidos</th>
                <td colspan="2">
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtApellidos" placeholder="Apellidos"></asp:TextBox></td>
            </tr>
            <tr>
                <th>E-Mail</th>
                <td colspan="2">
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtCorreo" placeholder="E-mail"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Teléfono</th>
                <td>
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtTelefono" placeholder="E-mail"></asp:TextBox></td>
            </tr>
                            <tr>
                                <th>Cambiar Contraseña</th><td>
                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" ID="txtOldPassword" placeholder="Clave Anterior"></asp:TextBox></td><td>
                    <asp:TextBox CssClass="form-control" runat="server" TextMode="Password" ID="txtNewPassword" placeholder="Nueva Clave"></asp:TextBox></td>
                                </tr>
            <tr>
                <td colspan="2">
                <asp:Button runat="server" CssClass="btn-block btn btn-primary" Text="Guardar" ID="Guardar" OnClick="Guardar_Click"></asp:Button>
                    </td><td><asp:Button runat="server" CssClass="btn-block btn btn-secondary" Text="Cancelar"></asp:Button></td></tr>
        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>