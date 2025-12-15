<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmInicio.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmInicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


<div class="container-fluid py-5">
    <div class="d-flex align-items-center gap-5 px-5">
        <img src="<%= ResolveUrl("~/Images/logoForgeSpaces.png") %>" style="height:200px;" />

        <h1 class="m-0">
            Encontre o espaço certo para fazer <br>
            o extraordinário acontecer.
        </h1>
    </div>
</div>
<div class="container-fluid py-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-4">
            <div class="card p-4 shadow" style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">
                <h4>Como funciona?</h4>
                <ul>
                    <li>Escolha um espaço.</li>
                    <li>Verifique a disponibilidade.</li>
                    <li>Faça sua reserva.</li>
                </ul>
            </div>
        </div>

        <div class="col-md-1"></div>

        <div class="col-md-4">
            <div class="card p-4 shadow" style="background: #e5e5e5; border: 2px solid #180e82; border-radius: 15px;">
                <h4>Sobre nós</h4>
                <p>
                    Somos uma plataforma dedicada a conectar pessoas aos melhores espaços para criar,
                    inovar e tornar projetos reais.
                </p>
            </div>
        </div>

    </div>
</div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
