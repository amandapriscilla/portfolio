using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class ItemEstoque : SIDAF.Model.IItemEstoque
    {

        #region atributos

        private Nullable<int> id;

        public Nullable<int> Id
        {
            get { return id; }
        }
                
        private int quantidade;

        public int Quantidade
        {
            get { return quantidade; }
            set { quantidade = value; }
        }

        private DateTime dataCadastro;

        public DateTime DataCadastro
        {
            get { return dataCadastro; }
            set { dataCadastro = value; }
        }

        private DateTime dataUIAlteracao;

        public DateTime DataUIAlteracao
        {
            get { return dataUIAlteracao; }
            set { dataUIAlteracao = value; }
        }

        private double precoCusto;

        public double PrecoCusto
        {
            get { return precoCusto; }
            set { precoCusto = value; }
        }

        private double precoVenda;

        public double PrecoVenda
        {
            get { return precoVenda; }
            set { precoVenda = value; }
        }


        #endregion


    
    
    }
}
