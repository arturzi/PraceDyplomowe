using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace PraceDyplomowe
{
    public partial class DodajPraceDyplomowa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtZapisz_Click(object sender, EventArgs e)
        {
            var Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["PraceDyplomoweCS"].ConnectionString);
            var Command = new SqlCommand("uspDodajPraceDyplomowa", Connection);
            Command.CommandType = System.Data.CommandType.StoredProcedure;
            Command.Parameters.AddWithValue("@Poziom", ListPoziom.SelectedValue);
            Command.Parameters.AddWithValue("@Kierunek", TextKierunek.Text);
            Command.Parameters.AddWithValue("@Temat", TextTytul.Text);
            Command.Parameters.AddWithValue("@Promotor", ListPromotor.SelectedValue);
            Command.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;

            Connection.Open();
            Command.ExecuteNonQuery();
            string id = Command.Parameters["@id"].Value.ToString();

            Command.CommandType = CommandType.Text;
            Command.CommandText = "insert into Tematyka (ID_pracy, ID_slowa) values ";
            foreach (int i in ListSlowaKluczowe.GetSelectedIndices())
            {
                Command.CommandText += "("+id+","+i.ToString()+"),";
            }
            Command.CommandText = Command.CommandText.Remove(Command.CommandText.Length - 1, 1);
            Command.ExecuteNonQuery();
            DSPrace.InsertCommand = "insert into Tematyka";

            Server.Transfer("~/ListaPracDyplomowych.aspx");

        }
    }
}