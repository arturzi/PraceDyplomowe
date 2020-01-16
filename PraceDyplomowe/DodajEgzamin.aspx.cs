using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace PraceDyplomowe
{
    public partial class DodajEgzamin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtZapisz_Click(object sender, EventArgs e)
        {
            var Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["PraceDyplomoweCS"].ConnectionString);
            var Command = new SqlCommand("uspDodajEgzamin", Connection);
            Command.CommandType = System.Data.CommandType.StoredProcedure;
            Command.Parameters.AddWithValue("@ID_pracy", Request.QueryString["ID_pracy"]);
            Command.Parameters.AddWithValue("@ID_studenta", ListAutor.SelectedValue);
            Command.Parameters.AddWithValue("@Data", Kalendarz.SelectedDate);
            Command.Parameters.AddWithValue("@Ocena", RadioOcena.SelectedValue);
            Command.Parameters.AddWithValue("@Stopien", ListStopien.SelectedValue);

            Connection.Open();
            Command.ExecuteNonQuery();

            Server.Transfer("~/DodajEgzamin.aspx?ID_pracy="+ Request.QueryString["ID_pracy"]);
        }
    }
}