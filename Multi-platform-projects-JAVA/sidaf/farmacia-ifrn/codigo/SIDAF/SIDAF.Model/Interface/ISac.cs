using System;
namespace SIDAF.Model
{
    interface ISac
    {
        string Assunto { get; set; }
        string Email { get; set; }
        string Mensagem { get; set; }
        string Nome { get; set; }
        int? Oid { get; set; }
        string Telefone { get; set; }
        string ToString();
    }
}
