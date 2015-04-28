using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class Especificacao : SIDAF.Model.IEspecificacao
    {

        #region atributos

        private Nullable<int> id;

        public Nullable<int> Id
        {
            get { return id; }
        }
        private string nome;

        public string Nome
        {
            get { return Nome; }
            set { Nome = value; }
        }

        private Produto produto;

        public Produto Produto
        {
            get { return produto; }
            set { produto = value; }
        }


        #endregion

   

    }
}
