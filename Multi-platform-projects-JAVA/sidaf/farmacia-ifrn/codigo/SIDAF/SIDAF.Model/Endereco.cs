using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIDAF.Model.Interface;

namespace SIDAF.Model
{
    public class Endereco : IEndereco
    {
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }
        private string logradouro;

        public string Logradouro
        {
            get { return logradouro; }
            set { logradouro = value; }
        }
        private string numero;

        public string Numero
        {
            get { return numero; }
            set { numero = value; }
        }
        private string complemento;

        public string Complemento
        {
            get { return complemento; }
            set { complemento = value; }
        }
        private string cidade;

        public string Cidade
        {
            get { return cidade; }
            set { cidade = value; }
        }
        private string uf;

        public string Uf
        {
            get { return uf; }
            set { uf = value; }
        }
        private int cep;

        public int Cep
        {
            get { return cep; }
            set { cep = value; }
        }

        private Telefones telefone;

        public Telefones Telefone
        {
            get { return telefone; }
            set { telefone = value; }
        }

        public Endereco()
        {
        }

        public Endereco(string logradouro, string numero, string complemento, 
            string cidade, string uf, Telefones telefone)
        {
            this.logradouro = logradouro;
            this.numero = numero;
            this.complemento = complemento;
            this.cidade = cidade;
            this.uf = uf;
            this.telefone = telefone;
        }

        public override string ToString()
        {
            string telefones = null;
            foreach (Telefone fones in telefone)
            {
                telefones = fones.ToString()+"|";
            }
            return this.logradouro + " - " + this.numero + " - " + this.complemento + " - " +
                this.Cidade + " - " + this.uf + " - " + telefones;
        }

    }
}
