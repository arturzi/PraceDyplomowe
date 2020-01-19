<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajOcenePromotora.aspx.cs" Inherits="PraceDyplomowe.DodajOcenePromotora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dodaj ocenę promotora pracy dyplomowej"/>
    <asp:SqlDataSource ID="DSPrace" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT * FROM [Praca_dyplomowa]"></asp:SqlDataSource>
    <br /><br />
    <asp:Label ID="Label3" runat="server" Text="Ocena promotora:"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioOcena" ErrorMessage="Proszę wybrać ocenę."></asp:RequiredFieldValidator>
    <br />
    <asp:RadioButtonList ID="RadioOcena" runat="server" Height="119px" Width="101px">
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
        </asp:RadioButtonList>
    <asp:Label ID="Label2" runat="server" Text="Komentarz promotora:"></asp:Label>
    <br />
    <asp:TextBox ID="TxtKomentarz" runat="server" Height="135px" Width="368px" TextMode="MultiLine"></asp:TextBox>
    <br /><br />
    <asp:Button ID="BtZapisz" runat="server" Text="Zapisz" OnClick="BtZapisz_Click" />
</asp:Content>
