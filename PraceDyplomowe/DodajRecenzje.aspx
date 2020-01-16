<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajRecenzje.aspx.cs" Inherits="PraceDyplomowe.DodajRecenzje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Wykonaj recenzję pracy dyplomowej"/>
    <asp:SqlDataSource ID="DSRecenzje" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT dbo.Pracownik_naukowy.*, dbo.Recenzenci.*, CONCAT(Pracownik_naukowy.Stopien_naukowy, ' ', Pracownik_naukowy.Imie, ' ', Pracownik_naukowy.Nazwisko) as Recenzent
FROM dbo.Recenzenci INNER JOIN dbo.Pracownik_naukowy ON dbo.Recenzenci.ID_pracownika = dbo.Pracownik_naukowy.ID_pracownika 
WHERE (dbo.Recenzenci.ID_pracy = @ID_pracy)
">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID_pracy" QueryStringField="ID_pracy" />
        </SelectParameters>
        </asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="Wybierz recenzenta:"></asp:Label>
    <br />
    <asp:DropDownList ID="DDLRecenzent" runat="server" DataSourceID="DSRecenzje" DataTextField="Recenzent" DataValueField="ID_pracownika"></asp:DropDownList>
    <br /><br />
    <asp:Label ID="Label3" runat="server" Text="Ocena recenzenta:"></asp:Label>
    <br />
    <asp:RadioButtonList ID="RadioOcena" runat="server" Height="119px" Width="101px">
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:RadioButtonList>
    <asp:Label ID="Label2" runat="server" Text="Komentarz recenzenta:"></asp:Label>
    <br />
    <asp:TextBox ID="TxtKomentarz" runat="server" Height="135px" Width="368px" TextMode="MultiLine"></asp:TextBox>
    <br /><br />
    <asp:Button ID="BtZapisz" runat="server" Text="Zapisz" OnClick="Button1_Click" />
</asp:Content>
