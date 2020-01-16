<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajEgzamin.aspx.cs" Inherits="PraceDyplomowe.DodajEgzamin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dodaj wyniki egzaminu dyplomowego"/>
    <br /><br />
    <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Bieżące oceny autorów:"/>
    <br />
    <asp:SqlDataSource ID="DSAutor" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT dbo.Student.Nazwisko, dbo.Student.Imie, dbo.Student.Numer_indeksu, dbo.Autor.Data_obrony, dbo.Autor.Ocena_ostateczna, dbo.Autor.Nadany_stopien, dbo.Autor.ID_pracy, Autor.ID_studenta,
CONCAT(Imie, ' ', Nazwisko, ' ', Numer_indeksu) as 'Autor'
FROM dbo.Autor INNER JOIN dbo.Student ON dbo.Autor.ID_studenta = dbo.Student.ID_studenta 
WHERE (dbo.Autor.ID_pracy = @ID_pracy) 
ORDER BY dbo.Student.Nazwisko">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID_pracy" QueryStringField="ID_pracy" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GVAutor" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_pracy,ID_studenta" DataSourceID="DSAutor" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Numer_indeksu" HeaderText="Numer_indeksu" SortExpression="Numer_indeksu" />
            <asp:BoundField DataField="Data_obrony" HeaderText="Data_obrony" SortExpression="Data_obrony" />
            <asp:BoundField DataField="Ocena_ostateczna" HeaderText="Ocena_ostateczna" SortExpression="Ocena_ostateczna" />
            <asp:BoundField DataField="Nadany_stopien" HeaderText="Nadany_stopien" SortExpression="Nadany_stopien" />
            <asp:BoundField DataField="ID_pracy" HeaderText="ID_pracy" ReadOnly="True" SortExpression="ID_pracy" Visible="False" />
            <asp:BoundField DataField="ID_studenta" HeaderText="ID_studenta" ReadOnly="True" SortExpression="ID_studenta" Visible="False" />
            <asp:BoundField DataField="Autor" HeaderText="Autor" ReadOnly="True" SortExpression="Autor" Visible="False" />
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
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Wybierz autora:"/>
    <br />
    <asp:ListBox ID="ListAutor" runat="server" DataSourceID="DSAutor" DataTextField="Autor" DataValueField="ID_studenta"></asp:ListBox>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Oceń autora:"/>
       <asp:RadioButtonList ID="RadioOcena" runat="server" Height="119px" Width="101px">
           <asp:ListItem>2</asp:ListItem>
           <asp:ListItem>3</asp:ListItem>
           <asp:ListItem>4</asp:ListItem>
           <asp:ListItem>5</asp:ListItem>
           <asp:ListItem>6</asp:ListItem>
       </asp:RadioButtonList>
    <asp:Label ID="Label4" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Data obrony:"/>
    <asp:Calendar ID="Kalendarz" runat="server"></asp:Calendar>
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Nadany stopień:"/>
    <br />
    <asp:ListBox ID="ListStopien" runat="server">
        <asp:ListItem Selected="True"></asp:ListItem>
        <asp:ListItem>inżynier</asp:ListItem>
        <asp:ListItem>magister</asp:ListItem>
    </asp:ListBox>
    <br /><br />
    <asp:Button ID="BtZapisz" runat="server" Text="Zapisz" OnClick="BtZapisz_Click"/>
   

</asp:Content>
