using ForgeSpaces2.Models;
using ForgeSpaces2.Transacao;
using System;
using System.Data;

namespace ForgeSpaces2.Interface
{
    public partial class FrmMeusEspacos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("FrmLogin.aspx");
                }
                else
                {
                    PreencherEspacos();
                }
            }
        }

        private void PreencherEspacos()
        {
            UsuarioModel usuario = (UsuarioModel) Session["Usuario"];
            DataTable dttEspacos = EspacoTransacao.ObterDadosEspacoUsuario(usuario.IdUsuario.ToString());
            rptEspacos.DataSource = dttEspacos;
            rptEspacos.DataBind();
        }

        protected void ConfirmarExcluir_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hfIdEspacoExcluir.Value);
            EspacoTransacao.ExcluirEspaco(id);

            PreencherEspacos();
        }

        
    }
}
