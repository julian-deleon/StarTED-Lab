<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Star-TED LAB Scenario: A05</h1>
        <p>This project includes the following Web Forms:</p>
        <ul>
            <li class="mb-2">
                <b>QUERY Form </b>- Uses a GridView to display multiple rows of data from connected database. Data for this form is populated using ObjectDataSource controls.
            </li>       
            <li>
                <b>CRUD Form </b>- Allows Adding/Deleting/Updating of a database entry. 
            </li>
        </ul>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Known Bugs:</h2>
            <ul>
                <li><b>QUERY Page</b> - used some code behind to clear drop-down list items on new course search.</li>

                <li>I had to make <b>Assessment Type</b> a required field on CRUD otherwise <em>"selected value is not in list of items"</em> error is thrown.</li>

                <li>All rows appear to be <b>DELETEABLE</b>. Added code to handle exception otherwise.</li>
            </ul>
        </div>
        <div class="col-md-8">
            <h2>Entity Relationship Diagram:</h2>
            
             <asp:Image ID="erdImg" runat="server" ImageUrl="~/ERD img/A05.png" Width="500" Height="500" AlternateText="Entity Relationship Diagram for scenario: A05" />                            
        </div>     
    </div>

</asp:Content>
