using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraceDyplomowe
{
    public partial class DodajRecenzenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GVPracownicy_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Pracy = Request.QueryString["ID_pracy"];
            string ID_Pracownika = GVPracownicy.SelectedRow.Cells[1].Text;
            DSPracownicy.InsertCommand = "exec uspDodajRecenzenta " + ID_Pracy + "," + ID_Pracownika;
            DSPracownicy.Insert();
            Label1.Text = "Pracownik o identyfikatorze " + ID_Pracownika + " dodany jako recenzent do pracy " + ID_Pracy;
        }
    }
}