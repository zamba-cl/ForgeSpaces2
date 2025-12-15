using ForgeSpaces2.Transacao;
using System;
using System.Data;


namespace ForgeSpaces2.Interface
{
    public partial class FrmEspacos : System.Web.UI.Page
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
                    PreencherDadosEspacos(); 
                }
            }
        }

        private void PreencherDadosEspacos()
        {
            DataTable dttEspacos = EspacoTransacao.ObterDadosEspaco();
            rptEspacos.DataSource = dttEspacos;
            rptEspacos.DataBind();
        }

    }
}