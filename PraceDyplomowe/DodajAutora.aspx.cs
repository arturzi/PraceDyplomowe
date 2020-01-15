using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PraceDyplomowe
{
    public partial class DodajAutora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID_Pracy = Request.QueryString["ID_pracy"];
            string ID_Studenta = GridView1.SelectedRow.Cells[1].Text;
            SqlDataSource1.InsertCommand = "exec uspDodajAutora " + ID_Pracy + "," + ID_Studenta;
            SqlDataSource1.Insert();
            Label1.Text = "Student o identyfikatorze "+ID_Studenta+" dodany do pracy "+ID_Pracy;
        }
    }
}