using System.Data;
using System.Data.SqlClient;

namespace SIDAF.DAL
{
    public class Banco
    {
        private static string stringDeConexao = "";

        private static SqlConnection conexao;

        public static void AbrirConexao()
        {
            conexao = new SqlConnection(stringDeConexao);
            conexao.Open();
        }

        public static void FecharConexao()
        {
            if (conexao != null && conexao.State == ConnectionState.Open)
                conexao.Close();
        }

        public static SqlConnection Conexão
        {
            get { return conexao; }
        }
    }
}