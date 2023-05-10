<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="BPE_Automation_Admin.Appointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DGIP - Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
 <style>
    .logo {
        max-width: 80px;
        height: auto;
    }

    .gridview {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
    }

    .gridview th {
        background-color: #333;
        color: #fff;
        padding: 8px;
        text-align: center;
    }

    .gridview td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

 

    .search-container .calendar-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 10px;
    }

    .search-container .calendar-container .form-control {
        width: auto;
    }
 .search-container {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 10px;
    transition: background-color 0.3s;
    margin-top: 0;
}


.button:hover {
    background-color: #0056b3;
}

.button:active {
    background-color: #004080;
}

</style>

</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#"><img src="Logo.png" alt="DGIP Logo" class="logo"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="Admin-Home.aspx">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Appointment.aspx">Appointments</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Customer.aspx">Customer Queries</a>
                </li>
            </ul>
        </div>
    </nav>
    <br />




    <form id="form1" runat="server" style="max-width: 600px; margin: 0 auto;">

                 <div class="search-container">
                <asp:Calendar ID="SearchCalendar" runat="server" class="calendar-container" ></asp:Calendar>
            
         </div>
  
      
            <br />
                <asp:Button ID="SearchButton" runat="server" Text="Search" class="button" OnClick="SearchButton_Click" />

    <div>
        <h1 style="text-align: center;">Appointments</h1>
        <asp:GridView ID="AppointmentsGridView" runat="server" AutoGenerateColumns="false" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="gridview-column" />
                <asp:BoundField DataField="day" HeaderText="Day" ItemStyle-CssClass="gridview-column" />
                <asp:BoundField DataField="start_time" HeaderText="Start Time" ItemStyle-CssClass="gridview-column" />
                <asp:BoundField DataField="CNIC" HeaderText="CNIC" ItemStyle-CssClass="gridview-column" />
                <asp:BoundField DataField="Name_" HeaderText="Name" ItemStyle-CssClass="gridview-column" />
                <asp:BoundField DataField="booked_at" HeaderText="Booked At" ItemStyle-CssClass="gridview-column" />
            </Columns>
        </asp:GridView>
    </div>
</form>

    <br />
    <br />
    <br />
    <br />



      <footer class="bg-dark text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; 2023 DGIP. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-right">
                <p>Designed by BPE Automation</p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
