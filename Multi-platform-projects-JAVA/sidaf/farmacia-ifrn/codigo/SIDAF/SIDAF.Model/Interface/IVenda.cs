using System;
namespace SIDAF.Model
{
    interface IVenda
    {
        DateTime DataVenda { get; set; }
        int? Oid { get; set; }
    }
}
