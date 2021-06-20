using AccesoDatos_DAL_;
using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
          
                CargarDatos();
            
        }


        private void CargarDatos(string sortExpression = null)
        {
            DALProducto bllc = new DALProducto();
            DataTable dt = bllc.ObtenerTodosLosProductos();



            gridProductos.DataSource = dt;
            gridProductos.DataBind();
            
        }
        public void limpiarDatos()
        {
            txtNombreProducto.Text = "";
            txtDescripcionProducto.Text = "";
            txtCategoriaProducto.Text = "";
            txtCantidadProducto.Text = "";
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
            try
            {
                //Recorre la linea y elimina el id
                int id = 0;
                foreach (DictionaryEntry keyEntry in e.Keys)
                {
                    id = Convert.ToInt32(keyEntry.Value);
                }



                BLLProducto bllc = new BLLProducto();
                bllc.EliminarProducto(id);
            }
            catch (Exception)
            {



                throw;
            }




            CargarDatos();
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

        protected void gridProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridProductos.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {



                throw;
            }



            CargarDatos();
        }

        protected void gridProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

           
            //Toma la columna que se va a editar
            GridViewRow fila = gridProductos.Rows[e.RowIndex];



            //CargarDatos los datos
            int id = Convert.ToInt32(gridProductos.DataKeys[e.RowIndex].Values[0]);



            string nombre = (fila.FindControl("txtNombre") as TextBox).Text.ToUpper();
            string categoria = (fila.FindControl("txtCategoria") as TextBox).Text.ToUpper();
            string descripcion = (fila.FindControl("txtDescripcion") as TextBox).Text.ToUpper();
            int cantidad = Convert.ToInt32((fila.FindControl("txtCantidad") as TextBox).Text);
            string proposito = (fila.FindControl("txtProposito") as TextBox).Text.ToUpper();
            double precio = Convert.ToDouble((fila.FindControl("txtPrecio") as TextBox).Text);
            bool estado = Convert.ToBoolean((fila.FindControl("txtEstado") as TextBox).Text);



            //Modifica el producto



            BLLProducto bblp = new BLLProducto();
            Producto p = new Producto();
            bblp.ObtenerPorID(id);
            p.Nombre = nombre;
            p.Categoria = categoria;
            p.Descripcion = descripcion;
            p.Cantidad = cantidad;
            p.Proposito = proposito;
            p.Precio = precio;
            p.Estado = estado;
            bblp.ModificarProducto(id, p.Nombre, p.Categoria, p.Descripcion, p.Cantidad, p.Proposito, p.Precio, p.Estado);



            //Termina proceso de la edicion
            gridProductos.EditIndex = -1;



            //Carga los datos
            CargarDatos();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                BLLProducto bllp = new BLLProducto();
                bllp.InsertarProducto(txtNombreProducto.Text, txtCategoriaProducto.Text, txtDescripcionProducto.Text, Convert.ToInt32(txtCantidadProducto.Text), txtPropositoProducto.Text, Convert.ToDouble(txtPrecioProducto.Text), true);

                string mjs = "Producto Registrado Correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('" + mjs + "');window.location-'fmrMantenimientoProducto.aspx';", true);

                limpiarDatos();
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
    }



}





