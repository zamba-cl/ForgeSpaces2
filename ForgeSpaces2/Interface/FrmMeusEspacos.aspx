<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmMeusEspacos.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmMeusEspacos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="https://fonts.googleapis.com/css2?family=Handlee&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold" style="font-family: 'Handlee', cursive;">Meus Spaces</h2>

            <a href="FrmCriarEspaco.aspx" class="btn btn-primary"
                style="background-color: #180e82; border-color: #180e82;">+ Adicionar Espaço
            </a>
        </div>

        <div class="row" id="lista-espacos">

            <asp:Repeater ID="rptEspacos" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow" style="border-radius: 15px; overflow: hidden;">

                           <asp:Image runat="server" ImageUrl='<%# ResolveUrl(Eval("Caminho_Imagem").ToString()) %>' 
                               class="card-img-top" Style="height: 200px; object-fit: cover;" />
                            
                            <div class="card-body"
                                style="background: #e5e5e5; border-top: 2px solid #180e82;">

                                <h5 class="card-title fw-bold"><%# Eval("Nome") %></h5>

                                <a href='FrmAddDataDisponivel.aspx?id=<%# Eval("Id_Espaco") %>'
                                    class="btn btn-outline-primary w-100 mb-2"
                                    style="border-color: #180e82; color: #180e82;">Adicionar datas disponíveis
                                </a>

                                <button type="button"
                                    class="btn btn-danger w-100"
                                    onclick="abrirModalExcluir('<%# Eval("Id_Espaco") %>')">
                                    Excluir
                                </button>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:HiddenField ID="hfIdEspacoExcluir" runat="server" />

        </div>

    </div>

    <div class="modal fade" id="ModalExcluir" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 15px;">

                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Confirmar exclusão</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    Tem certeza que deseja excluir este espaço?
                <br>
                    <strong>Essa ação não pode ser desfeita.</strong>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        Cancelar
                    </button>

                    <asp:LinkButton ID="btnConfirmarExcluir" runat="server"
                        CssClass="btn btn-danger"
                        OnClick="ConfirmarExcluir_Click">
                    Excluir
                    </asp:LinkButton>
                </div>

            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">

    <script>
        function abrirModalExcluir(idEspaco) {
            document.getElementById('<%= hfIdEspacoExcluir.ClientID %>').value = idEspaco;

            var modal = new bootstrap.Modal(document.getElementById('ModalExcluir'));
            modal.show();
        }
    </script>


</asp:Content>
