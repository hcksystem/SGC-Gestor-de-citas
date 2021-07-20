using AccesoDatos_DAL_;
using Entidades;
using LogicaDeNegocio_BLL_;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net.Mail;
using System.Net;

namespace SGC_Gestor_de_citas
{
    public partial class frmCitaHorario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID"] == null) {
                Response.Redirect("frmLogin.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    txtFechaAtencion.Text = DateTime.Today.ToString("yyyy-MM-dd");
                    ////cargar combo con enum
                    //Array enumList = Enum.GetValues(typeof(horarioEnum));
                    //foreach (horarioEnum getHorario in enumList)
                    //{
                    //    dropEstadoHorario.Items.Add(new ListItem(getHorario.ToString(), ((int)getHorario).ToString()));
                    //}

                    BLLServicio blls = new BLLServicio();
                    dropServicio.DataSource = blls.ObtenerTodosServiciosLista();
                    dropServicio.DataTextField = "nombre";
                    dropServicio.DataValueField = "id";
                    dropServicio.DataBind();
                    int idServicio;

                    if (!String.IsNullOrEmpty(Request.QueryString["id"]))
                    {
                        if (Int32.TryParse(Request.QueryString["id"], out idServicio))
                        {
                            dropServicio.SelectedValue = idServicio.ToString();
                        }
                    }
                    idServicio = Convert.ToInt16(dropServicio.SelectedValue);
                    infoServicio(idServicio);
                }
            }
        }
        

            private void infoServicio(int id)
            {
                BLLServicio blls = new BLLServicio();
                List<Servicio> lista = blls.ObtenerTodosServiciosLista();
                Servicio s = lista.Find(elemento => elemento.ID == id);
                lblNombre.Text = s.Nombre;
                lblDescripcion.Text = s.Descripcion;
                lblPrecio.Text = (s.PrecioEstimado).ToString();
                lblId.Text = (s.ID).ToString();
            }

        protected void dropServicio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtFechaAtencion_TextChanged(object sender, EventArgs e)
        {
            DateTime fecha_atencion = DateTime.Parse(txtFechaAtencion.Text);
            int result = DateTime.Compare(fecha_atencion, DateTime.Today);

                BLLCita cita = new BLLCita();
            //string compara;
            if (result < 0)
                HorarioDisponible.Enabled = false;

            else
                HorarioDisponible.Enabled = true;
            HorarioDisponible.DataSource = cita.ObtenerHorarioDisponible(txtFechaAtencion.Text);
            HorarioDisponible.DataTextField = "Hora";
            HorarioDisponible.DataValueField = "Hora";
            HorarioDisponible.DataBind();


        }

 
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BLLCita cita = new BLLCita();
            String Mensaje = cita.InsertarCita(txtDescripcion.Text, 1, Convert.ToInt32(Session["IDServicio"].ToString()), Convert.ToInt32(Session["ID"].ToString()), txtFechaAtencion.Text, HorarioDisponible.SelectedItem.Text);
            ClientScript.RegisterStartupScript(
                              this.GetType(),
                              "Registro",
                               "mensajeRedirect('Cita','"+ Mensaje + "','success','frmCita.aspx')",
                              true
                              );
            DALUsuario daluser = new DALUsuario();
            string Correo = daluser.ObtenerCorreo(Convert.ToInt32(Session["ID"].ToString()));
            
            string body =
                "<Body>" +
                "<h1>SGC Citas</h1>" +
                "<h4>Estimado cliente</h4>" +
                "<span> Su cita para el servicio "+ Session["NombreServicio"].ToString() + " se ha reservado con éxito.<br/> Día: </span>" + txtFechaAtencion.Text.ToString() +
                "<br/><span> Hora: </span>" + HorarioDisponible.SelectedItem.Text +
                // "<span> número de comprobante de cita </span>" +scalar algo +
                "<br/><span> ¡IMPORTANTE! <br/ La hora seleccionada solo es valida para un servicio, si desea más de un servicio, debe seleccionar otra cita </span>" +
                "<br/><span>Saludos cordiales, gracias por su preferencia.</span>" +
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
            mail.Subject = "Mensaje de confirmacion";
            mail.IsBodyHtml = true;
            mail.Body = body;
            smtp.Send(mail);
            
            limpiarDatos();
            Response.Redirect("frmCita.aspx");
        }

        private void limpiarDatos()
        {
            txtFechaAtencion.Text = "";
            HorarioDisponible.Dispose();
            txtDescripcion.Text = "";
        }

        protected void HorarioDisponible_SelectedIndexChanged(object sender, EventArgs e)
        { 
        }
    }
    }
