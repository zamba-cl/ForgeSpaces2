using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ForgeSpaces2.Transacao
{
    public class UsuarioTransacao
    {
        public static int IncluirUsuario(Hashtable htParametros)
        {
            AcessarDados dados = new AcessarDados();

            string sql = @"INSERT INTO Usuario (Nome, Telefone, Email, Senha)
                 VALUES (@Nome, @Telefone, @Email, @Senha)
                 SELECT SCOPE_IDENTITY()";

            return dados.ExecutarInsert(sql, htParametros);
            
        }

        public static DataTable ObterDadosUsuario(string email)
        {
            AcessarDados dados = new AcessarDados();
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Email", email);

            string sql = @"SELECT * FROM Usuario
                            WHERE Email = @Email";

            return dados.ExecutarSelect(sql, htParametros);
        }
    }
}