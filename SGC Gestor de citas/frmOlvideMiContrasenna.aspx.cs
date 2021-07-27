using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmOlvideMiContrasenna : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            SqlCommand cmd = new SqlCommand(String.Format("Update a set contrasenna=hashbytes('MD5','{0}') from Usuario a where id='{1}'",txtPassword.Text, Session["idUsuario"].ToString()), con);
            con.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                cmd = new SqlCommand(String.Format("Update a set Estado=1 from OlvidoMiContraseña a where idUsuario='{0}' and Codigo='{1}'", Session["idUsuario"].ToString(), Session["Codigo"].ToString()), con);
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(
                                 this.GetType(),
                                 "Registro",
                                  "mensajeRedirect('Contraseña','Actualizada con éxito','success','frmLogin.aspx')",
                                 true
                                 );
            }
            else { 
            
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnSolicitarContrasenna_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(String.Format("Select count(1) from Persona where Correo='{0}'", txtCorreo.Text),con);
            int flag = (int)cmd.ExecuteScalar();
            if (flag > 0) {
                cmd = new SqlCommand(String.Format("Select a.id from Usuario a inner join Persona b on a.idPersona=b.id where b.correo='{0}'", txtCorreo.Text),con);
                int IdUsuario = (int)cmd.ExecuteScalar();
                Session["idUsuario"] = IdUsuario;
                cmd = new SqlCommand(String.Format("insert into OlvidoMiContraseña(idUsuario) values ({0})",IdUsuario),con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0) {
                    cmd = new SqlCommand(String.Format("Select Codigo,FechaFinal from OlvidoMiContraseña where idUsuario={0} and Estado=0", IdUsuario),con);
                    DataTable result = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    // this will query your database and return the result to your datatable
                    da.Fill(result);
                    Session["Codigo"] = result.Rows[0]["Codigo"].ToString();
                    String FechaFinal = result.Rows[0]["FechaFinal"].ToString();
                    EnviarCorreo(txtCorreo.Text, FechaFinal);
                    CodigoVerificacion.Visible = true;
                    tdVerificar.Visible = true;



                    ClientScript.RegisterStartupScript(
                                 this.GetType(),
                                 "Registro",
                                  "mensajeRedirect('Verificar','Código enviado a su correo electrónico','info','#')",
                                 true
                                 );
                    txtCodigoVerificacion.Focus();
                }


            
            }
        }
        protected void EnviarCorreo(String Correo,String FechaVencimiento) {
            string body =
                   "<Body>" +
                   "<h1>SGC Citas</h1>" +
                   "<h4>Estimado cliente</h4>" +
                   "<span> Por favor introducir el siguiente código: <b>" + Session["Codigo"].ToString() + "</b> y así poder restablecer la contraseña.<br/> Dicho código vence : </span>" + FechaVencimiento +
                   // "<span> número de comprobante de cita </span>" +scalar algo +
                   "<br/>" +
                   "<span> ¡IMPORTANTE!</span> " +
                   "<br/>" +
                   "<span> Si el código vence deberá volverlo a solicitar </span>" +
                   "<br/>" +
                   "<span>Saludos cordiales, gracias por su preferencia.</span>" +
                   "</body>";



            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("solucionessgc3@gmail.com", "solu1234");
            smtp.TargetName = "STARTTLS/smtp.gmail.com";
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("solucionessgc3@gmail.com", "Soluciones SGC Citas");
            mail.To.Add(new MailAddress(Correo));
            mail.Subject = "Mensaje de confirmación";
            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            if (txtCodigoVerificacion.Text.Equals(Session["Codigo"].ToString()))
            {
                NuevaContrasena.Visible = true;
                confirmar.Visible = true;
            }
            else { 
            
            }
        }
    }
}