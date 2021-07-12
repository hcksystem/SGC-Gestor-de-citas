using AccesoDatos_DAL_;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BLLCategoria bllp = new BLLCategoria();
                dropCategorias.DataSource = bllp.ObtenerTodasCategorias();
                dropCategorias.DataTextField = "descripcion";
                dropCategorias.DataValueField = "id";
                dropCategorias.DataBind();
                ListItem lst = new ListItem("Seleccione una categoría", "0");
                dropCategorias.Items.Insert(0, lst);
                dropCategorias.SelectedIndex = 0;
                dropCategorias_SelectedIndexChanged(dropCategorias, null);

                BLLInventario blli = new BLLInventario();
                DataTable dt = blli.ObtenerTodosLosInventarios();
                gridInventario.DataSource = dt;
                gridInventario.DataBind();

                //cargar combo con enum
                Array enumList = Enum.GetValues(typeof(entradasSalidasInventario));
                foreach (entradasSalidasInventario getSumRes in enumList)
                {
                    dropSumRes.Items.Add(new ListItem(getSumRes.ToString(), ((int)getSumRes).ToString()));
                }

            }
        }
    

        protected void dropCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            BLLProducto bllp = new BLLProducto();
            gridLista.DataSource = bllp.ObtenerTodosLosProductosActivos();
            if (dropCategorias.SelectedValue != "0" || dropCategorias.SelectedIndex < 0)
            {
                int idProducto = Convert.ToInt32(dropCategorias.SelectedValue);
                gridLista.DataSource = bllp.ObtenerTodosLosProductosActivosPorCategoria(idProducto);
            }
            gridLista.DataBind();
        }

        protected void gridInventario_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void gridLista_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='hand';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";

                e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.gridLista, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gridLista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridLista.PageIndex = e.NewPageIndex;
            
        }

        protected void gridLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            int servicio = Convert.ToInt32(gridLista.SelectedRow.Cells[1].Text);

            if (gridLista.Columns.Count > 0)
            {

            }
                //EditarDatos();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            BLLInventario blli = new BLLInventario();
        }
    }
}