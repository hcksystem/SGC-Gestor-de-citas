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
                                <h6>Nombre de la categoría</h6>
                                <p>
                                    Espacio donde se debe indicar una categoría en la cual desee catalogar sus productos.
                             <br />
                                    Por ejemplo: cosméticos, electrónicos, cuidado para la piel, productos de latex etc.
                                </p>
                                <br />
                                <h6>Botón de guardar</h6>
                                <p>Se guardará la categoría que se digito en el espacio de nombre</p>
                                <br />
                                <h6>Mostrar Lista</h6>
                                <p>
                                    Sobre esta palabra tenemos la opción de tocar o clickear para que se nos despliegue un listado
                            de las categorías que tenemos almacenadas hasta el momento, en esa lista tendríamos acceso a la opción de seleccionar o eliminar una categoría.
                                </p>
                                <br />
                                <h6>Seleccionar</h6>
                                <p>
                                    Se habilitarán los espacios para que se edite la información necesaria y se llenarán los campos dentro del formulario para seguidamente editar lo que se desee y se le da al botón modificar. Luego de esto se podrán visualizar los cambios atualizados en la tabla.
                                </p>
                                <br />
                                <h6>Eliminar</h6>
                                <p>
                                    Al tocar este botón se mostrará un mensaje de confirmación como este, ("Esta seguro que desea eliminar este registro?"), si se le da aceptar, se eliminará el registro selecionado y si se le da cancelar la acción se anulará.
                                </p>

                            </div>

                        </div>

                    </div>


                    <hr />
                    <div class="card-body" style="min-height:450px">
                        <div class="row">
                           

                            <div class="col-md-8" style="overflow: scroll;min-height:450px">
                                <div class="form-group">
                                    <ul class="nav nav-pills nav-fill">
    <li class="nav-item active"><a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Citas Pendientes</a></li>
    <li class="nav-item"><a class="nav-link" id="menu1-tab" data-toggle="tab" href="#menu1" role="tab" aria-controls="profile" aria-selected="false">Citas Canceladas</a></li>
    <li class="nav-item"><a class="nav-link" id="menu2-tab" data-toggle="tab" href="#menu2" role="tab" aria-controls="profile" aria-selected="false">Citas Histórico</a></li>
    <li class="nav-item"><a class="nav-link" id="menu3-tab" data-toggle="tab" href="#menu3" role="tab" aria-controls="profile" aria-selected="false">Menu 3</a></li>
  </ul>
<div class="tab-content">
    <div id="home" class="tab-pane fade show active">
      <asp:GridView ID="gridCitasPendientes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="4" AllowPaging="True" Width="100%" OnPageIndexChanging="gridMisCitas_PageIndexChanging" OnRowDeleting="gridMisCitas_RowDeleting" OnRowDataBound="gridMisCitas_RowDataBound" OnRowCommand="gridMisCitas_RowCommand">
                                        <Columns>
                                    <asp:TemplateField ShowHeader="true" HeaderText="Cancelar cita" >
                                    <ItemTemplate>
                                     <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="Cancelar" ImageUrl="~/assets/img/cancelar.png" Text="Eliminar" />
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
      
          <div id="home" class="tab-pane fade show active">
      <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" PageSize="4" AllowPaging="True" Width="100%" OnPageIndexChanging="gridMisCitas_PageIndexChanging" OnRowDeleting="gridMisCitas_RowDeleting" OnRowDataBound="gridMisCitas_RowDataBound" OnRowCommand="gridMisCitas_RowCommand">
                                        <Columns>
                                    <asp:TemplateField ShowHeader="true" HeaderText="Cancelar cita" >
                                    <ItemTemplate>
                                     <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="Cancelar" ImageUrl="~/assets/img/cancelar.png" Text="Eliminar" />
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

    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
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
