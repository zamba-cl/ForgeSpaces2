using ForgeSpaces2.Transacao;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using ForgeSpaces2.Models;

namespace ForgeSpaces2.Interface
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DataTable dttUsuario = UsuarioTransacao.ObterDadosUsuario(TxtEmail.Text);
                if (dttUsuario.Rows.Count > 0)
                {
                    string senha = TxtSenha.Text.Trim();
                    string senhaHash = dttUsuario.Rows[0]["Senha"].ToString();

                    bool senhaValida = BCrypt.Net.BCrypt.Verify(senha, senhaHash);

                    if (senhaValida)
                    {
                        UsuarioModel usuario = Util.ConverterDataTableParaUsuario(dttUsuario);
                        Session["Usuario"] = usuario;
                        Response.Redirect("FrmInicio.aspx");
                    }
                    else
                    {
                        lblMensagem.Text = "Senha inválida.";
                        lblMensagem.Visible = true;
                    }
                }
                else
                {
                    lblMensagem.Text = "Usuário inválido.";
                    lblMensagem.Visible = true;
                }

            }
        }

        protected void cvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = TxtEmail.Text.Trim();

            args.IsValid = !string.IsNullOrEmpty(email);
        }

        protected void cvSenha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string senha = TxtSenha.Text.Trim();

            args.IsValid = !string.IsNullOrEmpty(senha);
        }
    }
}