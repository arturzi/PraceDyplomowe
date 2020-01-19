<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Raporty.aspx.cs" Inherits="PraceDyplomowe.Raporty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Dostępne raporty:"/>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Raport1.aspx">Lista prac dyplomowych recenzowanych przez wybranego pracownika uczelni</asp:HyperLink>
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Raport2.aspx">Lista prac dyplomowych obronionych w danym dniu</asp:HyperLink>
    <br />
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Raport3.aspx">Lista prac dyplomowych na danym poziomie studiów</asp:HyperLink>
    <br />
</asp:Content>
