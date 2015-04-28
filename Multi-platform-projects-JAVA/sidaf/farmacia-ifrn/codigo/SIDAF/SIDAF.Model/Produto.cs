using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class Produto : SIDAF.Model.IProduto
    {

        #region atributos

        private Nullable<int> id;

        public Nullable<int> Id
        {
            get { return id; }
        }
        private string principioAtivo;

        public string PrincipioAtivo
        {
            get { return principioAtivo; }
            set { principioAtivo = value; }
        }

        private TipoProduto tipo;

        public TipoProduto Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        #endregion

    

    }
}
