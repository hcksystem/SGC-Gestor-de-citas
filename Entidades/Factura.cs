using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Factura
    {
        public int numeroFactura { get; set; }
        public DateTime fecha { get; set; }
        public int idUsuario { get; set; }
        public int idMetodoPago { get; set; }

        public string tarjetaDigitos;

        public string GetTarjetaDigitos()
        {
            return tarjetaDigitos;
        }

        public void SetTarjetaDigitos(string value)
        {
            tarjetaDigitos = value;
        }

        public Double totalFactura { get; set; }
        public List<DetalleFactura> Detalle { get; set; }

        public int idCliente1;

        public int GetidCliente()
        {
            return idCliente1;
        }

        public void SetidCliente(int value)
        {
            idCliente1 = value;
        }

        public Factura(int numeroFactura, DateTime fecha, int idUsuario, int idMetodoPago, double totalFactura, List<DetalleFactura> detalle,int idCliente,string TarjetaDigitos)
        {
            this.numeroFactura = numeroFactura;
            this.fecha = fecha;
            this.idUsuario = idUsuario;
            this.idMetodoPago = idMetodoPago;
            this.totalFactura = totalFactura;
            Detalle = detalle;
            this.idCliente1 = idCliente;
            this.tarjetaDigitos = TarjetaDigitos;
        }

        public Factura()
        {
            this.numeroFactura = 0;
            this.fecha = new DateTime();
            this.idUsuario = 0;
            this.idMetodoPago = 0;
            this.totalFactura = 0;
            Detalle = new List<DetalleFactura>();
            this.idCliente1 = 0;
            this.tarjetaDigitos = "";
        }
    }
    public class DetalleFactura {
        public int id { get; set; }
        public int idServicio { get; set; }
        public int cantidad { get; set; }
        public Double precio { get; set; }
        public int idEncabezado { get; set; }
        public int idProducto { get; set; }

        public DetalleFactura(int id, int idServicio, int cantidad, double precio, int idEncabezado, int idProducto)
        {
            this.id = id;
            this.idServicio = idServicio;
            this.cantidad = cantidad;
            this.precio = precio;
            this.idEncabezado = idEncabezado;
            this.idProducto = idProducto;
        }
        public DetalleFactura()
        {
            this.id = 0;
            this.idServicio = 0;
            this.cantidad = 0;
            this.precio = 0;
            this.idEncabezado = 0;
            this.idProducto = 0;
        }
    }
}
