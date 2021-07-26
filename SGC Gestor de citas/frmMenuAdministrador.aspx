<%@ Page Title="" Language="C#" MasterPageFile="~/Administrador.Master" AutoEventWireup="true" CodeBehind="frmMenuAdministrador.aspx.cs" Inherits="SGC_Gestor_de_citas.frmMenuAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Karantina&display=swap" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <b>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></b>

    <style>
        .btn {
            background-color: #626c7d
        }

            .btn:hover {
                background-color: #0c3254;
            }

        .table {
            border-collapse: separate;
            padding: 15px 3px 0px 8px;
        }

            .table td, .table th {
                border: 1px dashed transparent;
                width: 230px;
                text-align: center;
                font-size: 23px;
            }

            .table th, .table th {
                border: 1px dashed transparent;
                width: 230px;
                text-align: center;
                font-size: 35px;
                color: #626c7d;
            }

        .letra {
            font-family: 'Karantina', cursive;
            font-size: 45px;
        }

        .panel-header-sm {
            background: #c0c3c8;
        }

        .table-hover tbody tr:hover {
            color: black;
        }

        .table-hover tbody th:hover {
            color: #626c7d;
        }

        .table-hover .table-primary:hover {
            background-color: #ff0000;
        }

        .table-hover tbody:hover {
            background-color: transparent;
        }

        .table-hover tbody tr:hover {
            color: black;
            background: transparent;
        }
    </style>

    <div class="panel-header-sm">
    </div>
    <div class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="title"></h5>
                    </div>
                    <hr />
                    <div class="card-body">
                        <div class="row" style="overflow:scroll">


                            <fieldset class="form-group row">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                                    <ContentTemplate>
                                        
                                        <asp:GridView ID="grvListado" runat="server" BorderStyle="NotSet" BorderColor="Transparent" BorderWidth="0px"
                                            AutoGenerateColumns="false" CssClass="table table-hover"
                                            CellSpacing="20" CellPadding="20"
                                            Width="100%" OnRowDataBound="grvListado_RowDataBound">


                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="id" Visible="false" ControlStyle-Width="100px" ControlStyle-Font-Size="23px"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Logo">
                                                    <ItemTemplate>
                                                        <img src='<%# Eval("logo") %>' id="imageControl" runat="server" width="150" height="160" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="nombre" HeaderText="Nombre"></asp:BoundField>

                                                <asp:BoundField DataField="descripcion" HeaderText="Descripción"></asp:BoundField>
                                                <asp:BoundField DataField="mision" HeaderText="Misión"></asp:BoundField>
                                                <asp:BoundField DataField="vision" HeaderText="Visión"></asp:BoundField>
                                            </Columns>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="white" Font-Bold="True" ForeColor="black" VerticalAlign="Middle" CssClass="letra"></HeaderStyle>



                                        </asp:GridView>
                                           
                                    </ContentTemplate>

                                </asp:UpdatePanel>


                            </fieldset>





                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
