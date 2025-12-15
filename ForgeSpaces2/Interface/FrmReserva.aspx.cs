using ForgeSpaces2.Models;
using ForgeSpaces2.Transacao;
using System;
using System.Collections;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ForgeSpaces2.Interface
{
    public partial class FrmReserva : System.Web.UI.Page
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
                    PreencherDatas();
                }
            }
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Hashtable htParametros = new Hashtable();
                htParametros.Add("@Data_Reserva", ddlDatas.SelectedValue);
                UsuarioModel usuario = (UsuarioModel)Session["Usuario"];
                htParametros.Add("@Id_Usuario", usuario.IdUsuario);

                ReservaTransacao.EfetuarReserva(htParametros);

                PreencherDatas();

            }
        }

        private void PreencherDatas()
        {
            string id = Request.QueryString["id"];
            DataTable dttReserva = ReservaTransacao.ObterDatasReserva(id);
            ddlDatas.DataSource = dttReserva;
            ddlDatas.DataTextField = "Data_Reserva"; 
            ddlDatas.DataValueField = "Id_Reserva";   
            ddlDatas.DataBind();

            ddlDatas.Items.Insert(0, new ListItem("Selecione uma data", "0"));
            ddlDatas.SelectedIndex = 0;
        }

        protected void cvDatas_ServerValidate(object source, ServerValidateEventArgs args)
        {
           string data = ddlDatas.SelectedValue;

            if (data.Equals("0"))
                args.IsValid = false;
        }
    }
}