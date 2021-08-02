using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SGC_Gestor_de_citas
{
    public partial class frmFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["NoFact"] != null)
                {
                    // Set the processing mode for the ReportViewer to Local  
                    ReportViewer1.ProcessingMode = ProcessingMode.Local;

                    LocalReport localReport = ReportViewer1.LocalReport;

                    localReport.ReportPath = "rptFact.rdlc";
                    DataSet dataset = new DataSet("DataSet1");
                    if (txtNumFact.Text.Length == 0)
                    {
                        string NoFact = Request.QueryString["NoFact"];
                        GenerarFactura(NoFact, ref dataset);
                    }
                    ReportDataSource dsFact = new ReportDataSource();
                    dsFact.Name = "DataSet1";
                    dsFact.Value = dataset.Tables["DataSet1"];

                    localReport.DataSources.Add(dsFact);
                }
            }
        }

        protected void txtNumFact_TextChanged(object sender, EventArgs e)
        {
            // Set the processing mode for the ReportViewer to Local  
            //ReportViewer1.ProcessingMode = ProcessingMode.Local;

            //LocalReport localReport = ReportViewer1.LocalReport;

            //localReport.ReportPath = "rptFact.rdlc";
            //DataSet dataset = new DataSet("DataSet1");
            //string NoFact = txtNumFact.Text;
            //GenerarFactura(NoFact, ref dataset);
            //ReportDataSource dsFact = new ReportDataSource();
            //dsFact.Name = "DataSet1";
            //dsFact.Value = dataset.Tables["DataSet1"];

            //localReport.DataSources.Add(dsFact);
            Response.Redirect("FrmFactura.aspx?NoFact="+txtNumFact.Text);
        }

        private void GenerarFactura(string noFact, ref DataSet dataset)
        {
            if (txtNumFact.Text.Length > 0) {
                noFact = txtNumFact.Text;
            }
            string sqlCitas = String.Format("Select * from VW_Factura where numeroFactura='{0}'", noFact);
            SqlConnection connection = new
        SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString);
            connection.Open();
            SqlCommand command =
        new SqlCommand(sqlCitas, connection);
            SqlDataAdapter salesOrderAdapter = new
        SqlDataAdapter(command);

            salesOrderAdapter.Fill(dataset, "DataSet1");
        }
    }
}