using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class Usuario : SIDAF.Model.IUsuario
    {
        private int oid;

        public int Oid
        {
            get { return oid; }
            set { oid = value; }
        }

        private string login;

        public string Login
        {
            get { return login; }
            set { login = value; }
        }
        private string senha;

        public string Senha
        {
            get { return senha; }
            set { senha = value; }
        }

        public Usuario()
        {
        }
        public Usuario(int oid, string login, string senha)
        {
            this.oid = oid;
            this.login = login;
            this.senha = senha;
        }






    }
}
