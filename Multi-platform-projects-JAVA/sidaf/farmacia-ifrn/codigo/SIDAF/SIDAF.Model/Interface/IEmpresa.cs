using System;
namespace SIDAF.Model
{
    interface IEmpresa
    {
        int Cnpj { get; set; }
        int Ie { get; set; }
        string NomeFantasia { get; set; }
        int? Oid { get; set; }
        string RazaoSocial { get; set; }
        string ToString();
    }
}
