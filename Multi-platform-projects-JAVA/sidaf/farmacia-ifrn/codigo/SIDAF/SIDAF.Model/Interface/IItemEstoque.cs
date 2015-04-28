using System;
namespace SIDAF.Model
{
    interface IItemEstoque
    {
        DateTime DataCadastro { get; set; }
        DateTime DataUIAlteracao { get; set; }
        int? Id { get; }
        double PrecoCusto { get; set; }
        double PrecoVenda { get; set; }
        int Quantidade { get; set; }
    }
}
