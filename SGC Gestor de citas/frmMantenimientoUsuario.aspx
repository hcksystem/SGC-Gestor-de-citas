<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoUsuario.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html>
    <link href="assets/css/estilogrid.css" rel="stylesheet" />   
      <div class="panel-header-sm">
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
                      </div>
                    </div>                       
                           <div class="col-md-4 pr-1">
                      <div class="form-group">                                            
                      </div>
                    </div>
                    <div class="col-md-4 pl-1">
                      <div class="form-group">
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Usuario" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" OnClick="btnCancelar_Click" />
                      </div>
                    </div>
                    <head>
                    <meta charset="utf-8" />
                    <title>Lista Negocio</title>
                    <link href="assets/css/now-ui-dashboard.css" rel="stylesheet" />

                   </head>
                    <body>
                    <input type="checkbox" id="btn-modal" />
                    <label for="btn-modal" class="lbl-modal">Mostrar Lista</label>
                    <div class="modal">
                        <div class="contenedorlista" style="overflow: scroll">
                            <header>Lista de Usuarios</header>
                            <label for="btn-modal">X</label>


                <asp:GridView CssClass="mGrid GridView" PagerStyle-CssClass="pgr" ID="gridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridUsuarios_RowCancelingEdit" OnRowDeleting="gridUsuarios_RowDeleting" OnRowEditing="gridUsuarios_RowEditing" OnRowUpdating="gridUsuarios_RowUpdating" OnRowDataBound="gridUsuarios_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<% # Bind("id") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CORREO">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% # Bind("correoUsuario") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCorreo" runat="server" Text='<% # Bind("correoUsuario") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TELEFONO">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<% # Bind("telefono") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTelefono" runat="server" Text='<% # Bind("telefono") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CONTRASEÑA">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # Bind("contrasenna") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContrasenna" runat="server" Text='<% # Bind("contrasenna") %>'></asp:TextBox>
                        </EditItemTemplate>
                                </asp:TemplateField>
                    <asp:TemplateField HeaderText="ROL">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # Bind("idRoll") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="dropRol" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                            &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                
            </asp:GridView>
                  </div>       
                  </div>
                  </body>
                  </html>
</asp:Content>
