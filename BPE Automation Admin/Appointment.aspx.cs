using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace BPE_Automation_Admin
{
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAppointments();
            }
        }
        protected void BindAppointments()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT id, CAST(day AS date) as day, start_time, CNIC, Name_, CAST(booked_at AS date) as booked_at FROM appointments where year([day])=year(GETDate()) and month([day])=month(GETDate()) and day([day])=day(GETDate())";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    AppointmentsGridView.DataSource = dataTable;
                    AppointmentsGridView.DataBind();
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            DateTime selectedDate = SearchCalendar.SelectedDate;

            string connectionString = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT id, CAST(day AS date) as day, start_time, CNIC, Name_, CAST(booked_at AS date) as booked_at FROM appointments WHERE CAST(day AS date) = @SelectedDate";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SelectedDate", selectedDate);

                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    AppointmentsGridView.DataSource = dataTable;
                    AppointmentsGridView.DataBind();
                }
            }
        }

    }
}