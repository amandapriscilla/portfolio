using System;

namespace SIDAF.Model
{
    public class Telefone
    {
        private Nullable<int> oid;

        public Nullable<int> Oid
        {
            get { return oid; }
            set { oid = value; }
        }

        private string fone;

        public string Fone
        {
            get { return fone; }
            set { fone = value; }
        }

        public Telefone()
        {
        }

        public Telefone(int oid, string fone)
        {
            this.oid = oid;
            this.fone = fone;
        }       
    }
}
