<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPracDyplomowych.aspx.cs" Inherits="PraceDyplomowe.ListaPracDyplomowych" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Lista prac dyplomowych"/>
            <br />
    Wyszukiwanie prac dyplomowych:<br />
    <tr>
        <td>
            Tytuł pracy:
        </td>
        <td>
            <asp:TextBox ID="TBTytul" runat="server" AutoPostBack="True"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Poziom studiów::
        </td>
        <td>
            <asp:TextBox ID="TBPoziom" runat="server" AutoPostBack="True"></asp:TextBox>
        </td>
    </tr>

    <asp:SqlDataSource ID="PraceDyplomoweDS" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT [Poziom_studiow], [Temat_pracy], [Kierunek_studiow], [ID_pracy] FROM [Praca_dyplomowa] WHERE (([Poziom_studiow] LIKE '%' + @Poziom_studiow + '%') AND ([Temat_pracy] LIKE '%' + @Temat_pracy + '%')) ORDER BY [Poziom_studiow], [Temat_pracy]">
        <SelectParameters>
            <asp:ControlParameter ControlID="TBPoziom" Name="Poziom_studiow" PropertyName="Text" Type="String" DefaultValue="%" />
            <asp:ControlParameter ControlID="TBTytul" DefaultValue="%" Name="Temat_pracy" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<br /><br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="PraceDyplomoweDS">
                <AlternatingItemTemplate>
                    <tr style="background-color:white;color:#284775">
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/SzczegolyPracyDyplomowej.aspx?ID_pracy="+Eval("ID_pracy") %>'>-></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Poziom_studiowLabel" runat="server" Text='<%# Eval("Poziom_studiow") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Temat_pracyLabel" runat="server" Text='<%# Eval("Temat_pracy") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Kierunek_studiowLabel" runat="server" Text='<%# Eval("Kierunek_studiow") %>' />
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/DodajAutora.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "~/DodajRecenzenta.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl='<%# "~/DodajRecenzje.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl='<%# "~/DodajOcenePromotora.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl='<%# "~/DodajEgzamin.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="background-color:#F7F6F3;color: 333333;">
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/SzczegolyPracyDyplomowej.aspx?ID_pracy="+Eval("ID_pracy") %>'>-></asp:HyperLink>
                        </td>
                        <td>
                            <asp:Label ID="Poziom_studiowLabel" runat="server" Text='<%# Eval("Poziom_studiow") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Temat_pracyLabel" runat="server" Text='<%# Eval("Temat_pracy") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Kierunek_studiowLabel" runat="server" Text='<%# Eval("Kierunek_studiow") %>' />
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "~/DodajAutora.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# "~/DodajRecenzenta.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl='<%# "~/DodajRecenzje.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl='<%# "~/DodajOcenePromotora.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                        <td style="text-align:center">
                            <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl='<%# "~/DodajEgzamin.aspx?ID_pracy="+Eval("ID_pracy") %>'>+</asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#5D7B9D;color: white;">
                                        <th runat="server">Szczegóły pracy</th>
                                        <th runat="server">Poziom studiów</th>
                                        <th runat="server">Temat pracy</th>
                                        <th runat="server">Kierunek studiów</th>
                                        <th runat="server">Dodaj autora</th>
                                        <th runat="server">Dodaj recenzenta</th>
                                        <th runat="server">Wykonaj recenzję</th>
                                        <th runat="server">Wykonaj ocenę promotora</th>
                                        <th runat="server">Egzamin</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;"></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
            <br />
            <br />
</asp:Content>
