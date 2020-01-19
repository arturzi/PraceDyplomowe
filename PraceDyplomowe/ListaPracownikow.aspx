<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPracownikow.aspx.cs" Inherits="PraceDyplomowe.ListaPracownikow" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Lista pracowników naukowych"/>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_pracownika" DataSourceID="ListaPracownikowDS" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
                <tr style="background-color:white;color:#284775">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="25"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="25"/>
                </td>
                <td style="text-align:center">
                    <asp:Label ID="ID_pracownikaLabel" runat="server" Text='<%# Eval("ID_pracownika") %>' />
                </td>
                <td>
                    <asp:Label ID="Stopien_naukowyLabel" runat="server" Text='<%# Eval("Stopien_naukowy") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                </td>
                <td>
                    <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FF0000;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Zapisz" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" />
                </td>
                <td>
                    <asp:Label ID="ID_pracownikaLabel1" runat="server" Text='<%# Eval("ID_pracownika") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Stopien_naukowyTextBox" runat="server" Text='<%# Bind("Stopien_naukowy") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Zapisz" Height="25"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" Height="25"/>
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="Stopien_naukowyTextBox" runat="server" Text='<%# Bind("Stopien_naukowy") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                </td>
                <td>
                    <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
                    <tr style="background-color:#F7F6F3;color: 333333; width:250px">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="25"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="25"/>
                </td>
                <td style="text-align:center">
                    <asp:Label ID="ID_pracownikaLabel" runat="server" Text='<%# Eval("ID_pracownika") %>' />
                </td>
                <td>
                    <asp:Label ID="Stopien_naukowyLabel" runat="server" Text='<%# Eval("Stopien_naukowy") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                </td>
                <td>
                    <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#5D7B9D;color: white;">
                                <th runat="server"></th>
                                <th runat="server">Identyfikator</th>
                                <th runat="server">Stopień naukowy</th>
                                <th runat="server">Nazwisko</th>
                                <th runat="server">Imię</th>
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
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" />
                </td>
                <td>
                    <asp:Label ID="ID_pracownikaLabel" runat="server" Text='<%# Eval("ID_pracownika") %>' />
                </td>
                <td>
                    <asp:Label ID="Stopien_naukowyLabel" runat="server" Text='<%# Eval("Stopien_naukowy") %>' />
                </td>
                <td>
                    <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                </td>
                <td>
                    <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="ListaPracownikowDS" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" DeleteCommand="DELETE FROM [Pracownik_naukowy] WHERE [ID_pracownika] = @ID_pracownika" InsertCommand="INSERT INTO [Pracownik_naukowy] ([Stopien_naukowy], [Nazwisko], [Imie]) VALUES (@Stopien_naukowy, @Nazwisko, @Imie)" SelectCommand="SELECT [ID_pracownika], [Stopien_naukowy], [Nazwisko], [Imie] FROM [Pracownik_naukowy] ORDER BY [Nazwisko], [Imie]" UpdateCommand="UPDATE [Pracownik_naukowy] SET [Stopien_naukowy] = @Stopien_naukowy, [Nazwisko] = @Nazwisko, [Imie] = @Imie WHERE [ID_pracownika] = @ID_pracownika">
            <DeleteParameters>
                <asp:Parameter Name="ID_pracownika" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Stopien_naukowy" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Imie" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Stopien_naukowy" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="ID_pracownika" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
