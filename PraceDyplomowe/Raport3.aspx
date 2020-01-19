<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Raport3.aspx.cs" Inherits="PraceDyplomowe.Raport3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Lista prac dyplomowych na danym poziomie studiów"/>
    <br /><br />
    <asp:Label runat="server">Wybierz poziom studiów:</asp:Label>
    <br />
    <asp:ListBox ID="ListPoziom" runat="server" AutoPostBack="True">
        <asp:ListItem Selected="True" Value="licencjat">Licencjat</asp:ListItem>
        <asp:ListItem Value="inżynierskie">Inżynierskie</asp:ListItem>
        <asp:ListItem Value="magisterskie">Magisterskie</asp:ListItem>
    </asp:ListBox>
    <br />
    <br />
    <asp:SqlDataSource ID="DSPrace" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT        Temat_pracy, Kierunek_studiow
FROM            Praca_dyplomowa
WHERE        (Poziom_studiow = @Poziom)
ORDER BY Temat_pracy">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListPoziom" Name="Poziom" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSPrace" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Temat_pracy" HeaderText="Temat pracy" SortExpression="Temat_pracy" >
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
