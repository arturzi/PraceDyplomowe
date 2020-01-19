﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Raport2.aspx.cs" Inherits="PraceDyplomowe.Raport2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="X-Large" Text="Lista prac dyplomowych obronionych w danym dniu"/>
    <br /><br />
    <asp:Label runat="server">Wybierz datę:</asp:Label>
    <br />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" SelectedDate="01/19/2020 20:56:51" VisibleDate="2020-01-19" Width="200px">
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
        <WeekendDayStyle BackColor="#FFFFCC" />
    </asp:Calendar>
    <br />
    <asp:SqlDataSource ID="DSPrace" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="SELECT        Praca_dyplomowa.Temat_pracy, Praca_dyplomowa.Kierunek_studiow, Praca_dyplomowa.Poziom_studiow, Autor.Data_obrony
FROM            Autor INNER JOIN
                         Praca_dyplomowa ON Autor.ID_pracy = Praca_dyplomowa.ID_pracy
WHERE        (Autor.Data_obrony = @Data_obrony)
ORDER BY Praca_dyplomowa.Temat_pracy">
        <SelectParameters>
            <asp:ControlParameter ControlID="Calendar1" Name="Data_obrony" PropertyName="SelectedDate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSPrace" ForeColor="#333333" GridLines="None" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Temat_pracy" HeaderText="Temat pracy" SortExpression="Temat_pracy" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Kierunek_studiow" HeaderText="Kierunek studiów" SortExpression="Kierunek_studiow" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Poziom_studiow" HeaderText="Poziom studiów" SortExpression="Poziom_studiow" >
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Data_obrony" HeaderText="Data obrony" SortExpression="Data_obrony">
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
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
</asp:Content>
