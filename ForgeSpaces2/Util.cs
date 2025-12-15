using ForgeSpaces2.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ForgeSpaces2
{
    public class Util
    {
        public static string RemoverMascara(string texto)
        {
            texto = texto.Trim();
            texto = texto.Replace("(", "")
                .Replace(")", "")
                .Replace("-", "")
                .Replace(".", "")
                .Replace(",", "")
                .Replace("_", "")
                .Replace("/", "");

            return texto;
        }

        public static UsuarioModel ConverterDataTableParaUsuario(DataTable dttUsuario)
        {
            if (dttUsuario == null || dttUsuario.Rows.Count == 0)
                return null;

            DataRow row = dttUsuario.Rows[0];

            UsuarioModel usuario = new UsuarioModel();

            usuario.IdUsuario = Convert.ToInt32(row["Id_Usuario"]);
            usuario.Nome = row["Nome"].ToString();
            usuario.Telefone = row["Telefone"].ToString();
            usuario.Email = row["Email"].ToString();
            usuario.Senha = row["Senha"].ToString();

            return usuario;
        }
    }
}