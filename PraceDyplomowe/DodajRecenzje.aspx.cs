using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraceDyplomowe
{
    public partial class DodajRecenzje : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ID_Pracy = Request.QueryString["ID_pracy"];
            string ID_pracownika = DDLRecenzent.SelectedValue;
            string Ocena = RadioOcena.SelectedValue;
            string Komentarz = TxtKomentarz.Text;
            DSRecenzje.InsertCommand = "exec uspDodajRecenzje " + ID_Pracy + "," + ID_pracownika + "," + Ocena + ",N'" + Komentarz + "'";
            DSRecenzje.Insert();
            Server.Transfer("~/ListaPracDyplomowych.aspx");
        }
    }
}