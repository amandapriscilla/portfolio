using System;

namespace SIDAF.Model
{
    public interface ITipoProduto
    {
        int? Oid { get; }
        string Nome { get; set; }
        string ToString();
    }
}
