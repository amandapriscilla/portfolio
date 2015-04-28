                                                                                                                          using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class Entrada : SIDAF.Model.IEntrada
    {
        #region Fields
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }
        private DateTime dataEntrada;

        public DateTime DataEntrada
        {
            get { return dataEntrada; }
            set { dataEntrada = value; }
        }
        private double valor;

        private Funcionario funcionario;
        public Funcionario Funcionario
        {
            get { return funcionario; }
            set { funcionario = value; }
        }
        #endregion
    }
}
