using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIDAF.Model.Interface;

namespace SIDAF.Model
{
    public class Sac : ISac
    {
        // Empresa???
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }

        private string nome;

        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }
        private string assunto;

        public string Assunto
        {
            get { return assunto; }
            set { assunto = value; }
        }
        private string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string telefone;

        public string Telefone
        {
            get { return telefone; }
            set { telefone = value; }
        }
        private string mensagem;

        public string Mensagem
        {
            get { return mensagem; }
            set { mensagem = value; }
        }

        public Sac()
        {
        }

        public Sac(string nome, string assunto, string email, string telefone, string mensagem)
        {
            this.nome = nome;
            this.assunto = assunto;
            this.email = email;
            this.telefone = telefone;
            this.mensagem = mensagem;
        }

        public override string ToString()
        {

            return this.nome + " - " + this.assunto + " - " + this.email + " - " +
                this.telefone + " ( " + this.mensagem + " ) ";
        }

    }
}
