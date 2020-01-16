<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaSlowKluczowych.aspx.cs" Inherits="PraceDyplomowe.ListaSlowKluczowych" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Słowa kluczowe prac dyplomowych"/>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_slowa" DataSourceID="SlowaKluczoweDS" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                    <tr style="background-color:white;color:#284775">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="20"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="20"/>
                    </td>
                    <td style="text-align:center">
                        <asp:Label ID="ID_slowaLabel" runat="server" Text='<%# Eval("ID_slowa") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FF0000;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Zapisz" Height="20"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" Height="20"/>
                    </td>
                    <td>
                        <asp:Label ID="ID_slowaLabel1" runat="server" Text='<%# Eval("ID_slowa") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
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
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Zapisz" Height="20"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" Height="20"/>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                    <tr style="background-color:#F7F6F3;color: 333333; width:250px">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="20" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="20" />
                    </td>
                    <td style="text-align:center">
                        <asp:Label ID="ID_slowaLabel" runat="server" Text='<%# Eval("ID_slowa") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
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
                                    <th runat="server">Nazwa</th>
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
                        <asp:Label ID="ID_slowaLabel" runat="server" Text='<%# Eval("ID_slowa") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SlowaKluczoweDS" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" DeleteCommand="DELETE FROM [Slowo_kluczowe] WHERE [ID_slowa] = @ID_slowa" InsertCommand="INSERT INTO [Slowo_kluczowe] ([Nazwa]) VALUES (@Nazwa)" SelectCommand="SELECT * FROM [Slowo_kluczowe] ORDER BY [Nazwa]" UpdateCommand="UPDATE [Slowo_kluczowe] SET [Nazwa] = @Nazwa WHERE [ID_slowa] = @ID_slowa">
            <DeleteParameters>
                <asp:Parameter Name="ID_slowa" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nazwa" Type="String" />
                <asp:Parameter Name="ID_slowa" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
