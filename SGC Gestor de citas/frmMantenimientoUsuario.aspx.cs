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
using System.Windows.Forms;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoUsuario : System.Web.UI.Page
    {
        public bool editar;//variable que se utilizara para identificar si el dato se quiere actualizar o si es un registro nuevo
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                CargarDatos();
                
            }

            CargarDatos();
        }

        private void CargarDatos()
        {
            try
            {
                BLLUsuario bllc = new BLLUsuario();
                DataTable dt = bllc.ObtenerTodosLosUsuarios();

                gridUsuarios.DataSource = dt;
                gridUsuarios.DataBind();
            }
            catch (Exception)
            {

                throw;
            }

            LlenarCombos();


        }
        private void EditarDatos()//este metodo carga los espacios del formulario con los datos almacenados en la BD 
        {
            editar = false;//aca indica que el estado es falso, con esto el boton guardar, no generara un nuevo insert sino hara un update
            int id = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
            BLLUsuario bllc = new BLLUsuario();
            DataTable dt = bllc.ObtenerUsuarioPorID(id);

            txtCorreo.Text = dt.Rows[0]["correoUsuario"].ToString();
            txtTelefono.Text = dt.Rows[0]["telefono"].ToString();
            txtContrasenna.Text = dt.Rows[0]["contrasenna"].ToString();
            dropRol.SelectedValue = dt.Rows[0]["idRoll"].ToString();
                    }
        private void LlenarCombos()
        {
            BLLRol bllc = new BLLRol();
            DataTable dt = bllc.ObtenerTodosRoles();
            dropRol.DataSource = dt;
            dropRol.DataTextField = "descripcion";
            dropRol.DataValueField = "id";
            dropRol.DataBind();
        }
        public void LimpiarDatos()
        {
            txtContrasenna.Text = "";
            txtCorreo.Text = "";
            txtTelefono.Text = "";

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                if(editar)
                {
                    BLLUsuario bllu = new BLLUsuario();
                    bllu.InsertarUsuario(txtCorreo.Text, txtTelefono.Text, txtContrasenna.Text, Convert.ToInt16(dropRol.SelectedItem.Value));

                    string mjs = "Usuario Registrado Correctamente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('" + mjs + "');window.location-'fmrMantenimientoUsuario.aspx';", true);

                    LimpiarDatos();
                }
                else 
                {
                    BLLUsuario bllu = new BLLUsuario();
                    int id = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
                    bllu.ModificarUsuario(id,txtCorreo.Text, txtTelefono.Text, txtContrasenna.Text, Convert.ToInt16(dropRol.SelectedItem.Value));
                    string mjs = "Usuario Modificado Correctamente";
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                        "alert",
                        "alert('" + mjs + "');window.location-'fmrMantenimientoUsuario.aspx';", true);
                }


            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarDatos();
        }

        protected void gridUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gridUsuarios.EditIndex = -1;

            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();
        }


        protected void gridUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DialogResult boton = MessageBox.Show("Esta seguro?", "Consulta", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (boton == DialogResult.Yes)
            {
                try
                {
                    //Recorre la linea, identifica ID y elimina
                    int id = 0;
                    foreach (DictionaryEntry keyEntry in e.Keys)
                    {
                        id = Convert.ToInt32(keyEntry.Value);
                    }
                    BLLUsuario bllu = new BLLUsuario();
                    bllu.EliminarUsuario(id);
                }
                catch (Exception)
                {

                    throw;
                }

                CargarDatos();
            }
         
        }

        protected void gridUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridUsuarios.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();
        }

        protected void gridUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {



            GridViewRow fila = gridUsuarios.Rows[e.RowIndex];


            int codigo = Convert.ToInt32(gridUsuarios.DataKeys[e.RowIndex].Values[0]);
            string correo = (fila.FindControl("txtCorreo") as TextBox).Text.ToUpper();
            string telefono = (fila.FindControl("txtTelefono") as TextBox).Text.ToUpper();
            string contrasenna = (fila.FindControl("txtContrasenna") as TextBox).Text.ToUpper();
            int rol = Convert.ToInt32((fila.FindControl("dropRol") as DropDownList).SelectedValue);




            BLLUsuario bblu = new BLLUsuario();
            BLLRol br = new BLLRol();
            bblu.ObtenerUsuarioPorID(codigo);
            br.ObtenerRolesPorID(rol);


            Usuario us = new Usuario();
            Rol r = new Rol();
            us.id = codigo;
            us.Correo = correo;
            us.Telefono = telefono;
            us.Contrasenna = contrasenna;
            us.idRol = rol;
            r.id = rol;
            bblu.ModificarUsuario(us.id, us.Correo, us.Telefono, us.Contrasenna, us.idRol);


            gridUsuarios.EditIndex = -1;
            CargarDatos();


        }

        protected void gridUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //Se pregunta cual boton esta seleccionando eliminar o editar
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gridUsuarios.EditIndex)
            {
                DropDownList lista = e.Row.FindControl("dropRol") as DropDownList;
                BLLRol bllc = new BLLRol();
                lista.DataSource = bllc.ObtenerTodosRoles();
                lista.DataTextField = "descripcion";
                lista.DataValueField = "id";
                lista.DataBind();
            }
        }

        protected void gridUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            int usuario = Convert.ToInt32(gridUsuarios.SelectedRow.Cells[2].Text);
            //Server.Transfer("frmMantenimientoUsuario.aspx"+usuario);
            if(gridUsuarios.Columns.Count>0)
            
            EditarDatos();
        }


        protected void gridUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //esta linea indica o activa, la siguiente pagina del grid
            gridUsuarios.PageIndex = e.NewPageIndex;
            this.CargarDatos();
        }
    }
}