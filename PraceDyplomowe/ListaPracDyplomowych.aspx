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
                    <tr style="background-color:#FFF8DC;">
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
                    <tr style="background-color:#DCDCDC;color: #000000;">
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
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server">Szczegóły pracy</th>
                                        <th runat="server">Poziom studiów</th>
                                        <th runat="server">Temat pracy</th>
                                        <th runat="server">Kierunek studiów</th>
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
