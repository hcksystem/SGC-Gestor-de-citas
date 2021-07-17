<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMantenimientoCategoria.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMantenimientoCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/acordeon.css" rel="stylesheet" />
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <style>
         .btn{background-color:#626c7d}
         .btn:hover{background-color:#0c3254;}  
         .tab label::after{
             top:42px;
         }
    </style>
    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Categorías de productos</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                   
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Nombre Categoría:</label>
                                    <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteC"
                                        ControlToValidate="txtNombreCategoria" ErrorMessage="El nombre de la categoría es requerido" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                            <div class="col-md-4 pl-1">
                                <div class="form-group">
                                   
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                   
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <asp:Button ID="btnGuardar" CssClass="btn btn-round" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                     <asp:Button ID="btnCancelar" CssClass="btn btn-round" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" />
                                     <asp:Button ID="btnModificar" CssClass="btn btn-round" runat="server" Visible="false" Text="Modificar" OnClick="btnModificar_Click" />
                                </div>
                            </div>
                            
                            <div class="col-12 tab">
                                <input id="tab-1" type="checkbox" style="display: none">
                                <hr />
                                <label for="tab-1">Mostrar lista</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridCategorias" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" AllowSorting="True" OnRowDeleting="gridCategorias_RowDeleting" OnPageIndexChanging="gridCategorias_PageIndexChanging" OnSelectedIndexChanged="gridCategorias_SelectedIndexChanged" OnRowDataBound="gridCategorias_RowDataBound">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" ShowHeader="true" HeaderText="Seleccionar" ButtonType="Image" SelectImageUrl="~/assets/img/Seleccionar).png"/>
                                                <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" HeaderText="Eliminar" ButtonType="Image" DeleteImageUrl="~/assets/img/basurero.jpg" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Nombre Categoría" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
     </div>
 </div>
</asp:Content>
