using System;

namespace SIDAF.Model.Interface
{
    public interface IPessoa
    {
        string Nome { get; set; }
        int? Oid { get; set; }
        string Telefone { get; set; }
    }
}
