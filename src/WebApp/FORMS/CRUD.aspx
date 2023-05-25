<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="WebApp.FORMS.CRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="jumbotron">CRUD - Star-TED</h1>

    <h2 class="mt-5 mb-3">View Assessments</h2>

    <div class="col mb-2">
        <div class="row">
            <asp:Label ID="Label8" runat="server" AssociatedControlID="courseQuery" CssClass="mr-3">Search:</asp:Label>
            <asp:TextBox ID="courseQuery" runat="server" CssClass="form-control mr-2" placeholder="Enter partial course name" />
            <asp:LinkButton ID="courseSearch" runat="server" CssClass="btn btn-primary" OnClick="courseSearch_Click" CausesValidation="false">Search Courses</asp:LinkButton>
        </div>

        <div class="row mt-3">
            <asp:Label ID="courseList" runat="server" AssociatedControlID="coursesDropDown" CssClass="mr-2">Courses:</asp:Label>

            <asp:DropDownList ID="coursesDropDown" runat="server" CssClass="form-control mr-2" />

            <asp:LinkButton ID="assessments" runat="server" CssClass="btn btn-primary" OnClick="assessments_Click" CausesValidation="false">Planned Assessments</asp:LinkButton>
        </div>
    </div>

    <div class="row mt-3">
        <asp:Label ID="message" runat="server" ForeColor="Red" Font-Bold="true" />
    </div>

    <div class="row mt-3">
        <asp:Label ID="gridViewHeader" runat="server" Font-Italic="False" Font-Overline="False" Font-Size="X-Large" ForeColor="#6699FF" />
    </div>

    <asp:GridView ID="AssessmentsGridView" runat="server"
        ItemType="Star_TEDSystem.ENTITIES.PlannedAssessment"
        AutoGenerateColumns="false"
        CssClass="table table-striped"
        BorderWidth="2px"
        HeaderStyle-BackColor="#CCFF66"
        AllowPaging="true"
        PageSize="5"
        OnPageIndexChanging="AssessmentsGridView_PageIndexChanging">

        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>Action</HeaderTemplate>
                <ItemTemplate>
                    <a href="ManageAssessment?assessmentId=<%# Item.AssessmentID %>" class="btn btn-secondary btn-sm">Edit</a>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="AssessmentID" HeaderText="Assessment ID" SortExpression="AssessmentID"></asp:BoundField>

            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>

            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight"></asp:BoundField>

            <asp:CheckBoxField DataField="RequiredPass" HeaderText="Required to Pass?" SortExpression="RequiredPass"></asp:CheckBoxField>
        </Columns>

        <EmptyDataTemplate>
            <p>No information to display at this time.</p>
        </EmptyDataTemplate>
    </asp:GridView>

    <hr class="mt-4" />
    <h2 class="mt-2">Add Assessment</h2>

    <asp:Label ID="addErrors" runat="server" ForeColor="Red" Font-Bold="true" />

    <div class="row">
        <asp:ValidationSummary ID="summary" runat="server" CssClass="alert alert-warning ml-3" />
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-row mt-3">
                <asp:Label ID="Label1" runat="server" CssClass="col-sm-3" AssociatedControlID="AssessID" Text="ID" />
                <asp:TextBox ID="AssessID" runat="server" CssClass="form-control col-sm-5" Enabled="false" placeholder="auto-generated field" />
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
        </div>


        <div class="col-md-6">
            <div class="form-row mt-3">
                <asp:TextBox ID="filterQuery" runat="server" CssClass="form-control mr-2" placeholder="Enter partial course name" />
                <asp:LinkButton ID="courseFilter" runat="server" CssClass="btn btn-primary" OnClick="courseFilter_Click" CausesValidation="false">Filter</asp:LinkButton>
            </div>

            <div class="form-row mt-3">
                <asp:Label ID="Label5" runat="server" CssClass="col-sm-3" AssociatedControlID="filteredCourses" Text="Course" />
                <asp:DropDownList ID="filteredCourses" runat="server" CssClass="form-control col-sm-5" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="filteredCourses" InitialValue="" ErrorMessage="No course selected." Display="None" />
            </div>

            <div class="form-row mt-3">
                <asp:Label ID="Label7" runat="server" CssClass="col-sm-3" AssociatedControlID="weight" Text="Weight" />
                <asp:TextBox ID="weight" runat="server" CssClass="form-control col-sm-5" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="weight" ErrorMessage="Weight required." Display="None" />
            </div>

            <div class="form-row mt-3">
                <asp:Label ID="Label6" runat="server" CssClass="col-sm-3" AssociatedControlID="requiredPass" Text="Required to Pass" />
                <asp:CheckBox ID="requiredPass" runat="server" />
            </div>

            <div class="form-row mt-3">
                <asp:LinkButton ID="add" runat="server" CssClass="btn btn-success" OnClick="add_Click">Add</asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>
