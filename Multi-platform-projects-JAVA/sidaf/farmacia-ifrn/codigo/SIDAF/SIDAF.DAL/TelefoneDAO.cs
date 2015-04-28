using System;
using SIDAF.Model;
using System.Data.SqlClient;
using System.Data;

namespace SIDAF.DAL
{
    public sealed class TelefoneDAO
    {

        public void inserir(Telefone telefone)
        {
            try
            {
                Banco.AbrirConexao();
                string comando = "insert into telefone (id, telefone)";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@id", telefone.Fone);
                cmd.Parameters.AddWithValue("@telefone", telefone.Oid);                
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar inserir telefone: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
        }

    }
}
