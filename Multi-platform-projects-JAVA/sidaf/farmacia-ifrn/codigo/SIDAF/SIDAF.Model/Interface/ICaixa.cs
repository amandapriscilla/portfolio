using System;
namespace SIDAF.Model
{
    interface ICaixa
    {
        DateTime DataAbertura { get; set; }
        DateTime DataFechamento { get; set; }
        int? Oid { get; set; }
    }
}
