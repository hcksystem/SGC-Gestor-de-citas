using LogicaNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace SGC_Gestor_de_citas
{
    public partial class frmGestorCita : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatos();
        }
        private void CargarDatos()
        {
            try
            {
                BLLCita bllc = new BLLCita();
                DataTable dt = bllc.ObtenerTodasLasCitasActivas();
                gridCita.DataSource = dt;
                gridCita.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void btnIrgestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Calendario.aspx");
        }
        protected void gridCita_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DialogResult boton = MessageBox.Show("Esta seguro?", "Consulta", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            //Recorre la linea y elimina el id

            if (boton == DialogResult.Yes)
            {
                try
                {
                    int id = 0;
                    foreach (DictionaryEntry keyEntry in e.Keys)
                    {
                        id = Convert.ToInt32(keyEntry.Value);
                    }

                    BLLCita bllc = new BLLCita();
                    bllc.CambiarEstadoCita(id);
                }
                catch (Exception)
                {
                    throw;
                }
                CargarDatos();
            }
        }

        protected void gridCita_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                //Cancela edicion
                gridCita.EditIndex = -1;
            }
            catch (Exception)
            {
                throw;
            }
            CargarDatos();
        }

        protected void gridCita_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridCita.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {
                throw;
            }
            CargarDatos();
        }

        protected void gridCita_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}