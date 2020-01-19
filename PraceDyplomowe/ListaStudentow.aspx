<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaStudentow.aspx.cs" Inherits="PraceDyplomowe.ListaStudentow" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Lista studentów"/>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID_studenta" DataSourceID="DSPraceDyplomowe" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color:white;color:#284775">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="25"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="25"/>
                    </td>
                    <td>
                        <asp:Label ID="ID_studentaLabel" runat="server" Text='<%# Eval("ID_studenta") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Numer_indeksuLabel" runat="server" Text='<%# Eval("Numer_indeksu") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #ff0000;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Zapisz" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" />
                    </td>
                    <td>
                        <asp:Label ID="ID_studentaLabel1" runat="server" Text='<%# Eval("ID_studenta") %>'/>
                    </td>
                    <td>
                        <asp:TextBox ID="Numer_indeksuTextBox" runat="server" Text='<%# Bind("Numer_indeksu") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
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
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Dodaj" Height="25"/>
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Anuluj" Height="25"/>
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="Numer_indeksuTextBox" runat="server" Text='<%# Bind("Numer_indeksu") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImieTextBox" runat="server" Text='<%# Bind("Imie") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="NazwiskoTextBox" runat="server" Text='<%# Bind("Nazwisko") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                    <tr style="background-color:#F7F6F3;color: 333333; width:250px">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Usuń" Height="25"/>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Modyfikuj" Height="25"/>
                    </td>
                    <td>
                        <asp:Label ID="ID_studentaLabel" runat="server" Text='<%# Eval("ID_studenta") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Numer_indeksuLabel" runat="server" Text='<%# Eval("Numer_indeksu") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
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
                                    <th runat="server">Numer indeksu</th>
                                    <th runat="server">Imię</th>
                                    <th runat="server">Nazwisko</th>
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
                        <asp:Label ID="ID_studentaLabel" runat="server" Text='<%# Eval("ID_studenta") %>'/>
                    </td>
                    <td>
                        <asp:Label ID="Numer_indeksuLabel" runat="server" Text='<%# Eval("Numer_indeksu") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImieLabel" runat="server" Text='<%# Eval("Imie") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NazwiskoLabel" runat="server" Text='<%# Eval("Nazwisko") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="DSPraceDyplomowe" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" DeleteCommand="DELETE FROM [Student] WHERE [ID_studenta] = @ID_studenta" InsertCommand="INSERT INTO [Student] ([Numer_indeksu], [Imie], [Nazwisko]) VALUES (@Numer_indeksu, @Imie, @Nazwisko)" SelectCommand="SELECT * FROM [Student] ORDER BY [Nazwisko], [Imie]" UpdateCommand="UPDATE [Student] SET [Numer_indeksu] = @Numer_indeksu, [Imie] = @Imie, [Nazwisko] = @Nazwisko WHERE [ID_studenta] = @ID_studenta">
            <DeleteParameters>
                <asp:Parameter Name="ID_studenta" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Numer_indeksu" Type="Int64" />
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Numer_indeksu" Type="Int64" />
                <asp:Parameter Name="Imie" Type="String" />
                <asp:Parameter Name="Nazwisko" Type="String" />
                <asp:Parameter Name="ID_studenta" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
