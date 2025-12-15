using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ForgeSpaces2.Models
{
    public class EspacoModel
    {
        public int IdEspaco { get; set; }
        public string Nome { get; set; }
        public string Enderco { get; set; }
        public int Capacidade { get; set; }
        public decimal Valor { get; set; }
        public string CaminhoImagem { get; set; }
        public int IdUsuario { get; set; }
    }
}