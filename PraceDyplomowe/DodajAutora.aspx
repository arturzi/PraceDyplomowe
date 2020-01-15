<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajAutora.aspx.cs" Inherits="PraceDyplomowe.DodajAutora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dodaj autora do pracy dyplomowej"/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT * FROM [Student] ORDER BY [Nazwisko]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_studenta" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Wybierz" />
            <asp:BoundField DataField="ID_studenta" HeaderText="ID_studenta" InsertVisible="False" ReadOnly="True" SortExpression="ID_studenta" />
            <asp:BoundField DataField="Numer_indeksu" HeaderText="Numer_indeksu" SortExpression="Numer_indeksu" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
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
    <br /><br />
    <asp:Label ID="Label1" runat="server" Text="Wybierz studenta aby dodać go jako autora pracy"></asp:Label>
</asp:Content>
