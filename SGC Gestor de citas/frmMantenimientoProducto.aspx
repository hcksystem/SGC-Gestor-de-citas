<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoProducto" %>

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
                        <h5 class="title">Formulario de Productos</h5>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Nombre del Producto</label>
                                    <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control" placeHolder="* Dato requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteP"
                                ControlToValidate="txtNombreProducto" ErrorMessage=" *Es necesario indicar un nombre" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Categoria"></asp:Label>
                                    <asp:TextBox ID="txtCategoriaProducto" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteP"
                                ControlToValidate="txtCategoriaProducto" ErrorMessage=" *Digite la categoria del producto" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Descripcion</label>
                                    <asp:TextBox ID="txtDescripcionProducto" runat="server" CssClass="form-control"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteP"
                                ControlToValidate="txtDescripcionProducto" ErrorMessage=" *Digite una descripción del producto" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Cantidad que se posee</label>
                                    <asp:TextBox ID="txtCantidadProducto" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteP" ControlToValidate="txtCantidadProducto" ErrorMessage="Digite la cantidad de productos" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="ManteP" ControlToValidate="txtCantidadProducto" ErrorMessage="La cantidad de producto debe ser mayor que 0"  Display="Dynamic" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Proposito del Producto</label>
                                    <asp:TextBox ID="txtPropositoProducto" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteP"
                                ControlToValidate="txtPropositoProducto" ErrorMessage="Digite un proposito para el producto" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <label>Precio Unitario</label>
                                    <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ManteP"
                                ControlToValidate="txtPrecioProducto" ErrorMessage="Digite el precio del producto" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        </div>
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <br>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">

                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Producto" ValidationGroup="ManteP" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnMostrarLista" class="btn btn-primary btn-round" runat="server" Text="Mostrar lista" />
                                    <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
