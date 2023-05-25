<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Query.aspx.cs" Inherits="WebApp.FORMS.Query" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="jumbotron">ODS - Star-TED</h1>

    <div class="col mt-5 mb-3">
        <div class="row">
            <asp:Label ID="Label8" runat="server" AssociatedControlID="courseQuery" CssClass="mr-3">Search:</asp:Label>
            <asp:TextBox ID="courseQuery" runat="server" CssClass="form-control mr-2" placeholder="Enter partial course name" />
            <asp:LinkButton ID="courseSearch" runat="server" CssClass="btn btn-primary" OnClick="courseSearch_Click">Search Courses</asp:LinkButton>
        </div>

         <div class="row mt-3">
            <asp:Label ID="courseList" runat="server" AssociatedControlID="coursesDropDown" CssClass="mr-2">Courses:</asp:Label>

             <asp:DropDownList ID="coursesDropDown" runat="server"          
                DataSourceID="coursesDataSource" 
                DataTextField="CourseName" 
                DataValueField="CourseID"
                AppendDataBoundItems="true"
                CssClass="form-control mr-2">
                <asp:ListItem Value="">Select a Course</asp:ListItem>
            </asp:DropDownList>   

             <asp:LinkButton ID="assessments" runat="server" CssClass="btn btn-primary">Planned Assessments</asp:LinkButton>
        </div>
    </div>

    <asp:Label ID="message" runat="server" ForeColor="Red" Font-Bold="true" />

    <h2 class="mt-5">Planned Assessments</h2>

    <asp:GridView ID="plannedAssessmentsGridView" runat="server"
        AutoGenerateColumns="false" 
        DataSourceID="assessmentsDataSource"
        CssClass="table table-striped"
        ItemType="Star_TEDSystem.ENTITIES.PlannedAssessment" 
        AllowPaging="True"
        PageSize="5"  
        HeaderStyle-BackColor="#33CCFF" 
        HeaderStyle-Wrap="True" BorderWidth="2px" BorderStyle="Groove">

        <Columns>
            <asp:BoundField DataField="AssessmentID" HeaderText="Assessment ID" SortExpression="AssessmentID"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>

            <asp:TemplateField>
                <HeaderTemplate>Assessment Type</HeaderTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="assessmentTypeList" runat="server"    
                        DataSourceID="assessmentTypeDataSource" 
                        DataTextField="Name" 
                        DataValueField="AssessmentTypeID"
                        SelectedValue="<%# Item.AssessmentTypeID %>"
                        Enabled="false">                     
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>

             <asp:TemplateField>
                <HeaderTemplate>Course</HeaderTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="courseDropDown" runat="server"
                        DataSourceID="coursesDataSource"
                        DataTextField="CourseName"
                        DataValueField="CourseID"
                        SelectedValue="<%# Item.CourseID %>"
                        Enabled="false">  
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight"></asp:BoundField>
            <asp:CheckBoxField DataField="RequiredPass" HeaderText="Required to Pass?" SortExpression="RequiredPass"></asp:CheckBoxField>
        </Columns>

        <EmptyDataTemplate>
            <p>No information to display at this time.</p>
        </EmptyDataTemplate>
    </asp:GridView>

    <%-- ObjectDataSource Controls --%>
    <asp:ObjectDataSource ID="coursesDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="LookupCourseByPartialName" TypeName="Star_TEDSystem.BLL.CoursesController"
      OnSelected="coursesDataSource_Selected">
        <SelectParameters>
            <asp:ControlParameter ControlID="courseQuery" PropertyName="Text" Name="partial" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="assessmentsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAssessmentsByCourseId" TypeName="Star_TEDSystem.BLL.PlannedAssessmentsController">
        <SelectParameters>
            <asp:ControlParameter ControlID="coursesDropDown" PropertyName="SelectedValue" Name="courseId" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="assessmentTypeDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAllAssessmentTypes" TypeName="Star_TEDSystem.BLL.AssessmentTypeController">
    </asp:ObjectDataSource>
</asp:Content>


