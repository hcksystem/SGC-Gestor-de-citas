<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoServicio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="assets/css/now-ui-dashboard.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <div class="panel-header panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Mantenimiento de Usuarios</h5>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-5 pl-1">
                                <div class="form-group">
                                    <label>Nombre </label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                    <label>Descripcion</label>

                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Precio estimado</label>

                                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Tiempo estimado </label>
                                    <asp:TextBox ID="txtTiempoEstimado" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 pl-1">
                                <div>

                                    <label>Foto </label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />

                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">

                                    <label>Producto necesario </label>
                                    <asp:DropDownList ID="dropProducto" runat="server"></asp:DropDownList>

                                </div>
                            </div>
                            <div class="col-md-4 pl-1">
                                <div class="form-group">

                                    <label>Foto </label>
                                    <asp:DropDownList ID="dropNegocio" runat="server"></asp:DropDownList>

                                </div>
                            </div>

                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-3 pl-1">
                                <div class="form-group">
                                </div>
                            </div>
                            <div class="col-md-6 pl-1">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Servicio" OnClick="btnGuardar_Click" />
                                    <asp:Button ID="btnMostrarLista" class="btn btn-primary btn-round" runat="server" Text="Mostrar lista" />
                                    <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" />
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>
