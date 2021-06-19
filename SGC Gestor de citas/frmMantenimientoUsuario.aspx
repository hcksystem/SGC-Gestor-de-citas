<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoUsuario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoUsuario" %>
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
                <h5 class="title">Mantenimiento de Usuarios</h5>
              </div>
              <div class="card-body">
                
                  <div class="row">
                    <div class="col-md-5 pr-1">
                      <div class="form-group">
                        <label>Correo electronico</label>
                         <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-md-3 px-1">
                      <div class="form-group">
                        <label>Telefono</label>
                       
                          <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <label for="exampleInputEmail1">Contraseña</label>
                      
                          <asp:TextBox ID="txtContrasenna" runat="server" CssClass="form-control"></asp:TextBox>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6 pr-1">
                      <div class="form-group">
                        <label>Rol del Usuario </label>
                        <asp:DropDownList ID="dropRol" runat="server"></asp:DropDownList>
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
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                       
                        <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" />
                      </div>
                    </div>
                  </div>
       
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label>Usuarios Registrados</label>
                         <%-- el grid puede ir aca o ponerse a la derecha que es mejor?--%>
 
                      </div>
                    </div>
                  </div>
                 
                </div>
              </div>
            </div>
          </div>
    

</asp:Content>
