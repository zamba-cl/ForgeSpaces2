using ForgeSpaces2.Models;
using ForgeSpaces2.Transacao;
using System;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ForgeSpaces2.Interface
{
    public partial class FrmCriarEspaco : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCadastrarEspaco_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Hashtable htParametros = new Hashtable();
                htParametros.Add("@Nome", TxtNome.Text.Trim());
                htParametros.Add("@Endereco", TxtEndereco.Text.Trim());
                htParametros.Add("@Capacidade", TxtCapacidade.Text.Trim());
                htParametros.Add("@Valor", TxtPrecoHora.Text.Trim());


                string caminhoBanco = SalvarImagem();
                htParametros.Add("@Imagem", caminhoBanco);

                UsuarioModel usuario = (UsuarioModel)Session["Usuario"];
                htParametros.Add("@Id_Usuario", usuario.IdUsuario);


                EspacoTransacao.IncluirEspaco(htParametros);

                Response.Redirect("FrmEspacos.aspx");


            }



        }

        #region SalvarImagem
        public string SalvarImagem()
        {
            string caminhoRelativo = ConfigurationManager.AppSettings["CaminhoImagensEspacos"];
            string caminhoFisico = Server.MapPath(caminhoRelativo);

            if (!Directory.Exists(caminhoFisico))
                Directory.CreateDirectory(caminhoFisico);

            string extensao = Path.GetExtension(ImagemEspaco.FileName);
            string nomeArquivo = Guid.NewGuid().ToString() + extensao;

            string caminhoCompletoFisico =
                Path.Combine(caminhoFisico, nomeArquivo);

            ImagemEspaco.SaveAs(caminhoCompletoFisico);

            return caminhoRelativo + nomeArquivo;
        }
        #endregion

        #region CustomValidator
        protected void cvNome_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string nome = TxtNome.Text.Trim();

            if (string.IsNullOrEmpty(nome))
                args.IsValid = false;
        }

        protected void cvEndereco_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string endereco = TxtEndereco.Text.Trim();

            if (string.IsNullOrEmpty(endereco))
                args.IsValid = false;
        }

        protected void cvCapacidade_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string capacidadeTexto = TxtCapacidade.Text.Trim();

            if (string.IsNullOrEmpty(capacidadeTexto))
            {
                args.IsValid = false;
                return;
            }

            int capacidade = Convert.ToInt32(capacidadeTexto);

            if (capacidade <= 0)
                args.IsValid = false;
        }

        protected void cvPrecoHora_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string precoTexto = TxtPrecoHora.Text.Trim();

            if (string.IsNullOrEmpty(precoTexto))
            {
                args.IsValid = false;
                return;
            }

            decimal preco = Convert.ToDecimal(precoTexto);

            if (preco <= 0)
                args.IsValid = false;
        }

        protected void cvImagemEspaco_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!ImagemEspaco.HasFile)
                args.IsValid = false;
        }
        #endregion

    }
}


