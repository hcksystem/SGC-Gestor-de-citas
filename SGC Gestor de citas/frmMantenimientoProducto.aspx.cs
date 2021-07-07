using AccesoDatos_DAL_;
using Entidades;
using LogicaDeNegocio_BLL_;
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
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SGC_Gestor_de_citas
{

    public partial class frmMantenimientoProducto : System.Web.UI.Page
    {
        public bool editar;//variable que se utilizara para identificar si el dato se quiere actualizar o si es un registro nuevo

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CargarDatos();
            }
        }
        private void EditarDatos()//este metodo carga los espacios del formulario con los datos almacenados en la BD 
        {
            editar = false;//aca indica que el estado es falso, con esto el boton guardar, no generara un nuevo insert sino hara un update
            int id = Convert.ToInt32(gridProductos.SelectedRow.Cells[2].Text);
            BLLProducto bllc = new BLLProducto();
            DataTable dt = bllc.ObtenerPorID(id);
            txtNombreProducto.Text = dt.Rows[0]["nombre"].ToString();
            dropCategoria.SelectedValue = dt.Rows[0]["idcategoria"].ToString();
            txtDescripcionProducto.Text = dt.Rows[0]["descripcion"].ToString();          
            txtPropositoProducto.Text = dt.Rows[0]["proposito"].ToString();
            txtPrecioProducto.Text = dt.Rows[0]["precio"].ToString();
            dropEstado.SelectedValue = dt.Rows[0]["estado"].ToString();        
        }

        private void CargarDatos(string sortExpression = null)
        {
            dropEstado.DataSource = Enum.GetNames(typeof(estado));
            dropEstado.DataBind();
            DALProducto bllc = new DALProducto();
            DataTable dt = bllc.ObtenerTodosLosProductosActivos();

            gridProductos.DataSource = dt;
            gridProductos.DataBind();

        }

        public void limpiarDatos()
        {
            txtNombreProducto.Text = "";
            txtDescripcionProducto.Text = "";
            txtPrecioProducto.Text = "";
            txtPropositoProducto.Text = "";
            
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int numero = Convert.ToInt16(args.Value);
            if (numero > 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void gridProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
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
                    BLLProducto bllc = new BLLProducto();
                    bllc.CambiarEstadoProducto(id);
                }
                catch (Exception)
                {
                    throw;
                }
                CargarDatos();
            }
        }

        protected void gridProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                //Cancela edicion
                gridProductos.EditIndex = -1;
            }
            catch (Exception)
            {
                throw;
            }
            CargarDatos();
        } 

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if (editar)
                {
                    BLLProducto bllp = new BLLProducto();
                    bllp.InsertarProducto(txtNombreProducto.Text, Convert.ToInt32(dropCategoria.SelectedValue), txtDescripcionProducto.Text, txtPropositoProducto.Text, Convert.ToDouble(txtPrecioProducto.Text), Convert.ToInt32(dropEstado.SelectedValue));

                    string mjs = "Producto registrado correctamente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('" + mjs + "');window.location-'fmrMantenimientoProducto.aspx';", true);

                    limpiarDatos();
                    CargarDatos();
                }
                else
                {
                    if(editar == false)
                    {
                        BLLProducto bllu = new BLLProducto();
                        int id = Convert.ToInt32(gridProductos.SelectedRow.Cells[2].Text);
                        bllu.ModificarProducto(id, txtNombreProducto.Text, Convert.ToInt32(dropCategoria.SelectedValue), txtDescripcionProducto.Text, txtPropositoProducto.Text, Convert.ToDouble(txtPrecioProducto.Text), Convert.ToInt32(dropEstado.SelectedValue));
                        string mjs = "Producto modificado correctamente";
                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                            "alert",
                            "alert('" + mjs + "');window.location-'fmrMantenimientoUsuario.aspx';", true);
                        limpiarDatos();
                       CargarDatos();
                        
                    }                   

                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarDatos();
           
        }

        protected void gridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridProductos.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }

        protected void gridProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int producto = Convert.ToInt32(gridProductos.SelectedRow.Cells[2].Text);
            //Server.Transfer("frmMantenimientoUsuario.aspx"+usuario);
            if (gridProductos.Columns.Count > 0)

                EditarDatos();
                this.editar = false;
        }

    }

}





