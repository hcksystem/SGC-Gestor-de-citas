﻿using LogicaNegocio_BLL_;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmMisCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("frmLogin.aspx");
            }

            if (!IsPostBack)
            {
                cargarCitasPendientes(1);
            }
            
        }
        public void cargarCitasPendientes(int Tipo)
        {
            try
            {
                BLLCita bllc = new BLLCita();
                DataTable dt = bllc.ObtenerMisCitas(Convert.ToInt32(Session["ID"].ToString()),Tipo);
                gridCitasPendientes.DataSource = dt;
                gridCitasPendientes.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void gridMisCitas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridCitasPendientes.PageIndex = e.NewPageIndex;
            this.cargarCitasPendientes(1);
        }

        protected void gridMisCitas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(gridCitasPendientes.Rows[e.RowIndex].Cells[2].Text);
                BLLCita bllu = new BLLCita();
                bllu.EliminarCita(index);
                cargarCitasPendientes(1);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Cita',' Cancelada con éxito','success','frmMisCitas.aspx')",
                     true
                     );
            }
            catch (Exception)
            {
                throw;
            }

            cargarCitasPendientes(1);

        }

        protected void gridMisCitas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[2].Text;
                foreach (ImageButton button in e.Row.Cells[1].Controls.OfType<ImageButton>())
                {
                    if (button.CommandName == "Cancelar")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Está seguro que desea cancelar esta cita? " + item + "?')){ return false; };";
                    }
                }
            }
        }

            

        protected void gridMisCitas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "Cancelar":
                //Recorre la linea y elimina el id
                int index = Convert.ToInt32(e.CommandArgument);
                BLLCita bllu = new BLLCita();
                bllu.EliminarCita(index);
                 cargarCitasPendientes(1);

                ClientScript.RegisterStartupScript(
                    this.GetType(),
                     "Registro",
                     "mensajeRedirect('Cita',' Cancelada con éxito','success','frmMisCitas.aspx')",
                     true
                     );
                        break;
            }
            }
            catch (Exception)
            {
                throw;
            }

            cargarCitasPendientes(1);
        }
    }
}