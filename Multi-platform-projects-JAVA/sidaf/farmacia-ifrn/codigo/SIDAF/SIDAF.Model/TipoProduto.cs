using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class TipoProduto : ITipoProduto
    {

        #region atributos

        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
        }
        private string nome;

        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }
        #endregion

   

    }
}
