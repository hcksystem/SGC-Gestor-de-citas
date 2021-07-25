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
            SqlCommand cmd = new SqlCommand(String.Format("set dateformat dmy;Insert into encabezadoFactura(numeroFactura,fecha,idUsuario,idCliente,idMetodoPago,TarjetaDigitos,SubTotal,Iva,Total) values ({0},'{1}',{2},{3},{4},'{5}',{6},{7},{8})",factura.numeroFactura,factura.fecha,factura.idUsuario,factura.idCliente1,factura.idMetodoPago,factura.tarjetaDigitos,factura.totalFactura,factura.totalFactura*0.13,factura.totalFactura*1.13), Conexion);
            
            Conexion.Open();
            cmd.ExecuteNonQuery();

            foreach (DetalleFactura det in factura.Detalle)
            {
                cmd = new SqlCommand(String.Format("Insert into detalleFactura values({0},{1}, {2}, {3}, {4}, {5})", det.id, det.idServicio, det.cantidad, det.precio, det.idEncabezado, det.idProducto), Conexion);
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
