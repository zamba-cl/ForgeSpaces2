using ForgeSpaces2.Models;
using ForgeSpaces2.Transacao;
using System;
using System.Collections;
using System.Data;

namespace ForgeSpaces2.Interface
{
    public partial class FrmMinhasReservas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("FrmLogin.aspx");
            }
            else
            {
                PreencherReservas();
            }
        }

        protected void ConfirmarCancelar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(hfIdReservaCancelar.Value);
            ReservaTransacao.CancelarReserva(id.ToString());
            PreencherReservas();
        }

        private void PreencherReservas()
        {
            UsuarioModel usuario = (UsuarioModel)Session["Usuario"];
            DataTable dttReserva = ReservaTransacao.ObterReservasUsuario(usuario.IdUsuario.ToString());
            rptReservas.DataSource = dttReserva;
            rptReservas.DataBind();

        }
    }
}