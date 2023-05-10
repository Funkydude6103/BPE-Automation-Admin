<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="BPE_Automation_Admin.Customer" %>

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

h1 {
  text-align: center;
  margin-bottom: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  padding: 10px;
  text-align: left;
}

th {
  background-color: #f2f2f2;
  width: 10%;
}

td {
  width: 14%;
}

th.query-column,
td.query-column {
  width: 50%;
}

tr:nth-child(even) {
  background-color: #f9f9f9;
}

tr:hover {
  background-color: #f5f5f5;
  cursor: pointer;
}

.reply-button,.solved-button {
  padding: 5px 10px;
  font-size: 14px;
  border: none;
  border-radius: 3px;
  color: #fff;
  cursor: pointer;
  transition: background-color 0.3s;
}

.solved-button {
  background-color: #28a745;
}

.reply-button {
  background-color: #007bff;
}

footer {
  padding: 20px 0;
  color: #fff;
}

footer p {
  margin-bottom: 0;
}

footer a {
  color: #fff;
  text-decoration: underline;
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
                <li class="nav-item">
                    <a class="nav-link" href="Appointment.aspx">Appointments</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="Customer.aspx">Customer Queries</a>
                </li>
            </ul>
        </div>
    </nav>
     <h1>Support Queries</h1>
    <form runat="server">
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>CNIC</th>
            <th>Query</th>
            <th>Actions</th>
        </tr>
        <asp:Repeater ID="supportRepeater" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("id") %></td>
                    <td><%# Eval("name_") %></td>
                    <td><%# Eval("email") %></td>
                    <td><%# Eval("cnic") %></td>
                    <td><%# Eval("query") %></td>
                
                    <td>
                        <asp:Button class="solved-button" ID="solvedButton" runat="server" Text="Solved" OnClick="SolveButton_Click" CommandArgument='<%# Eval("id") %>' Visible='<%# Eval("solved") != "solved" %>' />
                        <asp:Button class="reply-button" ID="replyButton" runat="server" Text="Reply" OnClick="ReplyButton_Click" CommandArgument='<%# Eval("email") %>' />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
        </form>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
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
