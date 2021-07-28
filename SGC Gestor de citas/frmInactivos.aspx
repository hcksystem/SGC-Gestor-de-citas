<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true"
    CodeBehind="frmInactivos.aspx.cs" Inherits="SGC_Gestor_de_citas.frmInactivos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <link href="assets/css/acordeon.css" rel="stylesheet" />

    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link href="assets/css/estiloLista.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <style>
        /* (F) EXTRA - ADD ARROW INDICATOR */
    .tab label::after {
        content: "\25b6";
        position: absolute;
        right: 24px;
        top: 20px !important;
        display: block;
        transition: all 0.4s;
        
        
    }

    .tab input:checked ~ label::after {
        transform: rotate(90deg);
    }
  </style>

    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Productos</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                             <div class="col-12 tab" style="margin-top: -16px;">
                                <%-- <asp:DropDownList ID="dropProductosInactivos" runat="server"></asp:DropDownList>--%>
                                <input id="tab-1" type="checkbox" style="display: none">
                              
                                <label for="tab-1">Mostrar inactivos</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridProductosInactivos" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" AllowSorting="True" OnPageIndexChanging="gridProductosInactivos_PageIndexChanging" OnSelectedIndexChanged="gridProductosInactivos_SelectedIndexChanged" OnRowDataBound="gridProductosInactivos_RowDataBound" OnRowDeleting="gridProductosInactivos_RowDeleting" Width="100%">
                                            <Columns>
                                  
                                              <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" 
                                                    HeaderText="Eliminar" ButtonType="Image" 
                                                    DeleteImageUrl="~/assets/img/Seleccionar).png" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                                                <asp:BoundField DataField="precio" HeaderText="Precio" />
                                                <asp:BoundField DataField="estado" HeaderText="Estado" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div> <%--fin row 1--%>

                    </div>
                </div> <%--fin card--%>
                   <div class="card">

                    <div class="card-header">
                        <h5 class="title">Servicios</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                             <div class="col-12 tab" style="margin-top: -16px;">
                            <%--     <asp:DropDownList ID="dropServiciosInactivos" runat="server"></asp:DropDownList>--%>
                                <input id="tab-2" type="checkbox" style="display: none">
                             
                                <label for="tab-2">Mostrar inactivos</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridServiciosInactivos" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" AllowSorting="True" OnPageIndexChanging="gridServiciosInactivos_PageIndexChanging" OnSelectedIndexChanged="gridServiciosInactivos_SelectedIndexChanged" OnRowDataBound="gridServiciosInactivos_RowDataBound" OnRowDeleting="gridServiciosInactivos_RowDeleting" Width="100%">
                                            <Columns>
                                   
                                              <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" 
                                                    HeaderText="Eliminar" ButtonType="Image" 
                                                    DeleteImageUrl="~/assets/img/Seleccionar).png" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                                                <asp:BoundField DataField="estado" HeaderText="Estado" />
                                             
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div> <%--fin row 1--%>

                    </div>
                </div> <%--fin del card--%>
                 <div class="card">

                    <div class="card-header">
                        <h5 class="title">Usuarios</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                             <div class="col-12 tab" style="margin-top: -16px;">
                                <%-- <asp:DropDownList ID="dropUsuariosInactivos" runat="server"></asp:DropDownList>--%>
                                <input id="tab-3" type="checkbox" style="display: none">
                                
                                <label for="tab-3">Mostrar inactivos</label>
                                <div class="tab-content">
                                    <div style="overflow: scroll">

                                        <asp:GridView ID="gridUsuariosInactivos" CssClass="mGrid GridView" runat="server" DataKeyNames="id" AutoGenerateColumns="False" AllowPaging="True" PageSize="8" AllowSorting="True" OnPageIndexChanging="gridUsuariosInactivos_PageIndexChanging" OnSelectedIndexChanged="gridUsuariosInactivos_SelectedIndexChanged" OnRowDataBound="gridUsuariosInactivos_RowDataBound" OnRowDeleting="gridUsuariosInactivos_RowDeleting" Width="100%">
                                            <Columns>
                                   
                                              <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" ShowHeader="true" 
                                                    HeaderText="Eliminar" ButtonType="Image" 
                                                    DeleteImageUrl="~/assets/img/Seleccionar).png" />
                                                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                                                <asp:BoundField DataField="idRoll" HeaderText="Rol" />
                                                <asp:BoundField DataField="estado" HeaderText="Estado" />
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                                <asp:BoundField DataField="apellido" HeaderText="Apellido" />
                                                <asp:BoundField DataField="identificacion" HeaderText="Identificación" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div> <%--fin row 1--%>

                    </div>
                </div>

            </div>
        </div>
   </div>
</asp:Content>
