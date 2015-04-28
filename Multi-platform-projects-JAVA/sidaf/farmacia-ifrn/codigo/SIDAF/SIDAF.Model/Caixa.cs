using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIDAF.Model
{
    public class Caixa : SIDAF.Model.ICaixa
    {
        #region Fields
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }
        private DateTime dataAbertura;

        public DateTime DataAbertura
        {
            get { return dataAbertura; }
            set { dataAbertura = value; }
        }
        private DateTime dataFechamento;

        public DateTime DataFechamento
        {
            get { return dataFechamento; }
            set { dataFechamento = value; }
        }
        private Funcionario funcionario;

        public Funcionario Funcionario
        {
            get { return funcionario; }
            set { funcionario = value; }
        }
        private Venda venda;

        public Venda Venda
        {
            get { return venda; }
            set { venda = value; }
        }
        private Entrada entrada;

        public Entrada Entrada
        {
            get { return entrada; }
            set { entrada = value; }
        }
        private Saida saida;

        public Saida Saida
        {
            get { return saida; }
            set { saida = value; }
        }
        private Estorno estorno;

        public Estorno Estorno
        {
            get { return estorno; }
            set { estorno = value; }
        }

        #endregion
    }
}
