<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajRecenzenta.aspx.cs" Inherits="PraceDyplomowe.DodajRecenzenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dodaj recenzenta pracy dyplomowej"/>
    <asp:SqlDataSource ID="DSPracownicy" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT * FROM [Pracownik_naukowy] ORDER BY [Nazwisko]"></asp:SqlDataSource>
    <asp:GridView ID="GVPracownicy" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_pracownika" DataSourceID="DSPracownicy" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GVPracownicy_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="Wybierz" ShowSelectButton="True" />
            <asp:BoundField DataField="ID_pracownika" HeaderText="ID_pracownika" InsertVisible="False" ReadOnly="True" SortExpression="ID_pracownika" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
            <asp:BoundField DataField="Stopien_naukowy" HeaderText="Stopien_naukowy" SortExpression="Stopien_naukowy" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

    <asp:Label ID="Label1" runat="server" Text="Wybierz pracownika aby dodać go jako recenzenta pracy."></asp:Label>

</asp:Content>
