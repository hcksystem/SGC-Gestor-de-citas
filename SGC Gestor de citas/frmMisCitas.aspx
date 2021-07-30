<%@ Page Title="" Language="C#" MasterPageFile="~/Cliente.Master" AutoEventWireup="true" CodeBehind="frmMisCitas.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMisCitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="assets/js/sweetalert2.all.min.js"></script>
    <script src="assets/js/mensaje.js"></script>
    <link href="assets/css/sweetalert2.min.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
   <link href="assets/css/estiloLista.css" rel="stylesheet" />
    
<script>
$(document).ready(function(){
    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
        localStorage.setItem('activeTab', $(e.target).attr('href'));
    });
    var activeTab = localStorage.getItem('activeTab');
    if(activeTab){
        $('#myTab a[href="' + activeTab + '"]').tab('show');
    }
});
</script>
    <script type = "text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Esta seguro que desea cancelar su cita?")) {
                confirm_value.value = "Si";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="title">Mis citas</h5>

                        <input type="checkbox" id="btn-modal" />
                        <label for="btn-modal" class="lbl-modal">Ayuda</label>
                        <div class="modal">
                            <div class="contenedorlista" style="overflow: scroll">
                                <header>Ayuda</header>
                                <label for="btn-modal">X</label>
                                <h5>Mis citas</h5>
                                
                                <p>
                                    Formulario diseñado para visualización y cancelación de sus citas.<br />
                                    En este se mostrará una tabla con tres botones:  
                            
                                </p>
                                <br />
                                <h6>Citas pendientes</h6>
                                <p>Muestra todas las citas pendientes, esto quiere decir que todavía no hemos recibido el servicio.</p>
                                <br />
                                <h6>Botón cancelar cita</h6>
                                <p>Su función es cancelar las citas a las que por alguna razón no va a poder asistir.</p>
                                <h6>Citas canceladas</h6>
                                <p>
                                   Muestra todas las citas canceladas, esto quiere decir que son citas a las que ya no vamos a asistir.
                                </p>
                                <br />
                                <h6>Citas Histórico</h6>
                                <p>
                                   Mustra un listado de todas las citas, tanto pendientes como canceladas y atendidas.
                                </p>
                                <br />
                               
                            </div>

                        </div>

                    </div>


                    <hr />
                    <div class="card-body" style="min-height:450px">
                        <div class="row">
                           

                            <div class="col-md-8" style="overflow: scroll;min-height:450px">
                                <div class="form-group">
                                    <ul class="nav nav-pills nav-fill" id="myTab">
    <li class="nav-item active"><a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Citas Pendientes</a></li>
    <li class="nav-item"><a class="nav-link" id="menu1-tab" data-toggle="tab" href="#menu1" role="tab" aria-controls="profile" aria-selected="false">Citas</a></li>
    <li class="nav-item"><a class="nav-link" id="menu2-tab" data-toggle="tab" href="#menu2" role="tab" aria-controls="profile" aria-selected="false">Citas Histórico</a></li>
  </ul>
<div class="tab-content">
    <div id="home" class="tab-pane fade show active">
      <asp:GridView ID="gridCitasPendientes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="4" AllowPaging="True" Width="100%" OnPageIndexChanging="gridMisCitas_PageIndexChanging" OnRowDeleting="gridMisCitas_RowDeleting" OnRowDataBound="gridMisCitas_RowDataBound" OnRowCommand="gridMisCitas_RowCommand">
                                        <Columns>
                                    <asp:TemplateField ShowHeader="true" HeaderText="Cancelar cita" >
                                    <ItemTemplate>
                                     <asp:ImageButton  OnClientClick="Confirm()" ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="Cancelar" ImageUrl="~/assets/img/cancelar.png" Text="Eliminar" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                             <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                             <asp:BoundField DataField="Fecha" HeaderText="Fecha" ></asp:BoundField>
                            <asp:BoundField DataField="Hora" HeaderText="Hora"></asp:BoundField>
                              <asp:BoundField DataField="idServicio" HeaderText="Servicio"></asp:BoundField>

                                        </Columns>

                                        <HeaderStyle CssClass="table-info" />
                                    </asp:GridView>
    </div>
    <div class="tab-pane fade" id="menu1" role="tabpanel" aria-labelledby="menu1">
      
          <div id="home1" class="tab-pane fade show active">
      <asp:GridView ID="gridCitasCanceladas" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="4" AllowPaging="True" Width="100%" OnPageIndexChanging="gridCitasCanceladas_PageIndexChanging" OnRowDeleting="gridCitasCanceladas_RowDeleting" OnRowDataBound="gridCitasCanceladas_RowDataBound" OnRowCommand="gridCitasCanceladas_RowCommand">
                                        <Columns>
                             <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                             <asp:BoundField DataField="Fecha" HeaderText="Fecha" ></asp:BoundField>
                            <asp:BoundField DataField="Hora" HeaderText="Hora"></asp:BoundField>
                            <asp:BoundField DataField="detEstado" HeaderText="Estado"></asp:BoundField>
                              <asp:BoundField DataField="idServicio" HeaderText="Servicio"></asp:BoundField>

                                        </Columns>

                                        <HeaderStyle CssClass="table-info" />
                                    </asp:GridView>
    </div>

    </div>
    <div id="menu2" class="tab-pane fade">
      
      <div id="home2" class="tab-pane fade show active">
      <asp:GridView ID="gridCitasHistorico" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="4" AllowPaging="True" Width="100%" OnPageIndexChanging="gridCitasHistorico_PageIndexChanging" OnRowDeleting="gridCitasHistorico_RowDeleting" OnRowDataBound="gridCitasHistorico_RowDataBound" OnRowCommand="gridCitasHistorico_RowCommand">
                                        <Columns>
                                   
                             <asp:BoundField DataField="id" HeaderText="ID"></asp:BoundField>
                             <asp:BoundField DataField="Fecha" HeaderText="Fecha" ></asp:BoundField>
                            <asp:BoundField DataField="Hora" HeaderText="Hora"></asp:BoundField>
                              <asp:BoundField DataField="idServicio" HeaderText="Servicio"></asp:BoundField>

                                        </Columns>

                                        <HeaderStyle CssClass="table-info" />
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
        </div>
    </div>
</asp:Content>
