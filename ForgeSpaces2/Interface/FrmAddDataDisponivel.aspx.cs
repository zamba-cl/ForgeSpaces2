using ForgeSpaces2.Transacao;
using System;
using System.Collections;
using System.Web.UI.WebControls;

namespace ForgeSpaces2.Interface
{
    public partial class FrmDataDisponivel : System.Web.UI.Page
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
                    TxtDataDisponivel.Attributes["min"] =
                        DateTime.Today.ToString("yyyy-MM-dd");
                }
            }
        }
       
        protected void btnCadastrarData_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Hashtable htParametros = new Hashtable();
                htParametros.Add("@Data_Reserva", TxtDataDisponivel.Text);
                string id = Request.QueryString["id"];
                htParametros.Add("@Id_Espaco", id);
                htParametros.Add("@Id_Usuario", DBNull.Value);

                ReservaTransacao.IncluirReserva(htParametros);
            }
        }

        protected void cvData_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime data;

            if (!DateTime.TryParse(TxtDataDisponivel.Text, out data))
            {
                args.IsValid = false;
                return;
            }
        }
    }
}