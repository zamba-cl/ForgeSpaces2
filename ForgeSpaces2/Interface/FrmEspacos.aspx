<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmEspacos.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmEspacos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold" style="font-family: 'Handlee', cursive;">Spaces</h2>

            <a href="FrmCriarEspaco.aspx" class="btn btn-primary"
                style="background-color: #180e82; border-color: #180e82;">+ Adicionar Espaço
            </a>
        </div>
    </div>

       <div class="row">
        <asp:Repeater ID="rptEspacos" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card shadow" style="border-radius: 15px; overflow: hidden;">

                        <asp:Image runat="server"
                            ImageUrl='<%# ResolveUrl(Eval("Caminho_Imagem").ToString()) %>' class="card-img-top"
                            Style="height: 200px; object-fit: cover;" />


                        <div class="card-body" style="background: #e5e5e5; border-top: 2px solid #180e82;">

                            <h5 class="card-title fw-bold">
                                <%# Eval("Nome") %>
                            </h5>

                            <p class="m-0">
                                📍 <%# Eval("Endereco") %>
                            </p>

                            <p class="m-0">
                                Capacidade para: <%# Eval("Capacidade") %> pessoas.
                            </p>

                            <p class="fw-bold mt-2" style="color: #180e82;">
                                R$ <%# Eval("Valor", "{0:N2}") %> / hora
                            </p>

                            <a href='FrmReserva.aspx?id=<%# Eval("Id_Espaco") %>'
                                class="btn btn-outline-primary w-100"
                                style="border-color: #180e82; color: #180e82;">Realizar Reserva
                            </a>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
