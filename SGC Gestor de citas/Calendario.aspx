﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendario.aspx.cs" Inherits="SGC_Gestor_de_citas.WebForm1" %>

<!doctype html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Snippet - BBBootstrap</title>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css' rel='stylesheet'>
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <style>
        body {
            color: #ffffff ;
            overflow-x: hidden;
            height: 100%;
            background-color: #fff !important;
            background-repeat: no-repeat;
            padding: 0px !important
        }

        .container-fluid {
            padding-top: 120px !important;
            padding-bottom: 120px !important
        }

        .card {
            box-shadow: 0px 4px 8px 0px #050a45
        }

        .card-header{
            background: 050a45;
        }

        input {
            padding: 10px 20px !important;
            border: 1px solid #000 !important;
            border-radius: 10px;
            box-sizing: border-box;
            background-color: #512DA8 !important;
            color: #fff !important;
            font-size: 16px;
            letter-spacing: 1px;
            width: 180px
        }

            input:focus {
                -moz-box-shadow: none !important;
                -webkit-box-shadow: none !important;
                box-shadow: none !important;
                border: 1px solid #512DA8;
                outline-width: 0
            }

        ::placeholder {
            color: #fff;
            opacity: 1
        }

        :-ms-input-placeholder {
            color: #fff
        }

        ::-ms-input-placeholder {
            color: #fff
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0
        }

        .datepicker {
            background-color: #050a45 !important;
            color: #fff !important;
            border: none;
            padding: 10px !important
        }

        .datepicker-dropdown:after {
            border-bottom: 6px solid #000
        }

        thead tr:nth-child(3) th {
            color: #fff !important;
            font-weight: bold;
            padding-top: 20px;
            padding-bottom: 10px
        }

        .dow,
        .old-day,
        .day,
        .new-day {
            width: 40px !important;
            height: 40px !important;
            border-radius: 0px !important
        }

            .old-day:hover,
            .day:hover,
            .new-day:hover,
            .month:hover,
            .year:hover,
            .decade:hover,
            .century:hover {
                border-radius: 6px !important;
                background-color: #eee;
                color: #000
            }

        .active {
            border-radius: 6px !important;
            background-image: linear-gradient(#90CAF9, #64B5F6) !important;
            color: #000 !important
        }

        .disabled {
            color: #050a45 !important
        }

        .prev,
        .next,
        .datepicker-switch {
            border-radius: 0 !important;
            padding: 20px 10px !important;
            text-transform: uppercase;
            font-size: 20px;
            color: #fff !important;
            opacity: 0.8
        }

            .prev:hover,
            .next:hover,
            .datepicker-switch:hover {
                background-color: inherit !important;
                opacity: 1
            }

        .cell {
            border: 1px solid #BDBDBD;
            margin: 2px;
            cursor: pointer
        }

            .cell:hover {
                border: 1px solid #00ff21
            }

            .cell.select {
                background-color: #00ff21;
                color: #fff
            }

        .fa-calendar {
            color: #fff;
            font-size: 30px;
            padding-top: 8px;
            padding-left: 5px;
            cursor: pointer
        }
    </style>
</head>
<body oncontextmenu='return false' class='snippet-body'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>
    <div class="container-fluid px-0 px-sm-4 mx-auto">
        <div class="row justify-content-center mx-0">
            <div class="col-lg-10">
                <div class="card border-0">
                    <form autocomplete="off">
                        <div class="card-header">
                            <div class="mx-0 mb-0 row justify-content-sm-center justify-content-start px-1"> <input type="text" id="dp1" class="datepicker" placeholder="Pick Date" name="date" readonly><span class="fa fa-calendar"></span> </div>
                        </div>
                        <div class="card-body p-3 p-sm-5">
                            <div class="row text-center mx-0">
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">9:00AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">9:30AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">9:45AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">10:00AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">10:30AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">10:45AM</div>
                                </div>
                            </div>
                            <div class="row text-center mx-0">
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">11:00AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">11:30AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">11:45AM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">12:00PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">12:30PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">12:45PM</div>
                                </div>
                            </div>
                            <div class="row text-center mx-0">
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">1:00PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">1:30PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">1:45PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">2:00PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">2:30PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">2:45PM</div>
                                </div>
                            </div>
                            <div class="row text-center mx-0">
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">3:00PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">3:30PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">4:15PM</div>
                                </div>
                                <div class="col-md-2 col-4 my-1 px-2">
                                    <div class="cell py-1">5:00PM</div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <form runat="server">
                        <asp:DropDownList ID="dropServicio" runat="server"></asp:DropDownList>
                        <div class="col-md-4 pl-1">
                                <div class="form-group">
                                    <label>Digite una breve descripcion de lo que desea realizarse</label>

                                   <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClick="btnVolver_Click" />
                        <asp:Button ID="btnReservar" runat="server" Text="Reservar" OnClick="btnReservar_Click" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
    <script type='text/javascript'>
        $(document).ready(function () {

            $('.datepicker').datepicker({
                format: 'dd-mm-yyyy',
                autoclose: true,
                startDate: '0d'
            });

            $('.cell').click(function () {
                $('.cell').removeClass('select');
                $(this).addClass('select');
            });

        });</script>
</body>
</html>
