<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Raport1.aspx.cs" Inherits="PraceDyplomowe.Raport1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Lista prac dyplomowych recenzowanych przez <br>wybranego pracownika uczelni"/>
    <br /><br />
    <asp:Label runat="server">Wybierz pracownika uczelni:</asp:Label>
    <br />
    <asp:SqlDataSource ID="DSPracownicy" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select ID_pracownika, CONCAT(Pracownik_naukowy.Stopien_naukowy, ' ', Pracownik_naukowy.Imie, ' ', Pracownik_naukowy.Nazwisko) as Pracownik
from Pracownik_naukowy order by Nazwisko"></asp:SqlDataSource>
    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="DSPracownicy" DataTextField="Pracownik" DataValueField="ID_pracownika" Height="185px" Width="455px"></asp:ListBox>
    <asp:SqlDataSource ID="DSPrace" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT        Praca_dyplomowa.Temat_pracy, Praca_dyplomowa.Poziom_studiow, Praca_dyplomowa.Kierunek_studiow
FROM            Praca_dyplomowa INNER JOIN
                         Recenzenci ON Praca_dyplomowa.ID_pracy = Recenzenci.ID_pracy
WHERE        (Recenzenci.ID_pracownika = @ID_pracownika)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListBox1" Name="ID_pracownika" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSPrace" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Temat_pracy" HeaderText="Temat pracy" SortExpression="Temat_pracy" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Poziom_studiow" HeaderText="Poziom studiów" SortExpression="Poziom_studiow" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Kierunek_studiow" HeaderText="Kierunek studiów" SortExpression="Kierunek_studiow" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
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
</asp:Content>
