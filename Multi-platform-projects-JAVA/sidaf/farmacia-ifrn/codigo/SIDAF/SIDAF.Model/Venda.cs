using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIDAF.Model.Interface;



namespace SIDAF.Model
{
    public class Venda : IVenda
    {
        #region Fields
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }

        private DateTime dataVenda;

        public DateTime DataVenda
        {
            get { return dataVenda; }
            set { dataVenda = value; }
        }
        private Funcionario funcionario;

        public Funcionario Funcionario
        {
            get { return funcionario; }
            set { funcionario = value; }
        }
        private int tipoVenda;

        public int TipoVenda
        {
            get { return tipoVenda; }
            set { tipoVenda = value; }
        }
        //private List<ItemVenda> itens;
        private Empresa empresa;

        public Empresa Empresa
        {
            get { return empresa; }
            set { empresa = value; }
        }
        
        #endregion Fields
    }
}
