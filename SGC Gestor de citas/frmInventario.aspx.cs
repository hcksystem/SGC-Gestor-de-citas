using AccesoDatos_DAL_;
using Entidades;
using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmInventario : System.Web.UI.Page
    {
        public SqlConnection cn = new SqlConnection("Data Source =.; Initial Catalog = SolucionesSGC; User ID = sa; Password=123456"); 
        Inventario inv = new Inventario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                 //cargar combo con enum
                Array enumList = Enum.GetValues(typeof(entradasSalidasInventario));
                foreach (entradasSalidasInventario getSumRes in enumList)
                {
                    dropSumRes.Items.Add(new ListItem(getSumRes.ToString(), ((int)getSumRes).ToString()));
                }

                cargarDatos();

            }
        }
        public void limpiarDatos()
        {
            txtCantidadNueva.Text = "";
            txtStock.Text = "";
            Session["ID"] = null;
        }

        public void cargarDatos()
        {
            BLLInventario blli = new BLLInventario();
            DataTable dt = blli.ObtenerTodosLosInventarios();
            gridInventario.DataSource = dt;
            gridInventario.DataBind();

          
        }
        protected void dropCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            //BLLProducto bllp = new BLLProducto();
            //gridLista.DataSource = bllp.ObtenerTodosLosProductosActivos();
            //if (dropCategorias.SelectedValue != "0" || dropCategorias.SelectedIndex < 0)
            //{
            //    int idProducto = Convert.ToInt32(dropCategorias.SelectedValue);
            //    gridLista.DataSource = bllp.ObtenerTodosLosProductosActivosPorCategoria(idProducto);
            //}
            //gridLista.DataBind();

        }

        protected void gridInventario_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

 
        public void EditarDatos()
        {
            int id = Convert.ToInt32(gridInventario.SelectedRow.Cells[2].Text);
            BLLInventario bllc = new BLLInventario();
            DataTable dt = bllc.ObtenerInventarioPorID(id);

            txtStock.Text = dt.Rows[0]["cantidad"].ToString(); //quede aca con que no encuentra posicion 0
        }

        protected int sumaInventario(int num)
        {
            
            int resultado;
            num = Convert.ToInt32(txtStock.Text);
            resultado = num + Convert.ToInt32(txtCantidadNueva.Text);

            return resultado;
           
        }
        protected int restaInventario(int num)
        {

            int resultado;

            num = Convert.ToInt32(txtStock.Text);

            if(num< Convert.ToInt32(txtCantidadNueva.Text))
            {
               
                resultado = num;
                return resultado;
            }
            else
            {
                resultado = num - Convert.ToInt32(txtCantidadNueva.Text);

            }
            return resultado;

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int accion =Convert.ToInt32( dropSumRes.SelectedValue);

            if (accion == 1)
            {
                try
                {
                    if (Session["ID"] != null)
                    {
                        int id = Convert.ToInt32(Session["ID"].ToString());

                        BLLInventario blli = new BLLInventario();
                        id = Convert.ToInt32(gridInventario.SelectedRow.Cells[1].Text);
                        int num;
                        num = sumaInventario(Convert.ToInt32(txtCantidadNueva.Text));
                        blli.InventarioSumRes(id, num);


                    }
                }
                catch (Exception)
                {

                    throw;
                }
               
              
            }
            else
            {
                try
                {
                    if (Session["ID"] != null)
                    {
                        int id = Convert.ToInt32(Session["ID"].ToString());

                        BLLInventario blli = new BLLInventario();
                        id = Convert.ToInt32(gridInventario.SelectedRow.Cells[1].Text);
                        int num;
                        num = restaInventario(Convert.ToInt32(txtCantidadNueva.Text));
                        blli.InventarioSumRes(id, num);


                    }
                }
                catch (Exception)
                {

                    throw;
                }


            }
            ClientScript.RegisterStartupScript(
                   this.GetType(),
                    "Registro",
                    "mensajeRedirect('Inventario',' Actualizado con éxito','success','frmInventario.aspx')",
                    true);
            
            limpiarDatos();
            cargarDatos();
            lblAcciones.Visible = false;
            lblCantidadModificar.Visible = false;
            txtCantidadNueva.Visible = false;
            dropSumRes.Visible = false;
            btnGuardar.Visible = false;
            txtBuscar.Text = "";
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT Inventario.id, Producto.id AS idProducto, Producto.nombre, Inventario.cantidad, Inventario.descripcion FROM Inventario INNER JOIN Producto ON Inventario.idProducto = Producto.id where Producto.nombre like '" + txtBuscar.Text + "%'", cn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.gridInventario.DataSource = dt;
                gridInventario.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gridInventario_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ID"] = Convert.ToInt32(gridInventario.SelectedRow.Cells[1].Text);
            if (gridInventario.Columns.Count > 0)
                EditarDatos();

            lblAcciones.Visible = true;
            lblCantidadModificar.Visible = true;
            txtCantidadNueva.Visible = true;
            dropSumRes.Visible = true;
            btnGuardar.Visible = true;

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            lblAcciones.Visible = false;
            lblCantidadModificar.Visible = false;
            txtCantidadNueva.Visible = false;
            dropSumRes.Visible = false;
            btnGuardar.Visible = false;
            txtStock.Text = "";
            Session["ID"] = null;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT Inventario.id, Producto.id AS idProducto, Producto.nombre, Inventario.cantidad, Inventario.descripcion FROM Inventario INNER JOIN Producto ON Inventario.idProducto = Producto.id where Producto.nombre like '" + txtBuscar.Text + "%'", cn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.gridInventario.DataSource = dt;
                gridInventario.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}