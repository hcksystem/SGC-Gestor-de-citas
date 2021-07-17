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
    public partial class frmMantenimientoCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CargarDatos();
            }
        }

        private void CargarDatos(string sortExpression = null)
        {
            DALCategoria bllc = new DALCategoria();
            DataTable dt = bllc.ObtenerTodasLasCategorias();

            gridCategorias.DataSource = dt;
            gridCategorias.DataBind();
        }

        public void limpiarDatos()
        {
            txtNombreCategoria.Text = "";


        }

        protected void gridCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCategorias.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }
    

        protected void gridCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Categoria = Convert.ToInt32(gridCategorias.SelectedRow.Cells[2].Text);
            
            if (gridCategorias.Columns.Count > 0)

            EditarDatos();
            btnModificar.Visible = true;
            btnGuardar.Visible = false;
        }

        protected void gridCategorias_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[2].Text;
                foreach (ImageButton button in e.Row.Cells[1].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea eliminar este registro? " + item + "?')){ return false; };";
                    }
                }
            }
        }
        private void EditarDatos()//este metodo carga los espacios del formulario con los datos almacenados en la BD 
        {
            int id = Convert.ToInt32(gridCategorias.SelectedRow.Cells[2].Text);
            BLLCategoria bllc = new BLLCategoria();
            DataTable dt = bllc.ObtenerCategoriaPorID(id);


            txtNombreCategoria.Text = dt.Rows[0]["descripcion"].ToString();


        }

        protected void gridCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridCategorias.Rows[e.RowIndex].Cells[2].Text);
                BLLCategoria bllc = new BLLCategoria();
                bllc.EliminarCategoria(index);
                CargarDatos();

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Categoría',' Eliminada con éxito','success','frmMantenimientoCategoria.aspx')",
                     true
                     );


            }
            catch (Exception)
            {
                throw;
            }
            limpiarDatos();
            CargarDatos();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {


                BLLCategoria bllc = new BLLCategoria();
                bllc.InsertarCategoria(txtNombreCategoria.Text);

                ClientScript.RegisterStartupScript(
                               this.GetType(),
                               "Registro",
                                "mensajeRedirect('Categoría',' Guardada con éxito','success','frmMantenimientoCategoria.aspx')",
                               true
                               );
            }


            catch (Exception)
            {

                throw;
            }
            limpiarDatos();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarDatos();
            CargarDatos();

            Response.Redirect("frmMenuAdministrador.aspx");
            btnModificar.Visible = false;
            btnGuardar.Visible = true;
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLCategoria bllc = new BLLCategoria();
              
                int id = Convert.ToInt32(gridCategorias.SelectedRow.Cells[2].Text);

                bllc.ModificarCategoria(id, txtNombreCategoria.Text);
                ClientScript.RegisterStartupScript(
                             this.GetType(),
                             "Actualizacion",
                              "mensajeRedirect('Categoría',' Modificada con éxito','success','frmMantenimientoCategoria.aspx')",
                             true
                             );
            }
            catch (Exception)
            {

                throw;
            }
            limpiarDatos();
            CargarDatos();
            btnGuardar.Visible = true;
            btnModificar.Visible = false;
        }
    }
    }

