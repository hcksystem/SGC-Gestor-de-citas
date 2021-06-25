using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SGC_Gestor_de_citas
{
    public partial class LoginSGC : System.Web.UI.Page
    {

        //Creacion de instancia de usuario
        private Usuario us = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLUsuario bblu = new BLLUsuario();
                bblu.SHA256(txtContrasennaRegistro.Text);
                bblu.InsertarUsuario(txtCorreoRegistro.Text, txtTelefonoRegistro.Text, txtContrasennaRegistro.Text, 2);
            }
            catch (Exception)
            {



                throw;
            }
        }

        protected void btnLoguear_Click(object sender, EventArgs e)
        {
            BLLUsuario bllu = new BLLUsuario();

            try
            {
                if (bllu.VerificarLogin(txtEmail.Text, txtPass.Text) == true)
                {
                    DataTable dt = bllu.ObtenerUsuarioPorCorreo(txtEmail.Text);



                    us.id = Convert.ToInt32(dt.Rows[(0)]["id"]);
                    us.Correo = Convert.ToString(dt.Rows[(0)]["correoUsuario"]);
                    us.Telefono = Convert.ToString(dt.Rows[0]["telefono"]);
                    us.Contrasenna = Convert.ToString(dt.Rows[0]["contrasenna"]);
                    us.idRol = Convert.ToInt32(dt.Rows[0]["idRoll"]);

                    MessageBox.Show(us.Correo, "Bienvenido", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);


                    if (us.idRol == 1)
                    {
                        Session["ID"] = us.id;
                        Session["Usuario"] = us.Correo;
                        Session["Telefono"] = us.Telefono;
                        Session["Rol"] = us.idRol;
                        Response.Redirect("frmMenuAdministrador.aspx", false); Context.ApplicationInstance.CompleteRequest();

                    }
                    else
                    {
                        if (us.idRol == 2)
                        {
                            Session["ID"] = us.id;
                            Session["Usuario"] = us.Correo;
                            Session["Telefono"] = us.Telefono;
                            Session["Rol"] = us.idRol;
                            Response.Redirect("frmMenuCliente.aspx", false); Context.ApplicationInstance.CompleteRequest();
                        }
                    }
                }
                else
                {
                    MessageBox.Show("Las credenciales son incorrectas", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            catch (Exception a)
            {
                //Si los datos no estan completos se le envía el mensaje
                MessageBox.Show("Datos incorrectos" + a);
            }
            txtPass.Text = "";
            txtEmail.Text = "";
        }
    }
}