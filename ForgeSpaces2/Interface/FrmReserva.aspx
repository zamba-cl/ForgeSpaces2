<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmReserva.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmReserva" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-5">
        <div class="d-flex align-items-center gap-5 px-5">
            <img src="<%= ResolveUrl("~/Images/logoForgeSpaces.png") %>" style="height: 150px;" />

            <h1 class="m-0">Reserve o espaço ideal<br />
                para o seu evento.
            </h1>
        </div>
    </div>

    <div class="container-fluid py-5">
        <div class="row d-flex justify-content-center">
            <div class="col-md-6">

                <div class="card p-4 shadow"
                    style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">

                    <h4 class="text-center mb-4">Cadastro de Reserva</h4>

                    <div class="text-center mb-3">
                        <asp:Image ID="ImgEspaco" runat="server"
                            CssClass="img-fluid rounded"
                            Style="max-height: 250px;" />
                    </div>

                    <div class="mb-3 text-center">
                        <asp:Label ID="LblNomeEspaco" runat="server"
                            CssClass="fw-bold fs-5"></asp:Label>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Datas disponíveis</label>

                        <asp:DropDownList ID="ddlDatas" runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>

                        <asp:CustomValidator
                            ID="cvDatas"
                            runat="server"
                            ControlToValidate="ddlDatas"
                            ErrorMessage="Campo obrigatório."
                            CssClass="text-danger"
                            ValidateEmptyText="true"
                            OnServerValidate="cvDatas_ServerValidate">
                        </asp:CustomValidator>
                    </div>

                    <asp:Button ID="btnReservar" runat="server"
                        Text="Confirmar Reserva"
                        CssClass="btn w-100"
                        Style="background: #180e82; color: white; border-radius: 10px;"
                        OnClick="btnReservar_Click"
                        CausesValidation="true" />

                </div>

            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">


</asp:Content>
