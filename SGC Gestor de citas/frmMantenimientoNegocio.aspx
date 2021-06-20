<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoNegocio.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoNegocio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
            <h5 class="title">Negocio</h5>
        </div>
        <div class="card-body">

            <div class="row">
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nombre</label>
                        <asp:TextBox ID="txtNombreNegocio" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtNombreNegocio" ErrorMessage="El nombre del negocio es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Descripcion</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtDescripcion" ErrorMessage="La descripcion es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nuestra Mision</label>
                        <asp:TextBox ID="txtMision" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteN"
                            ControlToValidate="txtMision" ErrorMessage="La vision es necesaria" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-6 pl-1">
                    <div class="form-group">
                        <label>Nuestra Vision</label>
                        <asp:TextBox ID="txtVision" runat="server" CssClass="form-control"></asp:TextBox>
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

                        <asp:FileUpload ID="FileUpload1" accept=".jpg" runat="server" />
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
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" Text="Guardar Negocio" ValidationGroup="ManteN" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" class="btn btn-primary btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
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
                            <header>Lista de negocios</header>
                            <label for="btn-modal">X</label>


                <asp:GridView CssClass="mGrid GridView" ID="gridNegocio" PagerStyle-CssClass="pgr" runat="server" AutoGenerateColumns="false" DataKeyNames="id" AllowPaging="True" ShowFooter="True" OnRowCancelingEdit="gridNegocio_RowCancelingEdit" OnRowDeleting="gridNegocio_RowDeleting" OnRowEditing="gridNegocio_RowEditing" OnRowUpdating="gridNegocio_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<% # Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtID" runat="server" Text='<% # Bind("id") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
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
                            <asp:Label ID="Label7" runat="server" Text='<% # Bind("logo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fileLogo" runat="server"></asp:FileUpload>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DESCRIPCION">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<% # Bind("descripcion") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescripcion" runat="server" Text='<% # Bind("descripcion") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MISION">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<% # Bind("mision") %>'></asp:Label>
                      </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMision" runat="server" Text='<% # Bind("mision") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="VISION">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<% # Bind("vision") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtVision" runat="server" Text='<% # Bind("vision") %>'></asp:TextBox>
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
                    <asp:CommandField />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                </asp:GridView>
            </div>
            </div>
            </body>
              
</html>

</asp:Content>
