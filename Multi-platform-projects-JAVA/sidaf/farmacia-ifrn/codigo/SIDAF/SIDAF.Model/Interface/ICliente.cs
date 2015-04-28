using System;
namespace SIDAF.Model
{
    interface ICliente
    {
        int Cpf { get; set; }
        DateTime DataNascimento { get; set; }
        string Nacionalidade { get; set; }
        string Naturalidade { get; set; }
        string Nome { get; set; }
        int? Oid { get; set; }
        string OrgaoEmissor { get; set; }
        int Rg { get; set; }
        string ToString();
    }
}
