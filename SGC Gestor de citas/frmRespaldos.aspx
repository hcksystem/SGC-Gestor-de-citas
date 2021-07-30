<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmRespaldos.aspx.cs" Inherits="SGC_Gestor_de_citas.frmRespaldos" %>
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
    .btn-primary {
    
    margin-left: 20px;
    margin-top: 62px
}
    .btn:not(:disabled):not(.disabled) {
    
    margin-bottom: 20px;
}
        .h6, h6 {
            font-size: 1rem;
            font-weight: bold;
        }
  </style>

    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title">Crear Respaldo</h5>
                           <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Formulario de respaldos</h5>
                                <h6>Crear respaldo</h6>
                                <p>
                                    Espacio donde se debe .
                             
                                </p>
                                <br />
                                    <h6>Restaurar respaldo</h6>
                                <p>
                                    Espacio donde se debe .
                             
                                    
                                </p>
                               
                               
                            </div>

                        </div><%--fin ayuda--%>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">

                                <asp:Button runat="server" Text="Realizar Backup" CssClass="btn btn-outline-warning" OnClick="Unnamed_Click" />
                                </div>
                            </div>
                        </div> <%--fin row 1--%>

                    </div>
                </div> <%--fin card--%>

              <%--  division de cards, de aca en adelante es el segundo--%>

                   <div class="card"> <%--#2--%>

                    <div class="card-header">
                        <h5 class="title">Restaurar respaldos</h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col-6">
                            <div class="form-inline">
                                <div class="form-group">
                                <asp:Button ID="btnRestaurar" runat="server" Text="Restaurar" CssClass="btn btn-primary btn-round" Width="127px" OnClick="btnRestaurar_Click" />
                                    </div>
                            </div>
                                </div>
                             
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                   <asp:GridView CssClass="table table-hover" ID="GridView1" runat="server"  OnRowCommand="GridView1_RowCommand"
                                        AutoGenerateColumns="false" AllowPaging="True" >
                                       <columns>
                                       <asp:TemplateField HeaderText="Nombre Backup">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkNombreBackup" runat ="server" CommandArgument='<%#Eval("NombreBackup")%>' CommandName ="SelectBackup"   Text ='<%#Eval("NombreBackup")%>'>  
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Fecha">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFecha" runat="server" Text='<%#Bind("Fecha")%>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                           </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Hora">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHora" runat="server" Text='<%#Bind("Hora")%>' Width="170"></asp:Label>
                                                    </ItemTemplate>
                                           </asp:TemplateField>
                                           </columns>
                                   </asp:GridView>
                                    </div>
                                </div>
                            </div>

                    </div>
                </div> <%--fin del card--%>

            </div>
        </div>
   </div>
</asp:Content>
