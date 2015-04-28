using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIDAF.Model.Interface;

namespace SIDAF.Model
{
    public class Categoria : ICategoria
    {
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

        public Categoria()
        {
        }

        public Categoria(string nome)
        {
            this.nome = nome;
        }

        public override string ToString()
        {
            return this.nome;
        } 


    }
}
