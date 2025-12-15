<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmAddDataDisponivel.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmDataDisponivel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container-fluid py-5">
        <div class="d-flex align-items-center gap-5 px-5">
            <img src="<%= ResolveUrl("~/Images/logoForgeSpaces.png") %>" style="height: 150px;" />

            <h1 class="m-0">
                Adicione datas disponíveis
                <br />
                para reserva do espaço.
            </h1>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow"
                    style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">

                    <h4 class="text-center mb-4">Cadastro de Datas</h4>

                    <div class="mb-3">
                        <label class="form-label">Data disponível</label>

                        <asp:TextBox ID="TxtDataDisponivel"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Date">
                        </asp:TextBox>

                        <asp:CustomValidator
                            ID="cvData"
                            runat="server"
                            ControlToValidate="TxtDataDisponivel"
                            ErrorMessage="Campo obrigatório."
                            CssClass="text-danger"
                            ValidateEmptyText="true"
                            OnServerValidate="cvData_ServerValidate">
                        </asp:CustomValidator>
                    </div>

                    <asp:Button ID="btnCadastrarData"
                        runat="server"
                        Text="Cadastrar Data"
                        CssClass="btn w-100"
                        Style="background: #180e82; color: white; border-radius: 10px;"
                        OnClick="btnCadastrarData_Click">
                    </asp:Button>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
