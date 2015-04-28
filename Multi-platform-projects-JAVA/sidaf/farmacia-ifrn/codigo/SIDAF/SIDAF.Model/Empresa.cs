using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SIDAF.Model.Interface;

namespace SIDAF.Model
{
    public class Empresa : IEmpresa
    {
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }

        private string razaoSocial;

        public string RazaoSocial
        {
            get { return razaoSocial; }
            set { razaoSocial = value; }
        }

        private string nomeFantasia;

        public string NomeFantasia
        {
            get { return nomeFantasia; }
            set { nomeFantasia = value; }
        }

        private int cnpj;

        public int Cnpj
        {
            get { return cnpj; }
            set { cnpj = value; }
        }

        private int ie;

        public int Ie
        {
            get { return ie; }
            set { ie = value; }
        }

        private Endereco endereco;

        public Endereco Endereco
        {
            get { return endereco; }
            set { endereco = value; }
        }

        public Empresa()
        {
        }

        public Empresa(string razao, string fantasia, int cnpj, int ie, Endereco end)
        {
            this.razaoSocial = razao;
            this.nomeFantasia = fantasia;
            this.cnpj = cnpj;
            this.ie = ie;
            this.endereco = end;
        }


        public override string ToString()
        {
           
            return this.razaoSocial + " - " + this.nomeFantasia + " - " + this.cnpj.ToString() + " - " +
                this.ie.ToString() + " - " + this.endereco.ToString();         
        }
        
    }
}