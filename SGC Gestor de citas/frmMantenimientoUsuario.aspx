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
                         <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteU"
                            ControlToValidate="txtCorreo" ErrorMessage="El correo es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>
                    </div>
                    <div class="col-md-5 px-1">
                      <div class="form-group">
                        <label>Telefono</label>
                       
                          <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteU"
                            ControlToValidate="txtTelefono" ErrorMessage="El telefono es necesario" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>
                    </div>
                    <div class="col-md-5 pl-1">
                      <div class="form-group">
                        <label>Contraseña</label>
                      
                          <asp:TextBox ID="txtContrasenna" runat="server" CssClass="form-control" placeHolder="* Requerido *"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteU"
                            ControlToValidate="txtContrasenna" ErrorMessage="La contraseña es indispensable" Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:Button ID="btnGuardar" class="btn btn-primary btn-round" runat="server" ValidationGroup="ManteU" Text="Guardar Usuario" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-round" Text="Cancelar" OnClick="btnCancelar_Click" />
                      </div>
                    </div>
                    <head>
                    <meta charset="utf-8" />
                    <title>Lista Usuarios</title>
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

          <div class="fixed-plugin">
        <div class="dropdown show-dropdown">
            <a href="#" data-toggle="dropdown">
                <i class="fa fa-cog fa-2x"></i>
            </a>
            <ul class="dropdown-menu">
                <li class="header-title">Sidebar Background</li>
                <li class="adjustments-line">
                    <a href="javascript:void(0)" class="switch-trigger background-color">
                        <div class="badge-colors text-center">
                            <span class="badge filter badge-yellow" data-color="yellow"></span>
                            <span class="badge filter badge-blue" data-color="blue"></span>
                            <span class="badge filter badge-green" data-color="green"></span>
                            <span class="badge filter badge-orange active" data-color="orange"></span>
                            <span class="badge filter badge-red" data-color="red"></span>
                        </div>
                        <div class="clearfix"></div>
                    </a>
                </li>
                <li class="header-title">Sidebar Mini
                </li>
                <li class="adjustments-line">
                    <div class="togglebutton switch-sidebar-mini">
                        <span class="label-switch">OFF</span>
                        <input type="checkbox" name="checkbox" checked class="bootstrap-switch"
                            data-on-label=""
                            data-off-label="" />
                        <span class="label-switch label-right">ON</span>
                    </div>
                </li>
                <li class="button-container">
                  
                    <a href="https://www.creative-tim.com/product/now-ui-dashboard" target="_blank" class="btn btn-info btn-block btn-round">
                        <i class="now-ui-icons files_single-copy-04"></i>
                        Get Free Demo!
                    </a>
                </li>
            </ul>
        </div>
    </div>
   </html>

    <!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
    <script src="js/plugins/bootstrap-switch.js"></script>
    <script src="assets/js/core/jquery.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <script src="assets/js/now-ui-dashboard.js"></script>

     <script>
  $(document).ready(function(){
    $().ready(function(){
        $sidebar = $('.sidebar');
        $sidebar_img_container = $sidebar.find('.sidebar-background');

 

        $full_page = $('.full-page');

 

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;

 

        window_width = $(window).width();

 

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

 

        // if( window_width > 767 && fixed_plugin_open == 'Dashboard' ){
        //     if($('.fixed-plugin .dropdown').hasClass('show-dropdown')){
        //         $('.fixed-plugin .dropdown').addClass('show');
        //     }
        //
        // }

 

        $('.fixed-plugin a').click(function(event){
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
            if($(this).hasClass('switch-trigger')){
                if(event.stopPropagation){
                    event.stopPropagation();
                }
                else if(window.event){
                   window.event.cancelBubble = true;
                }
            }
        });

 

        $('.fixed-plugin .background-color span').click(function(){
            $(this).siblings().removeClass('active');
            $(this).addClass('active');

 

            var new_color = $(this).data('color');

 

            if($sidebar.length != 0){
                $sidebar.attr('data-color',new_color);
            }

 

            if($full_page.length != 0){
                $full_page.attr('filter-color',new_color);
            }

 

            if($sidebar_responsive.length != 0){
                $sidebar_responsive.attr('data-color',new_color);
            }
        });

 

        $('.fixed-plugin .img-holder').click(function(){
            $full_page_background = $('.full-page-background');

 

            $(this).parent('li').siblings().removeClass('active');
            $(this).parent('li').addClass('active');

 


            var new_image = $(this).find("img").attr('src');

 

            if( $sidebar_img_container.length !=0 && $('.switch-sidebar-image input:checked').length != 0 ){
                $sidebar_img_container.fadeOut('fast', function(){
                   $sidebar_img_container.css('background-image','url("' + new_image + '")');
                   $sidebar_img_container.fadeIn('fast');
                });
            }

 

            if($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0 ) {
                var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

 

                $full_page_background.fadeOut('fast', function(){
                   $full_page_background.css('background-image','url("' + new_image_full_page + '")');
                   $full_page_background.fadeIn('fast');
                });
            }

 

            if( $('.switch-sidebar-image input:checked').length == 0 ){
                var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
                var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

 

                $sidebar_img_container.css('background-image','url("' + new_image + '")');
                $full_page_background.css('background-image','url("' + new_image_full_page + '")');
            }

 

            if($sidebar_responsive.length != 0){
                $sidebar_responsive.css('background-image','url("' + new_image + '")');
            }
        });

 

        $('.switch-sidebar-image input').on("switchChange.bootstrapSwitch", function(){
            $full_page_background = $('.full-page-background');

 

            $input = $(this);

 

            if($input.is(':checked')){
                if($sidebar_img_container.length != 0){
                    $sidebar_img_container.fadeIn('fast');
                    $sidebar.attr('data-image','#');
                }

 

                if($full_page_background.length != 0){
                    $full_page_background.fadeIn('fast');
                    $full_page.attr('data-image','#');
                }

 

                background_image = true;
            } else {
                if($sidebar_img_container.length != 0){
                    $sidebar.removeAttr('data-image');
                    $sidebar_img_container.fadeOut('fast');
                }

 

                if($full_page_background.length != 0){
                    $full_page.removeAttr('data-image','#');
                    $full_page_background.fadeOut('fast');
                }

 

                background_image = false;
            }
        });

 

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function(){
          var $btn = $(this);

 

          if(sidebar_mini_active == true){
              $('body').removeClass('sidebar-mini');
              sidebar_mini_active = false;
              nowuiDashboard.showSidebarMessage('Sidebar mini deactivated...');
          }else{
              $('body').addClass('sidebar-mini');
              sidebar_mini_active = true;
              nowuiDashboard.showSidebarMessage('Sidebar mini activated...');
          }

 

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function(){
              window.dispatchEvent(new Event('resize'));
          },180);

 

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function(){
              clearInterval(simulateWindowResize);
          },1000);
        });
    });
  });
    </script>


</asp:Content>
