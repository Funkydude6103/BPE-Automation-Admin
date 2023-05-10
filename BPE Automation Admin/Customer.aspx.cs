using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPE_Automation_Admin
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSupportQueries();
            }
        }
        protected void BindSupportQueries()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "SELECT * FROM support WHERE solved is NULL";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    supportRepeater.DataSource = reader;
                    supportRepeater.DataBind();
                    reader.Close();
                }
            }
        }
        protected void SolveButton_Click(object sender, EventArgs e)
        {
            Button solveButton = (Button)sender;
            int id = Convert.ToInt32(solveButton.CommandArgument);

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "UPDATE support SET solved = 'solved' WHERE id = @Id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", id);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            BindSupportQueries();
        }
        protected void ReplyButton_Click(object sender, EventArgs e)
        {
            Button replyButton = (Button)sender;
            string email = replyButton.CommandArgument;

            // Open Gmail with the customer's email pre-filled in the "To" field
            string gmailUrl = "https://mail.google.com/mail/?view=cm&fs=1&to=" + email;
            Response.Redirect(gmailUrl);
        }

    }
}