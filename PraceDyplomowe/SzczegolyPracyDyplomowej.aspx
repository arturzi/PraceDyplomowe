<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SzczegolyPracyDyplomowej.aspx.cs" Inherits="PraceDyplomowe.SzczegolyPracyDyplomowej" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
            <asp:Label ID="l1" runat="server" Font-Bold="true" Font-Size="XX-Large" Text="Szczegóły pracy dyplomowej"/>
    <asp:SqlDataSource ID="DSDanePodstawowe" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select Temat_pracy, Poziom_studiow, Kierunek_studiow, CONCAT(Stopien_naukowy, ' ', Imie, ' ', Nazwisko) as 'Promotor', Ocena_promotora, Komentarz_promotora
from Praca_dyplomowa inner join Pracownik_naukowy on Praca_dyplomowa.ID_pracownika = Pracownik_naukowy.ID_pracownika
where ID_pracy = @input">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
     </asp:SqlDataSource>
  <br /><br />
       <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Larger" Text="Dane podstawowe"/>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="706px" AutoGenerateRows="False" DataSourceID="DSDanePodstawowe">
        <Fields>
            <asp:BoundField DataField="Temat_pracy" HeaderText="Temat_pracy" SortExpression="Temat_pracy" />
            <asp:BoundField DataField="Poziom_studiow" HeaderText="Poziom_studiow" SortExpression="Poziom_studiow" />
            <asp:BoundField DataField="Kierunek_studiow" HeaderText="Kierunek_studiow" SortExpression="Kierunek_studiow" />
            <asp:BoundField DataField="Promotor" HeaderText="Promotor" ReadOnly="True" SortExpression="Promotor" />
            <asp:BoundField DataField="Ocena_promotora" HeaderText="Ocena_promotora" SortExpression="Ocena_promotora" />
            <asp:BoundField DataField="Komentarz_promotora" HeaderText="Komentarz_promotora" SortExpression="Komentarz_promotora" />
        </Fields>
            </asp:DetailsView>
       <asp:Label ID="Label2" runat="server" Font-Bold="true" Font-Size="Larger" Text="Słowa kluczowe"/>

    <asp:SqlDataSource ID="DSSlowaKluczowe" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select Slowo_kluczowe.Nazwa
from Tematyka inner join Slowo_kluczowe on Tematyka.ID_slowa = Slowo_kluczowe.ID_slowa
where Tematyka.ID_pracy = @input
order by Slowo_kluczowe.Nazwa asc">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
            </asp:SqlDataSource>

    <div>

    <asp:DataList ID="DataList2" runat="server" CellPadding="4" DataSourceID="DSSlowaKluczowe" ForeColor="#333333" Width="200px">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <ItemTemplate>
            <asp:Label ID="NazwaLabel" runat="server" Text='<%# Eval("Nazwa") %>' />
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    </div>


    <asp:Label ID="Label3" runat="server" Font-Bold="true" Font-Size="Larger" Text="Autorzy"/>
    <asp:SqlDataSource ID="DSAutorzy" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select Numer_indeksu, Imie, Nazwisko
from Autor inner join Student on Autor.ID_studenta = Student.ID_studenta
where Autor.ID_pracy = @input
order by Student.Nazwisko">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
            </asp:SqlDataSource>
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSAutorzy" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Numer_indeksu" HeaderText="Numer indeksu" SortExpression="Numer_indeksu" />
            <asp:BoundField DataField="Imie" HeaderText="Imię" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" SortExpression="Nazwisko" />
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

        <asp:Label ID="Label4" runat="server" Font-Bold="true" Font-Size="Larger" Text="Recenzenci"/>
    <asp:SqlDataSource ID="DSRecenzenci" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select CONCAT(Stopien_naukowy, ' ', Imie, ' ', Nazwisko) as 'Recenzent', Ocena_recenzenta, Komentarz_recenzenta
from Recenzenci inner join Pracownik_naukowy on Recenzenci.ID_pracownika = Pracownik_naukowy.ID_pracownika
where Recenzenci.ID_pracy = @input">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
            </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="DSRecenzenci" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Recenzent" HeaderText="Recenzent" ReadOnly="True" SortExpression="Recenzent" ItemStyle-Width="300" />
            <asp:BoundField DataField="Ocena_recenzenta" HeaderText="Ocena recenzenta" SortExpression="Ocena_recenzenta"  ItemStyle-Width="100"/>
            <asp:BoundField DataField="Komentarz_recenzenta" HeaderText="Komentarz recenzenta" SortExpression="Komentarz_recenzenta"  ItemStyle-Width="300"/>
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

            <asp:Label ID="Label5" runat="server" Font-Bold="true" Font-Size="Larger" Text="Komisja egzaminacyjna"/>
    <asp:SqlDataSource ID="DSKomisja" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select CONCAT(Stopien_naukowy, ' ', Imie, ' ', Nazwisko) as 'Skład komisji egzaminacyjnej'
from Recenzenci inner join Pracownik_naukowy on Recenzenci.ID_pracownika = Pracownik_naukowy.ID_pracownika
where Recenzenci.ID_pracy = @input
union all
select CONCAT(PN2.Stopien_naukowy, ' ', PN2.Imie, ' ', PN2.Nazwisko) as 'Skład komisji egzaminacyjnej'
from Praca_dyplomowa inner join Pracownik_naukowy as PN2 on Praca_dyplomowa.ID_pracownika = PN2.ID_pracownika
where Praca_dyplomowa.ID_pracy = @input
">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
            </asp:SqlDataSource>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSKomisja" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Skład komisji egzaminacyjnej" HeaderText="Egzaminatorzy" ReadOnly="True" ShowHeader="False" SortExpression="Skład komisji egzaminacyjnej"/>
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

        <asp:Label ID="Label6" runat="server" Font-Bold="true" Font-Size="Larger" Text="Obrona pracy"/>
    <asp:SqlDataSource ID="DSObrona" runat="server" ConnectionString="<%$ ConnectionStrings:PraceDyplomoweCS %>" SelectCommand="select Numer_indeksu, CONCAT(Imie, ' ', Nazwisko) as 'Student', Data_obrony, Ocena_ostateczna, Nadany_stopien
from Autor inner join Student on Autor.ID_studenta = Student.ID_studenta
where Autor.ID_pracy = @input
order by Student.Nazwisko
">
        <SelectParameters>
            <asp:QueryStringParameter Name="input" QueryStringField="ID_pracy" />
        </SelectParameters>
            </asp:SqlDataSource>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DSObrona" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Numer_indeksu" HeaderText="Numer_indeksu" SortExpression="Numer_indeksu" />
            <asp:BoundField DataField="Student" HeaderText="Student" ReadOnly="True" SortExpression="Student" />
            <asp:BoundField DataField="Data_obrony" HeaderText="Data_obrony" SortExpression="Data_obrony" />
            <asp:BoundField DataField="Ocena_ostateczna" HeaderText="Ocena_ostateczna" SortExpression="Ocena_ostateczna" />
            <asp:BoundField DataField="Nadany_stopien" HeaderText="Nadany_stopien" SortExpression="Nadany_stopien" />
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
