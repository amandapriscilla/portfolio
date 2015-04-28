using System;

namespace SIDAF.Model
{
    interface IUsuario
    {
        string Login { get; set; }
        int Oid { get; set; }
        string Senha { get; set; }
    }
}
