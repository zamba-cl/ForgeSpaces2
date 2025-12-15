<%@ Page Title="Criar Espaço" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCriarEspaco.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmCriarEspaco" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-5">
        <div class="d-flex align-items-center gap-5 px-5">
            <img src="<%= ResolveUrl("~/Images/logoForgeSpaces.png") %>" style="height: 150px;" />

            <h1 class="m-0">Cadastre um novo espaço para locação
                <br />
                e conecte pessoas às melhores experiências.
            </h1>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 shadow"
                    style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">

                    <h4 class="text-center mb-4">Cadastro de Espaço</h4>


                    <div class="mb-3">
                        <label class="form-label">Nome do Espaço</label>
                        <asp:TextBox ID="TxtNome" runat="server" CssClass="form-control"></asp:TextBox>

                        <asp:CustomValidator
                            ID="cvNome" runat="server"
                            ControlToValidate="TxtNome"
                            ErrorMessage="Campo obrigatório."
                            CssClass="text-danger"
                            OnServerValidate="cvNome_ServerValidate"
                            ValidateEmptyText="true">
                        </asp:CustomValidator>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Endereço</label>
                        <asp:TextBox ID="TxtEndereco" runat="server" CssClass="form-control"></asp:TextBox>

                        <asp:CustomValidator
                            ID="cvEndereco" runat="server"
                            ControlToValidate="TxtEndereco"
                            ErrorMessage="Campo obrigatório."
                            CssClass="text-danger"
                            OnServerValidate="cvEndereco_ServerValidate"
                            ValidateEmptyText="true">
                        </asp:CustomValidator>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Capacidade (pessoas)</label>
                        <asp:TextBox ID="TxtCapacidade" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                        <asp:CustomValidator
                            ID="cvCapacidade" runat="server"
                            ControlToValidate="TxtCapacidade"
                            ErrorMessage="Valor inválido."
                            CssClass="text-danger"
                            OnServerValidate="cvCapacidade_ServerValidate"
                            ValidateEmptyText="true">
                        </asp:CustomValidator>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Valor por hora (R$)</label>
                        <asp:TextBox ID="TxtPrecoHora" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>

                        <asp:CustomValidator
                            ID="cvPrecoHora" runat="server"
                            ControlToValidate="TxtPrecoHora"
                            ErrorMessage="Valor inválido."
                            CssClass="text-danger"
                            OnServerValidate="cvPrecoHora_ServerValidate"
                            ValidateEmptyText="true">
                        </asp:CustomValidator>

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Foto do Espaço</label>
                        <asp:FileUpload ID="ImagemEspaco" runat="server" CssClass="form-control" />

                        <asp:CustomValidator
                            ID="cvImagemEspaco" runat="server"
                            ControlToValidate="ImagemEspaco"
                            ErrorMessage="Campo obrigatório."
                            CssClass="text-danger"
                            OnServerValidate="cvImagemEspaco_ServerValidate"
                            ValidateEmptyText="true">
                        </asp:CustomValidator>

                    </div>

                    <asp:Button ID="btnCadastrarEspaco" runat="server" autopostback="true" Text="Cadastrar Espaço" 
                        CssClass="btn w-100" Style="background: #180e82; color: white; border-radius: 10px;"
                        OnClick="btnCadastrarEspaco_Click"></asp:Button>


                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
