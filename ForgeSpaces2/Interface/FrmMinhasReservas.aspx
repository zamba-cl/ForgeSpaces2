<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmMinhasReservas.aspx.cs" Inherits="ForgeSpaces2.Interface.FrmMinhasReservas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container-fluid py-4">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold" style="font-family: 'Handlee', cursive;">Minhas Reservas
            </h2>
        </div>

        <div class="row">

            <asp:Repeater ID="rptReservas" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card shadow" style="border-radius: 15px; overflow: hidden;">

                            <asp:Image runat="server" ImageUrl='<%# ResolveUrl(Eval("Caminho_Imagem").ToString()) %>' 
                                 class="card-img-top" Style="height: 200px; object-fit: cover;" />

                            <div class="card-body"
                                style="background: #e5e5e5; border-top: 2px solid #180e82;">

                                <h5 class="fw-bold">
                                    <%# Eval("Nome") %>
                                </h5>

                                <p class="mb-3">
                                    📅 Reserva em:
                                    <strong>
                                        <%# Convert.ToDateTime(Eval("Data_Reserva")).ToString("dd/MM/yyyy") %>
                                    </strong>
                                </p>

                                <button type="button"
                                    class="btn btn-danger w-100"
                                    onclick="abrirModalCancelar('<%# Eval("Id_Reserva") %>')">
                                    Cancelar reserva
                                </button>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

    </div>

    <div class="modal fade" id="ModalCancelar" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 15px;">

                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Cancelar reserva</h5>
                    <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal">
                    </button>
                </div>

                <div class="modal-body">
                    Tem certeza que deseja cancelar esta reserva?
                    <br />
                    <strong>Essa ação não pode ser desfeita.</strong>
                </div>

                <div class="modal-footer">
                    <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">
                        Voltar
                    </button>

                    <asp:LinkButton
                        ID="btnConfirmarCancelar"
                        runat="server"
                        CssClass="btn btn-danger"
                        OnClick="ConfirmarCancelar_Click">
                        Cancelar reserva
                    </asp:LinkButton>
                </div>

            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfIdReservaCancelar" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">

    <script>
        function abrirModalCancelar(idReserva) {
            document.getElementById('<%= hfIdReservaCancelar.ClientID %>').value = idReserva;

            var modal = new bootstrap.Modal(
                document.getElementById('ModalCancelar')
            );
            modal.show();
        }
    </script>
</asp:Content>
