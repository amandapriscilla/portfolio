using System;
using SIDAF.Model;
using System.Data.SqlClient;
using System.Data;

namespace SIDAF.DAL
{
    public sealed class PessoaDAO
    {
        /*
        public void inserir(Pessoa pessoa)
        {
            try
            {
                Banco.AbrirConexao();
                string comando = "insert into pessoa (nome, telefone) values (@nome, @telefone)";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;
                
                cmd.Parameters.AddWithValue("@nome", pessoa. .Nome);
                cmd.Parameters.AddWithValue("@telefone", pessoa.Telefone);
                
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar inserir nova pessoa: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
        }

        public void atualizar(Pessoa pessoa)
        {
            try
            {
                Banco.AbrirConexao();
                string comando = @"update pessoa set nome = @nome, telefone = @telefone where id = @id";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@id", pessoa.Oid.Value);
                cmd.Parameters.AddWithValue("@nome", pessoa.Nome);
                cmd.Parameters.AddWithValue("@telefone", pessoa.Telefone);

                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar atualizar informações da pessoa: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
        }

        public void excluir(Pessoa pessoa)
        {
            try
            {
                Banco.AbrirConexao();
                string comando = @"delete from pessoa where id = @id";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@id", pessoa.Oid.Value);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar excluir pessoa: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
        }

        public Pessoas selecionar()
        {
            Pessoas pessoas = new Pessoas();
            try
            {
                Banco.AbrirConexao();
                string comando = @"select * from pessoa";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;

                SqlDataReader dr = cmd.ExecuteReader();

                Pessoa pessoa = null;
                while (dr.Read())
                {
                    pessoa = new Pessoa();
                    pessoa.Oid = int.Parse(dr["id"].ToString());
                    pessoa.Nome = dr["nome"].ToString();
                    pessoa.Telefone = dr["telefone"].ToString();
                    pessoas.Add(pessoa);
                }
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar selecionar pessoas: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
            return pessoas;
        }

        public Pessoa selecionarPorId(int id)
        {
            Pessoa pessoa = null;
            try
            {
                Banco.AbrirConexao();
                string comando = @"select * from pessoa where id = @id";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@id", id);
                
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    pessoa.Oid = int.Parse(dr["id"].ToString());
                    pessoa.Nome = dr["nome"].ToString();
                    pessoa.Telefone = dr["telefone"].ToString();
                }
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar selecionar pessoa: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
            return pessoa;
        }

        public Pessoas selecionarPorNome(string nome)
        {
            Pessoas pessoas = new Pessoas();
            try
            {
                Banco.AbrirConexao();
                string comando = @"select * from pessoa where nome like @nome";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;
                nome = "%" + nome + "%";
                cmd.Parameters.AddWithValue("@nome", nome);
                SqlDataReader dr = cmd.ExecuteReader();

                Pessoa pessoa = null;
                while (dr.Read())
                {
                    pessoa = new Pessoa();
                    pessoa.Oid = int.Parse(dr["id"].ToString());
                    pessoa.Nome = dr["nome"].ToString();
                    pessoa.Telefone = dr["telefone"].ToString();
                    pessoas.Add(pessoa);
                }
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar selecionar pessoas: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
            return pessoas;
        }

        public Pessoas selecionarPorTelefone(string telefone)
        {
            Pessoas pessoas = new Pessoas();
            try
            {
                Banco.AbrirConexao();
                string comando = @"select * from pessoa where telefone like @telefone";
                SqlCommand cmd = new SqlCommand(comando, Banco.Conexão);
                cmd.CommandType = CommandType.Text;
                telefone = "%" + telefone;
                cmd.Parameters.AddWithValue("@telefone", telefone);
                SqlDataReader dr = cmd.ExecuteReader();

                Pessoa pessoa = null;
                while (dr.Read())
                {
                    pessoa = new Pessoa();
                    pessoa.Oid = int.Parse(dr["id"].ToString());
                    pessoa.Nome = dr["nome"].ToString();
                    pessoa.Telefone = dr["telefone"].ToString();
                    pessoas.Add(pessoa);
                }
            }
            catch (Exception e)
            {
                throw new Exception("ERRO ao tentar selecionar pessoas: " + e.Message);
            }
            finally
            {
                Banco.FecharConexao();
            }
            return pessoas;
        }
     */   
    }
}
