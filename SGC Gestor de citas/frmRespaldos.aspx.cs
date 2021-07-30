using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmRespaldos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                CargarBackups();
            }
        }
        protected void RealizarBackup()
        {
            string sqlCitas = String.Format("exec master..SP_Backup 'SolucionesSGC','{0}'", Server.MapPath("~/Respaldos"));
            SqlConnection connection = new
        SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            command.ExecuteNonQuery();
            CargarBackups();
        }
        protected void RealizarRestauracion()
        {
            RealizarBackup();
            string sqlCitas = String.Format("exec master..SP_Restore 'SolucionesSGC','{0}'", Session["Backup"].ToString());
            SqlConnectionStringBuilder stringBuilder = new SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            stringBuilder.Remove("User Id");
            stringBuilder.Remove("Password");
            stringBuilder.Remove("Initial Catalog");
                stringBuilder.InitialCatalog="master";
            stringBuilder.UserID = "Seguridad";
            stringBuilder.Password = "Seguridad2021";
            SqlConnection connection = new
        SqlConnection(stringBuilder.ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            command.ExecuteNonQuery();
            CargarBackups();
        }
        protected void CargarBackups() {
            string ruta = Server.MapPath("~/Respaldos");
            string[] files = Directory.GetFiles(ruta, "*.bak");
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("NombreBackup");
            dt.Columns.Add("Fecha");
            dt.Columns.Add("Hora");
            foreach (var file in files)
            {
                DataRow _ravi = dt.NewRow();
                _ravi["NombreBackup"] = Path.GetFileName(file);
                _ravi["Fecha"] = Path.GetFileName(file).Replace(" ", "").Split('-')[1].Substring(0, 8).Insert(2, "/").Insert(5, "/").ToString();
                _ravi["Hora"] = Path.GetFileName(file).Replace(" ", "").Split('-')[1].Substring(8, 4).Insert(2, ":").ToString();
                dt.Rows.Add(_ravi);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            RealizarBackup();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName) {

                case "SelectBackup":
                    String Ruta=Server.MapPath("~/Respaldos");
                    string NombreBackup = Convert.ToString(e.CommandArgument.ToString());
                    Session["Backup"] = Ruta +@"\"+ NombreBackup;
                    break;
            }
        }

        protected void btnRestaurar_Click(object sender, EventArgs e)
        {
            RealizarRestauracion();
        }
    }
}