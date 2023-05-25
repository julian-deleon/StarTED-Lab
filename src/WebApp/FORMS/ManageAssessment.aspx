<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAssessment.aspx.cs" Inherits="WebApp.FORMS.ManageAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="page-header">Manage Assessment</h1>

    <a href="CRUD.aspx">Back to CRUD Page</a>

    <h4 class="mt-4 mb-3">Assessment Info:</h4>

    <div class="row">
        <asp:ValidationSummary ID="summary" runat="server" CssClass="alert alert-warning ml-3" />
    </div>

    <div>
        <asp:Label ID="Message" runat="server" ForeColor="Red" Font-Bold="true" />

        <div class="form-row mt-3">
            <asp:Label ID="Label1" runat="server" CssClass="col-sm-3" AssociatedControlID="AssessID" Text="ID" />
            <asp:TextBox ID="AssessID" runat="server" CssClass="form-control col-sm-5" Enabled="false" />
        </div>

        <div class="form-row mt-3">
            <asp:Label ID="Label2" runat="server" CssClass="col-sm-3" AssociatedControlID="name" Text="Name" />
            <asp:TextBox ID="name" runat="server" CssClass="form-control col-sm-5" />
            <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="name" ErrorMessage="Asessment name required." Display="None" />
        </div>

        <div class="form-row mt-3">
            <asp:Label ID="Label3" runat="server" CssClass="col-sm-3" AssociatedControlID="typeList" Text="Type" />
            <asp:DropDownList ID="typeList" runat="server" CssClass="form-control col-sm-5" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="typeList" InitialValue="" ErrorMessage="No Assessment Type selected." Display="None" />
        </div>


        <div class="form-row mt-3">
            <asp:Label ID="Label4" runat="server" CssClass="col-sm-3" AssociatedControlID="desc" Text="Description" />
            <asp:TextBox ID="desc" runat="server" CssClass="form-control col-sm-5" />
        </div>

        <div class="form-row mt-3">
            <asp:Label ID="Label5" runat="server" CssClass="col-sm-3" AssociatedControlID="courseName" Text="Course" />
            <asp:TextBox ID="courseName" runat="server" CssClass="form-control col-sm-5" Enabled="false" />
        </div>

        <div class="form-row mt-3">
            <asp:Label ID="Label7" runat="server" CssClass="col-sm-3" AssociatedControlID="weight" Text="Weight" />
            <asp:TextBox ID="weight" runat="server" CssClass="form-control col-sm-5" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="weight" ErrorMessage="Weight required." Display="None" />
        </div>

        <div class="form-row mt-3">
            <asp:Label ID="Label6" runat="server" CssClass="col-sm-3" AssociatedControlID="requiredPass" Text="Required to Pass" />
            <asp:CheckBox ID="requiredPass" runat="server" />
        </div>

        <div class="form-row mt-3">
            <asp:LinkButton ID="update" runat="server" CssClass="btn btn-info mr-3" OnClick="update_Click">Update</asp:LinkButton>

            <asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-danger" OnClick="Delete_Click" OnClientClick="return confirm('Delete this Assessment?')" CausesValidation="false">Delete</asp:LinkButton>
        </div>
    </div>

</asp:Content>
