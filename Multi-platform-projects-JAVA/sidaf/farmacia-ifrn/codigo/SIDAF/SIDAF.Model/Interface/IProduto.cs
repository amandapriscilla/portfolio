using System;
namespace SIDAF.Model
{
    interface IProduto
    {
        int? Id { get; }
        string PrincipioAtivo { get; set; }
    }
}
