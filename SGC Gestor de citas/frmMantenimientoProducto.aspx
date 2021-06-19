<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoProducto.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

          <div class="panel-header panel-header-sm">
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
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                        <label>Nombre del Producto</label>
                        <asp:TextBox ID="txtNombreProducto" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-md-4 px-1">
                      <div class="form-group">
                        <label>Categoria</label>
                        <asp:TextBox ID="txtCategoriaProducto" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label>Descripcion</label>
                        <asp:TextBox ID="txtDescripcionProducto" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Cantidad que se posee</label>
                        <asp:TextBox ID="txtCantidadProducto" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Proposito del Producto</label>
                        <asp:TextBox ID="txtPropositoProducto" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pl-1">
                      <div class="form-group">
                        <label>Precio Unitario</label>
                        <asp:TextBox ID="txtPrecioProducto" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Estado</label>
                        <asp:DropDownList ID="dropEstado" runat="server"></asp:DropDownList>
                      </div>
                    </div>
                  </div>
                   <div class="row">
                    <div class="col-md-4 pr-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Producto" />
                      </div>
                    </div>
                        <div class="col-md-4 pr-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnMostrarLista" class="btn btn-primary btn-round" runat="server" Text="Mostrar lista" />
                      </div>
                    </div>
                       <br>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" />
                      </div>
                    </div>
                  </div>
                  </div>
                </div></div></div></div>
                  

</asp:Content>
