using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Threading.Tasks;
using BPE_Automation_Admin;
using System.Web.UI.WebControls;

namespace BPE_Automation_Admin
{
    public partial class Login_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void Button1_Click(object senderc, EventArgs e)
        {
            string apiUrl = "https://localhost:44350/Admin/Login";
            var httpClientHandler = new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (sender, cert, chain, sslPolicyErrors) => true
            };

            using (HttpClient client = new HttpClient(httpClientHandler))
            {
                Admin admin=new Admin(email.Text.ToString(),password.Text.ToString());
                HttpResponseMessage response = await client.PostAsJsonAsync(apiUrl, admin);
                string responseMessage = await response.Content.ReadAsStringAsync();

                if (responseMessage!= "StatusCode: 404, ReasonPhrase: 'Not Found', Version: 1.1, Content: <null>, Headers:\r\n{\r\n}")
                {
                    Response.Redirect("Admin-Home.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Wrong Credentials')</script>");
                }
            }
        }
    }
}