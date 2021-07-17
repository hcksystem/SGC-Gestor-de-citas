using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMenuAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["Usuario"] != null)
            {
                Label1.Text = Session["Usuario"].ToString();
            }
        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public List<Entidades.Negocio> listaNegocio_GetData()
        {
            BLLNegocio blln = new BLLNegocio();
            return blln.ObtenerTodosNegociosLista();


        }

        protected void btnReservar_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("mantenimiento.aspx?id=" + id);
        }
    }
    }
