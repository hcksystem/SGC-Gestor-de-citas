<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmGestorCita.aspx.cs" Inherits="SGC_Gestor_de_citas.frmGestorCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="assets/css/estilogrid.css" rel="stylesheet" />
    <!DOCTYPE>
    <html>
        <head>

            <title>Gestión de citas</title>
            <link href="assets/css/imagenesfiltradas.css" rel="stylesheet" />
        </head>
        <body>
            <center>

    <div id="carrusel">
            <a href="#" class="left-arrow">
                <img src="assets/img/left-arrow.png" /></a>
            <a href="#" class="right-arrow">
                <img src="assets/img/right-arrow.png" /></a>
            <div class="carrusel">
                <div class="product" id="product_0">
                    <img src="assets/img/cejas.jpg" width="195" height="100" />
                    <h5>Lorem ipsum 1</h5>
                    <p>165.00 €</p>
                </div>
                <div class="product" id="product_1">
                    <img src="assets/img/cortes-600x400.jpg" width="195" height="100" />
                    <h5>Lorem ipsum 2</h5>
                    <p>100.00 €</p>
                </div>
                <div class="product" id="product_2">
                    <img src="assets/img/facial.png" width="195" height="100" />
                    <h5>Lorem ipsum 3</h5>
                    <p>250.00 €</p>
                </div>
                <div class="product" id="product_3">
                    <img src="assets/img/manicurista.jpg" width="195" height="100" />
                    <h5>Lorem ipsum 4</h5>
                    <p>75.00 €</p>
                </div>
                <div class="product" id="product_4">
                    <img src="assets/img/maquillaje.jpg" width="195" height="100" />
                    <h5>Lorem ipsum 5</h5>
                    <p>65.00 €</p>
                </div>
                <div class="product" id="product_5">
                    <img src="assets/img/tinte.jpg" width="195" height="100" />
                    <h5>Lorem ipsum 6</h5>
                    <p>40.00 €</p>
                </div>
            </div>
        </div>
               
            
            <asp:Button ID="btnIrgestion" runat="server" CssClass="btn btn-primary btn-round" Text="Presione para sacar una cita" OnClick="btnIrgestion_Click" />
                </center>
            <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script>
    var current = 0;
    var imagenes = new Array();

    $(document).ready(function () {
        var numImages = 6;
        if (numImages <= 3) {
            $('.right-arrow').css('display', 'none');
            $('.left-arrow').css('display', 'none');
        }

        $('.left-arrow').on('click', function () {
            if (current > 0) {
                current = current - 1;
            } else {
                current = 0;
            }

            $(".carrusel").animate({ "left": -($('#product_' + current).position().left) }, 1000);

            return false;
        });

        $('.left-arrow').on('hover', function () {
            $(this).css('opacity', '0.5');
        }, function () {
            $(this).css('opacity', '1');
        });

        $('.right-arrow').on('hover', function () {
            $(this).css('opacity', '0.5');
        }, function () {
            $(this).css('opacity', '1');
        });

        $('.right-arrow').on('click', function () {
            if (numImages > current + 3) {
                current = current + 1;
            } else {
                current = 0;
            }

            $(".carrusel").animate({ "left": -($('#product_' + current).position().left) }, 100);

            return false;
        });
    });
</script>
            <br />
        <br />
            <br />
            <br />
            <center>
            <div>
                <asp:GridView ID="gridCita" runat="server" CssClass="mGrid GridView" AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="false">
                    <Columns>

                        <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<% # Bind("id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtIDCita" runat="server" Text='<% # Bind("id") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="DESCRIPCION">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<% # Bind("descripcion") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDescripcionCita" runat="server" Text='<% # Bind("descripcion") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="Fecha">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<% # Bind("fecha") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaCita" TextMode="Date" runat="server" Text='<% # Bind("fecha") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                         <asp:TemplateField HeaderText="Hora">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<% # Bind("hora") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHoraCita" runat="server" Text='<% # Bind("hora") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="Estado">
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<% # Bind("activo") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtActivoCita" runat="server" Text='<% # Bind("activo") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                     <asp:TemplateField HeaderText="Servicio">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<% # Bind("idServicio") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropServicio" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Usuario">
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<% # Bind("idUsuario") %>'></asp:Label>

 

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="dropUsuario" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
</center>



                </body>
    </html>
</asp:Content>
