﻿using AccesoDatos_DAL_;
using Entidades;
using LogicaDeNegocio_BLL_;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace SGC_Gestor_de_citas
{
    public partial class frmMantenimientoNegocio : System.Web.UI.Page
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
            DALNegocio bllc = new DALNegocio();
            DataTable dt = bllc.ObtenerTodosLosNegocio();



            gridNegocio.DataSource = dt;
            gridNegocio.DataBind();
        }
        public void limpiarDatos()
        {
            txtDescripcion.Text = "";
            txtMision.Text = "";
            txtVision.Text = "";
            txtNombreNegocio.Text = "";
            FileUpload1.Dispose();

        }


        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {


                //obtener datos de imagen//
                int tamanio = FileUpload1.PostedFile.ContentLength;
                byte[] imagenOriginal = new byte[tamanio];
                FileUpload1.PostedFile.InputStream.Read(imagenOriginal, 0, tamanio);
                Bitmap imagenOriginaBinaria = new Bitmap(FileUpload1.PostedFile.InputStream);

                //insertar en bd//
                string imagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenOriginal);


                BLLNegocio blln = new BLLNegocio();
                blln.InsertarNegocio(txtNombreNegocio.Text, imagenOriginal, txtDescripcion.Text, txtMision.Text, txtVision.Text);

                //ese scripManager genera la alerta
                string mjs = "Negocio Registrado Correctamente";
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                    "alert",
                    "alert('" + mjs + "');window.location-'frmMantenimientoNegocio.aspx';", true);

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
        }


        protected void gridNegocio_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                //Cancela edicion
                gridNegocio.EditIndex = -1;
            }
            catch (Exception)
            {

                throw;
            }
            CargarDatos();
        }

        protected void gridNegocio_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Toma la columna que se va a editar
            GridViewRow fila = gridNegocio.Rows[e.RowIndex];
            //CargarDatos los datos
            int id = Convert.ToInt32(gridNegocio.DataKeys[e.RowIndex].Values[0]);
            string nombre = (fila.FindControl("txtNombre") as TextBox).Text.ToUpper();
            byte[] logo = (fila.FindControl("fileLogo") as FileUpload).FileBytes;
            string descripcion = (fila.FindControl("txtDescripcion") as TextBox).Text.ToUpper();
            string mision = (fila.FindControl("txtMision") as TextBox).Text.ToUpper();
            string vision = (fila.FindControl("txtVision") as TextBox).Text.ToUpper();


            BLLNegocio bbln = new BLLNegocio();
            Negocio nego = new Negocio();
            bbln.ObtenerNegocioPorID(id);
            nego.ID = id;
            nego.Nombre = nombre;
            nego.Logo = logo;
            nego.Descripcion = descripcion;
            nego.Mision = mision;
            nego.Vision = vision;
            bbln.ModificarNegocio(id, nego.Nombre, nego.Logo, nego.Descripcion, nego.Mision, nego.Vision);


            //Termina proceso de la edicion
            gridNegocio.EditIndex = -1;


            //Carga los datos
            CargarDatos();
        }

        protected void gridNegocio_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {


            try
            {
                //Recorre la linea y elimina el id
                int id = 0;
                foreach (DictionaryEntry keyEntry in e.Keys)
                {
                    id = Convert.ToInt32(keyEntry.Value);
                }

                BLLNegocio bllc = new BLLNegocio();
                bllc.EliminarNegocio(id);
                MessageBox.Show("Negocio eliminado con exito");
            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();

        }

        protected void gridNegocio_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                //Activa edicion
                gridNegocio.EditIndex = e.NewEditIndex;
            }
            catch (Exception)
            {

                throw;
            }

            CargarDatos();
        }
    }
}