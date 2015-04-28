using System;
namespace SIDAF.Model
{
    interface IFuncionario
    {
        int Cpf { get; set; }
        DateTime DataAdmissao { get; set; }
        DateTime? DataDemissao { get; set; }
        DateTime DataNasc { get; set; }
        Empresa Empresa { get; set; }
        Endereco Endereco { get; set; }
        string Nacionalidade { get; set; }
        string Naturalidade { get; set; }
        string Nome { get; set; }
        int? Oid { get; set; }
        int Rg { get; set; }
        string ToString();
        Usuario Usuario { get; set; }
    }
}
