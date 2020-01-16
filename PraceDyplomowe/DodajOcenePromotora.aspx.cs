using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraceDyplomowe
{
    public partial class DodajOcenePromotora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtZapisz_Click(object sender, EventArgs e)
        {
            string ID_Pracy = Request.QueryString["ID_pracy"];
            string Ocena = RadioOcena.SelectedValue;
            string Komentarz = TxtKomentarz.Text;
            DSPrace.InsertCommand = "exec uspDodajOcenePromotora " + ID_Pracy + "," + Ocena + ",N'" + Komentarz + "'";
            DSPrace.Insert();
            Server.Transfer("~/ListaPracDyplomowych.aspx");

        }
    }
}