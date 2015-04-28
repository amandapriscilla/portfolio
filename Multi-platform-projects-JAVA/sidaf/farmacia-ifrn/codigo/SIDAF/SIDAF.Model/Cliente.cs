using System;
using SIDAF.Model.Interface;


namespace SIDAF.Model
{
   public class Cliente : ICliente
    {
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }
        
        private Usuario usuario;

        public Usuario Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        private Endereco endereco;

        public Endereco Endereco
        {
            get { return endereco; }
            set { endereco = value; }
        }

        private Nullable<string> telefone;

        public Nullable<string> Telefone
        {
            get { return telefone; }
            set { telefone = value; }
        }

        private Nullable<string> celular;

        public Nullable<string> Celular
        {
            get { return celular; }
            set { celular = value; }
        }

        private Nullable<string> email;

        public Nullable<string> Email
        {
            get { return email; }
            set { email = value; }
        }

        private string nome;

        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }
        private int cpf;

        public int Cpf
        {
            get { return cpf; }
            set { cpf = value; }
        }
        
        private Nullable<int> rg;

        public Nullable<int> Rg
        {
            get { return rg; }
            set { rg = value; }
        }

        private Nullable<string> orgaoEmissor;

        public Nullable<string> OrgaoEmissor
        {
            get { return orgaoEmissor; }
            set { orgaoEmissor = value; }
        }

        private Nullable<DateTime> dataNasc;

        public Nullable<DateTime> DataNasc
        {
            get { return dataNasc; }
            set { dataNasc = value; }
        }
        private DateTime dataAdmissao;

        public DateTime DataAdmissao
        {
            get { return dataAdmissao; }
        }

        private Nullable<DateTime> dataUltimaAlteracao;

        public Nullable<DateTime> DataUltimaAlteracao
        {
            get { return dataUltimaAlteracao; }
            set { dataUltimaAlteracao = value; }
        }

        private Nullable<string> naturalidade;

        public Nullable<string> Naturalidade
        {
            get { return naturalidade; }
            set { naturalidade = value; }
        }
        private Nullable<string> nacionalidade;

        public Nullable<string> Nacionalidade
        {
            get { return nacionalidade; }
            set { nacionalidade = value; }
        }

        public Cliente(Usuario usuario, Endereco endereco, string telefone, string celular, 
            string email, string nome, int cpf,int rg, DateTime dataNasc, DateTime dataAdmissao, 
            DateTime dataUltimaAlteracao, string orgaoEmissor, string naturalidade, string nacionalidade)
        {
            this.usuario = usuario;
            this.endereco = endereco;
            this.nome = nome;
            this.cpf = cpf;
            this.rg = rg;
            this.orgaoEmissor = orgaoEmissor;
            this.telefone = telefone;
            this.celular = celular;
            this.email = email;
            this.dataNasc = dataNasc;
            this.dataAdmissao = dataAdmissao;
            this.dataUltimaAlteracao = dataUltimaAlteracao;
            this.naturalidade = naturalidade;
            this.nacionalidade = nacionalidade;
        }

        public override string ToString()
        {
            return this.nome + " - " + this.dataNasc.ToString() + " - " + this.cpf.ToString() + " - " + this.endereco.ToString();
        } 
        
    }
}
