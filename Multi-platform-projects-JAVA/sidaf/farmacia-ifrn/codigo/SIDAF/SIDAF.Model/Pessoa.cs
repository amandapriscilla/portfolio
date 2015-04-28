using System;
using SIDAF.Model.Interface;

namespace SIDAF.Model
{
    public class Pessoa : IPessoa 
    {
        #region Atributos
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
        
        private string telefone;
        public string Telefone
        {
            get { return telefone; }
            set { telefone = value; }
        }
        #endregion 
    }
}
