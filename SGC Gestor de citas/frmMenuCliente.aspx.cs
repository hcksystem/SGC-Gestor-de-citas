using LogicaDeNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMenuCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                Label1.Text = Session["Usuario"].ToString();
            }
            //grvListado.DataSource = listaNegocio_GetData();
            //grvListado.DataBind();



            System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)FindControl("imageControl");
            BLLNegocio bllc = new BLLNegocio();
            DataTable dt = bllc.ObtenerTodosLosNegocios();

            listar();





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
        public void listar()
        {
            BLLNegocio blln = new BLLNegocio();
            grvListado.DataSource = blln.ObtenerTodosLosNegocios();
            grvListado.DataBind();
        }

        protected void btnReservar_Command(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandArgument.ToString());
            Response.Redirect("mantenimiento.aspx?id=" + id);
        }

        protected void grvListado_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlImage imageControl = (System.Web.UI.HtmlControls.HtmlImage)e.Row.FindControl("imageControl");
                if (((DataRowView)e.Row.DataItem)["logo"] != DBNull.Value)
                {
                    imageControl.Src = "data:image/png;base64," + Convert.ToBase64String((byte[])(((DataRowView)e.Row.DataItem))["logo"]);
                }
            }
        }
    }
}
