using System;
namespace SIDAF.Model
{
    interface ICategoria
    {
        string Nome { get; set; }
        int? Oid { get; set; }
        string ToString();
    }
}
