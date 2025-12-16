using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ForgeSpaces2.Transacao
{
    public class ReservaTransacao
    {
        public static void IncluirReserva(Hashtable htParametros)
        {
            AcessarDados dados = new AcessarDados();

            string sql = @"INSERT INTO Reserva (Data_Reserva,Id_Espaco,Id_Usuario,Status)
                            VALUES (@Data_Reserva, @Id_Espaco, @Id_Usuario, 0)";

            dados.ExecutarNonQuery(sql, htParametros);

        }

        public static DataTable ObterDatasReserva(string idEspaco)
        {
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Id_Espaco", idEspaco);
            AcessarDados dados = new AcessarDados();

            string sql = @"SELECT Id_Reserva,
                            CONVERT(VARCHAR(10), Data_Reserva, 103) AS Data_Reserva
                            FROM Reserva
                            WHERE Status = 0 
                            AND Id_Espaco = @Id_Espaco";

            return dados.ExecutarSelect(sql, htParametros);

        }

        public static void EfetuarReserva(Hashtable htParametros)
        {
            AcessarDados dados = new AcessarDados();
            string sql = @"UPDATE Reserva
                            SET Id_Usuario = @Id_Usuario, Status = 2
                            WHERE Id_Reserva = @Data_Reserva";
            dados.ExecutarNonQuery(sql, htParametros);
        }

        public static void CancelarReserva(string idReserva)
        {
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Id_Reserva", idReserva);
            AcessarDados dados = new AcessarDados();
            string sql = @"UPDATE Reserva
                            SET Id_Usuario = NULL, Status = 0
                            WHERE Id_Reserva = @Id_Reserva";
            dados.ExecutarNonQuery(sql, htParametros);
        }

        public static DataTable ObterReservasUsuario(string idUsuario)
        {
            AcessarDados dados = new AcessarDados();
            Hashtable htParametros = new Hashtable();
            htParametros.Add("@Id_Usuario", idUsuario);

            string sql = @"SELECT * FROM Reserva r JOIN Espaco e ON
                           e.Id_Espaco = r.Id_Espaco
                           WHERE r.Id_Usuario = @Id_Usuario and r.Status = 2";

            return dados.ExecutarSelect(sql, htParametros);
        }
    }
}