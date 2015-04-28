using System;
using SIDAF.Model;
using SIDAF.DAL;

namespace SIDAF.BLL
{
    public static class PessoaBLL
    {
        /*
        public static void salvar(Pessoa pessoa)
        {
            PessoaDAO pessoaDAO = new PessoaDAO();
            if (pessoa.Oid.HasValue) pessoaDAO.atualizar(pessoa);
            else pessoaDAO.inserir(pessoa);
        }

        public static void excluir(Pessoa pessoa)
        {
            PessoaDAO pessoaDAO = new PessoaDAO();
            pessoaDAO.excluir(pessoa);
        }

        public static Pessoas selecionar()
        {
            PessoaDAO pessoaDAO = new PessoaDAO();
            return pessoaDAO.selecionar();
        }

        public static Pessoa selecionar(int id)
        {
            PessoaDAO pessoaDAO = new PessoaDAO();
            return pessoaDAO.selecionarPorId(id);
        }

        public static Pessoas selecionar(object busca, BuscaPessoa tipoBusca)
        {
            PessoaDAO pessoaDAO = new PessoaDAO();
            switch (tipoBusca)
            {
                case BuscaPessoa.Nome:
                    return pessoaDAO.selecionarPorNome((string)busca);
                case BuscaPessoa.Telefone:
                    return pessoaDAO.selecionarPorTelefone((string)busca);
            }
            return null;
        }
         * */
    }
}
