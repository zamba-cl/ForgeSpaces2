using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForgeSpaces2.Models
{
    public class ReservaModel
    {
        public int IdReserva { get; set; }
        public int IdEspaco { get; set; }
        public int IdUsuario { get; set; }
        public DateTime DataReserva {  get; set; }
    }
}