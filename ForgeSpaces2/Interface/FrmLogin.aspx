<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>

    <link rel="stylesheet" href="<%= ResolveUrl("~/Bootstrap/css/bootstrap.css") %>" />
    <script src="<%= ResolveUrl("~/Bootstrap/js/bootstrap.js") %>"></script>
</head>

<body>
    <form id="form1" runat="server">

        <div class="container-fluid py-5">
            <div class="d-flex align-items-center gap-5 px-5">
                <img src="<%= ResolveUrl("~/Images/logoForgeSpaces.png") %>" style="height: 150px;" />

                <h1 class="m-0">Acesse sua conta e encontre
                    <br />
                    o espaço ideal para você.
                </h1>
            </div>
        </div>

        <div class="container-fluid py-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-4">
                    <div class="card p-4 shadow"
                        style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">

                        <h4 class="text-center mb-4">Login</h4>

                        <div class="mb-3">
                            <label class="form-label">E-mail</label>
                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control"></asp:TextBox>

                            <asp:CustomValidator
                                ID="cvEmail" runat="server"
                                ControlToValidate="TxtEmail"
                                ErrorMessage="Campo obrigatório."
                                CssClass="text-danger"
                                OnServerValidate="cvEmail_ServerValidate"
                                ValidateEmptyText="true">
                            </asp:CustomValidator>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Senha</label>
                            <asp:TextBox ID="TxtSenha" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                            <asp:CustomValidator
                                ID="cvSenha" runat="server"
                                ControlToValidate="TxtSenha"
                                ErrorMessage="Campo obrigatório."
                                CssClass="text-danger"
                                OnServerValidate="cvSenha_ServerValidate"
                                ValidateEmptyText="true">                                
                            </asp:CustomValidator>
                        </div>

                        <div class="mb-3">
                            <asp:label id="lblMensagem" runat="server" class="form-label" Visible="false" ></asp:label>                           
                        </div>

                        <asp:Button runat="server" ID="btnLogin" class="btn w-100" OnClick="btnLogin_Click" autopostback="true"
                            Style="background: #180e82; color: white; border-radius: 10px;" Text="Entrar"></asp:Button>

                        <div class="text-center mt-2">
                            <span>Ainda não tem conta? </span>
                            <a href="FrmCriarConta.aspx" style="color: #180e82; font-weight: 600; text-decoration: none;">Criar conta</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
