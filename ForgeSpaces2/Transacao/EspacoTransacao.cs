using System;
using System.Collections;
using System.Data;

namespace ForgeSpaces2.Transacao
{
    public class EspacoTransacao
    {
        public static void IncluirEspaco(Hashtable htParametros)
        {
            AcessarDados dados = new AcessarDados();

            string sql = @"INSERT INTO Espaco (Nome, Endereco, Capacidade, Valor, Caminho_Imagem, Id_Usuario, Del_Espaco)
                 VALUES (@Nome, @Endereco, @Capacidade, @Valor, @Imagem, @Id_Usuario, 0)";

            dados.ExecutarNonQuery(sql, htParametros);

        }

        public static DataTable ObterDadosEspaco()
        {
            AcessarDados dados = new AcessarDados();
             string sql = @"SELECT * FROM Espaco
                            WHERE Del_Espaco = 0";

            return dados.ExecutarSelect(sql);
        }

        public static DataTable ObterDadosEspacoUsuario(string idUsuario)
        {
            AcessarDados dados = new AcessarDados();
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Id_Usuario", idUsuario);

            string sql = @"SELECT * FROM Espaco
                            WHERE Id_Usuario = @Id_Usuario and Del_Espaco = 0";

            return dados.ExecutarSelect(sql, htParametros);
        }

        public static void ExcluirEspaco(int id)
        {
            AcessarDados dados = new AcessarDados();
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Id_Espaco", id);

            string sql = @"UPDATE Espaco 
                            SET Del_Espaco = 1
                            WHERE Id_Espaco = @Id_Espaco";
            dados.ExecutarNonQuery(sql , htParametros);
        }
    }
}