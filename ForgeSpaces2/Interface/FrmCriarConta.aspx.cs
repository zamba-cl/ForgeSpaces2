using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;
using ForgeSpaces2.Models;
using ForgeSpaces2.Transacao;

namespace ForgeSpaces2.Interface
{
    public partial class FrmCriarConta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCriarConta_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Hashtable htParametros = new Hashtable();
                htParametros.Add("@Nome", TxtNome.Text.Trim());
                htParametros.Add("@Telefone", Util.RemoverMascara(TxtTelefone.Text));
                htParametros.Add("@Email", TxtEmail.Text.Trim());
                string senhaHash = BCrypt.Net.BCrypt.HashPassword(TxtSenha.Text);
                htParametros.Add("@Senha", senhaHash);

                int idUsuario = UsuarioTransacao.IncluirUsuario(htParametros);

                UsuarioModel usuario = new UsuarioModel
                {
                    IdUsuario = idUsuario,
                    Nome = TxtNome.Text.Trim(),
                    Telefone = TxtTelefone.Text.Trim(),
                    Email = TxtEmail.Text.Trim(),
                    Senha = TxtSenha.Text.Trim(),

                };

                Session["Usuario"] = usuario;

                Response.Redirect("FrmInicio.aspx");


            }

        }
        protected void cvNome_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string nome = TxtNome.Text.Trim();
            if (string.IsNullOrEmpty(nome))
                args.IsValid = false;
        }

        protected void cvTelefone_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string telefone = TxtTelefone.Text.Trim();
            if (!System.Text.RegularExpressions.Regex.IsMatch(telefone, @"^\d{10,11}$"))
                args.IsValid = false;
        }

        protected void cvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = TxtEmail.Text.Trim();

            if (!System.Text.RegularExpressions.Regex.IsMatch(email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
                args.IsValid = false;
        }

        protected void cvSenha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string senha = TxtSenha.Text.Trim();

            if (senha.Length < 6)
                args.IsValid = false;

        }



    }

}