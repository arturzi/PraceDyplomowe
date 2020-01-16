<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajPraceDyplomowa.aspx.cs" Inherits="PraceDyplomowe.DodajPraceDyplomowa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="DSPrace" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT * FROM [Praca_dyplomowa]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dodawanie nowej pracy dyplomowej"/>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Tytuł pracy"></asp:Label>
    <br />
    <asp:TextBox ID="TextTytul" runat="server" Width="532px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextTytul" ErrorMessage="Podaj tytuł pracy dyplomowej" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Poziom studiów"></asp:Label>
    <br />
    <asp:ListBox ID="ListPoziom" runat="server">
        <asp:ListItem Selected="True" Value="licencjat">Licencjat</asp:ListItem>
        <asp:ListItem Value="inżynierskie">Inżynierskie</asp:ListItem>
        <asp:ListItem Value="magisterskie">Magisterskie</asp:ListItem>
    </asp:ListBox>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Kierunek studiów"></asp:Label>
    <br />
    <asp:TextBox ID="TextKierunek" runat="server" Width="305px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextKierunek" ErrorMessage="Podaj kierunek studiów"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:SqlDataSource ID="DSPromotor" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select ID_pracownika, CONCAT(Stopien_naukowy, ' ', Imie, ' ', Nazwisko) as Opiekun
from Pracownik_naukowy
where Stopien_naukowy in ('Profesor', 'Doktor habilitowany', 'Doktor')
order by Nazwisko"></asp:SqlDataSource>
    <asp:Label ID="Label4" runat="server" Text="Opiekun pracy:"></asp:Label>
    <br />
    <asp:ListBox ID="ListPromotor" runat="server" DataSourceID="DSPromotor" DataTextField="Opiekun" DataValueField="ID_pracownika" Height="259px" Width="279px"></asp:ListBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ListPromotor" ErrorMessage="Wybierz opiekuna pracy"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Słowa kluczowe"></asp:Label>
    <br />
    <asp:SqlDataSource ID="DSSlowaKluczowe" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT * FROM [Slowo_kluczowe] ORDER BY [Nazwa]"></asp:SqlDataSource>
    <asp:ListBox ID="ListSlowaKluczowe" runat="server" DataSourceID="DSSlowaKluczowe" DataTextField="Nazwa" DataValueField="ID_slowa" Height="201px" SelectionMode="Multiple" Width="262px"></asp:ListBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Wybierz słowa kluczowe" ControlToValidate="ListSlowaKluczowe"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="BtZapisz" runat="server" Text="Zapisz" OnClick="BtZapisz_Click"/>

</asp:Content>
