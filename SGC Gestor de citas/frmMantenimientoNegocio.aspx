<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoNegocio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoNegocio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />
    <!DOCTYPE html>
    <html>
    
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
<div class="col-md-12">
    <div class="card">
        
        <div class="card-header">
            <h5 class="title">Negocio</h5>
        </div>
        <hr />
        <div class="card-body">

            <div class="row">
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox ID="txtNombreNegocio" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtNombreNegocio" ErrorMessage="El nombre del negocio es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Descripcion</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtDescripcion" ErrorMessage="La descripcion es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nuestra Mision</label>
                        <asp:TextBox ID="txtMision" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtMision" ErrorMessage="La vision es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nuestra Vision</label>
                        <asp:TextBox ID="txtVision" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtVision" ErrorMessage="La vision es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 pl-1">
                    <div>
                        <label>Logo</label>
                        <br />
                        <br />
                        <asp:FileUpload ID="FileUpload1" accept=".jpg" runat="server" ForeColor="#626c7d" Font-Size="Small"/>
                        <asp:Image ID="Image1" runat="server" Visible="false" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="FileUpload1" ErrorMessage="El logo es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
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

                <div class="col-md-4 pl-1">
                    <div class="form-group">
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar" ValidationGroup="ManteN" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </div>
                </div>
               </div>
                <div class="col-12 tab">
                <input id="tab-1" type="checkbox" style="display:none">
                <hr />
                <label for="tab-1">Mostrar Lista</label>
                <div class="tab-content">
                <div style="overflow: scroll">
                <asp:GridView CssClass="mGrid GridView" ID="gridNegocio" OnRowDataBound ="gridNegocio_RowDataBound" PagerStyle-CssClass="pgr" PageSize="2" runat="server"  AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridNegocio_RowCancelingEdit" OnRowDeleting="gridNegocio_RowDeleting" OnRowEditing="gridNegocio_RowEditing" OnRowUpdating="gridNegocio_RowUpdating" OnPageIndexChanging="gridNegocio_PageIndexChanging" OnSelectedIndexChanged="gridNegocio_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="Seleccionar">
                        <ItemTemplate>
                            <asp:imageButton  ID="ImageButton2" runat="server"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="Select" ImageUrl="~/assets/img/Seleccionar).png" Text="Seleccionar" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:imageButton ID="ImageButton1" runat="server"  CommandName="Delete" ImageUrl="~/assets/img/basurero.jpg" Text="Eliminar" />
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:BoundField DataField="id" HeaderText="ID" />
                    <asp:TemplateField HeaderText="NOMBRE">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<% # Bind("nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombre" runat="server" Text='<% # Bind("nombre") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LOGO">
                        <ItemTemplate>
                          <img src='<%# Eval("logo") %>' id="imageControl" runat="server" width="70" height="100"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                       <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DESCRIPCION">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # Bind("descripcion") %>' Width="150"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescripcion" runat="server" Text='<% # Bind("descripcion") %>' Width="150"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MISION">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # Bind("mision") %>' Width="150"></asp:Label>
                      </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMision" runat="server" Text='<% # Bind("mision") %>' Width="150"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="VISION">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% # Bind("vision") %>' Width="150"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVision" runat="server" Text='<% # Bind("vision") %>' Width="150"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>                      
                  </div>
                </div>
               </div>
              </div>
            </div>
          </div>
       </div>
  </html>
</asp:Content>
