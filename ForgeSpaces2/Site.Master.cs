using ForgeSpaces2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ForgeSpaces2
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UsuarioModel usuario = Session["Usuario"] as UsuarioModel;

                if (usuario != null)
                {
                    lblNomeUsuario.Text = usuario.Nome;
                    lblEmailUsuario.Text = usuario.Email;
                }
                else
                {
                    Response.Redirect("FrmLogin.aspx");
                }
            }
        }
    }
}