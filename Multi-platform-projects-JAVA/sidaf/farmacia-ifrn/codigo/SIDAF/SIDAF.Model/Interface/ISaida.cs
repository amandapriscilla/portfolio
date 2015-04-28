using System;
namespace SIDAF.Model
{
    interface ISaida
    {
        DateTime DataEntrada { get; set; }
        int? Oid { get; set; }
    }
}
