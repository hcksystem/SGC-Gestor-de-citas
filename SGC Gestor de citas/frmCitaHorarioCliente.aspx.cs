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

namespace SGC_Gestor_de_citas
{
    public partial class frmCitaHorarioCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BLLCita cita = new BLLCita();
            MessageBox.Show(cita.InsertarCita(txtDescripcion.Text, 1, Convert.ToInt32(Session["IDServicio"].ToString()), Convert.ToInt32(Session["ID"].ToString()), txtFechaAtencion.Text, HorarioDisponible.SelectedItem.Text));
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

        protected void dropServicio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}