using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace SGC_Gestor_de_citas
{
    /// <summary>
    /// Descripción breve de WS
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WS : WebService
    {

        [WebMethod]
        public  string HelloWorld()
        { 
            return "Hola a todos";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<string> GetAutoCompleteData(string Texto)
        {
            List<string> result = new List<string>();
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("Select Item[Name] from VW_Completar_ProdServ where item like  '%'+@SearchText+'%'", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@SearchText", Texto);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            result.Add(dr["Name"].ToString());
                        }
                        return result;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Add(ex.Message);
                return result;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<string> GetClientes(string Texto)
        {
            List<string> result = new List<string>();
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SQL1"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("Select Socio[Name] from VW_Completar_Cliente where Socio like  '%'+@SearchText+'%'", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@SearchText", Texto);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            result.Add(dr["Name"].ToString());
                        }
                        return result;
                    }
                }
            }
            catch (Exception ex)
            {
                result.Add(ex.Message);
                return result;
            }
        }
    }
}
