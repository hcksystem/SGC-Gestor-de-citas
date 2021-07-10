<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginSGC.aspx.cs" Inherits="SGC_Gestor_de_citas.LoginSGC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/login.css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        </div>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Iniciar Sesion</label>
                <input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab">Registrarse</label>
                <div class="login-form">
                    <div class="sign-in-htm">
                        <div class="group">
                            <label for="user" class="label">Correo</label>
                            <asp:TextBox ID="txtEmail" runat="server" TabIndex="1" placeHolder="* Requerido *"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ManteL"
                                ControlToValidate="txtEmail" ErrorMessage="Digite su correo" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>



                        </div>
                        <div class="group">
                            <label for="pass" class="label">Contraseña</label>
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" TabIndex="2" placeHolder="* Requerido *"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ManteL"
                                ControlToValidate="txtPass" ErrorMessage="Digite su contraseña" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="group">
                            <asp:Button ID="btnLoguear" runat="server" Text="Iniciar Sesion" ValidationGroup="ManteL" OnClick="btnLoguear_Click" />
                        </div>
                        <div class="hr"></div>
                    </div>
                    <div class="for-pwd-htm">
                        <div class="group">
                            <label for="user" class="label">Correo Electronico</label>
                            <asp:TextBox ID="txtCorreoRegistro" runat="server" placeHolder="* Requerido *"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ManteR"
                                ControlToValidate="txtCorreoRegistro" ErrorMessage="Digite su Correo" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>



                        </div>
                        <div class="group">
                            <label for="user" class="label">Telefono</label>
                            <asp:TextBox ID="txtTelefonoRegistro" TextMode="Phone" runat="server" placeHolder="* Requerido *"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ManteR"
                                ControlToValidate="txtTelefonoRegistro" ErrorMessage="Digite su telefono" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="group">
                            <label for="user" class="label">Contraseña</label>
                            <asp:TextBox ID="txtContrasennaRegistro" TextMode="Password" runat="server" placeHolder="* Requerido *"></asp:TextBox>
                            <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" Enabled="true" MinimumNumericCharacters="1"
                                MinimumLowerCaseCharacters="1" PreferredPasswordLength="8" RequiresUpperAndLowerCaseCharacters="true"
                                TargetControlID="txtContrasennaRegistro" PrefixText="Complejidad" TextStrengthDescriptions="Baja;Media;Alta"/>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
                                ErrorMessage="La contraseña debe tener entre 8 y 15 caracteres, al menos un número, una mayúscula, una minúscula y no puede tener caracteres especiales"
                                ControlToValidate="txtContrasennaRegistro" Display="Dynamic" ForeColor="Red"
                                ValidationGroup="ManteR"></asp:RegularExpressionValidator>
                            <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server"
                                TargetControlID="RegularExpressionValidator1" Enabled="true" PopupPosition="TopLeft">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ManteR"
                                ControlToValidate="txtContrasennaRegistro" ErrorMessage="Digite su contraseña" Display="Dynamic"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="group">
                            <asp:Button ID="btnRegistrar" runat="server" Text="Completar Registro" ValidationGroup="ManteR" OnClick="btnRegistrar_Click" />
                        </div>
                        <div class="hr"></div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
