using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos_DAL_
{
    public class DALFactura : DALBase
    {
        public string InsertarFactura(Factura factura) {
            SqlCommand cmd = new SqlCommand("Insert into encabezadoFactura values (@NumFact,@Fecha,@idUsuario,@IdMetodoPago,@totalFactura)", Conexion);
            SqlParameter parametro;

            parametro = new SqlParameter("@NumFact", factura.numeroFactura);
            parametro.DbType = DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@Fecha", factura.fecha);
            parametro.DbType = DbType.DateTime;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@idUsuario",factura.idUsuario);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);

            parametro = new SqlParameter("@IdMetodoPago", factura.idMetodoPago);
            parametro.DbType = System.Data.DbType.Int32;
            cmd.Parameters.Add(parametro);
            parametro = new SqlParameter("@totalFactura", factura.totalFactura);
            parametro.DbType = System.Data.DbType.Double;
            cmd.Parameters.Add(parametro);
            Conexion.Open();
            cmd.ExecuteNonQuery();

            foreach (DetalleFactura det in factura.Detalle)
            {
                cmd = new SqlCommand("Insert into detalleFactura values(@id, @idServicio, @cantidad, @precio, @idEncabezado, @idProducto)", Conexion);
                parametro = new SqlParameter("@id", det.id);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);
                parametro = new SqlParameter("@idServicio", det.idServicio);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);
                parametro = new SqlParameter("@cantidad", det.cantidad);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);
                parametro = new SqlParameter("@precio", det.precio);
                parametro.DbType = DbType.Double;
                cmd.Parameters.Add(parametro);
                parametro = new SqlParameter("@idEncabezado", det.idEncabezado);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);
                parametro = new SqlParameter("@idProducto", det.idProducto);
                parametro.DbType = DbType.Int32;
                cmd.Parameters.Add(parametro);
                cmd.ExecuteNonQuery();
                if (det.idServicio != null)
                {
                    cmd = new SqlCommand(String.Format("Update a set estado=2 from Cita a where Fecha='{0}' and idUsuario={1} and idServicio={2} and estado=1", DateTime.Now.ToString("yyyy/MM/dd"), factura.idUsuario, det.idServicio), Conexion);
                    int CancelarCita = cmd.ExecuteNonQuery();
                }
            }
                Conexion.Close();
            return "Factura Ingresada Correctamente";
        }
    }
}
