using Star_TEDSystem.BLL;
using Star_TEDSystem.DAL;
using Star_TEDSystem.ENTITIES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.FORMS
{
    public partial class CRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {         
            message.Text = string.Empty;
            addErrors.Text = string.Empty;

            AssessmentsGridView.DataSource = null;
            AssessmentsGridView.DataBind();
            gridViewHeader.Text = string.Empty;

            if (!IsPostBack)
            {
                coursesDropDown.Items.Insert(0, new ListItem("Select a Course", ""));
                filteredCourses.Items.Insert(0, new ListItem("Select a Course", ""));

                populateAssessmentTypeDropDown();
            }
        }

        private void populateAssessmentTypeDropDown()
        {
            AssessmentTypeController controller = new AssessmentTypeController();
            typeList.DataSource = controller.ListAllAssessmentTypes();
            typeList.DataTextField = nameof(AssessmentType.Name);
            typeList.DataValueField = nameof(AssessmentType.AssessmentTypeID);
            typeList.DataBind();

            typeList.Items.Insert(0, new ListItem("Select Assessment Type", ""));

        }

        private void clearForm()
        {
            AssessID.Text = string.Empty;
            name.Text = string.Empty;
            typeList.SelectedIndex = 0;
            desc.Text = string.Empty;
            filterQuery.Text = string.Empty;
            weight.Text = string.Empty;
            requiredPass.Checked = false;


            filteredCourses.Items.Clear();
            filteredCourses.Items.Insert(0, new ListItem("Select a Course", ""));

        }

        private string GetInnerException (Exception ex)
        {
            Exception current = ex;
            while (current.InnerException != null)
                current = current.InnerException;
            return current.Message;
        }

        protected void courseSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (courseQuery.Text != string.Empty)
                {
                    CoursesController controller = new CoursesController();

                    coursesDropDown.DataSource = controller.LookupCourseByPartialName(courseQuery.Text);
                    coursesDropDown.DataTextField = nameof(Course.CourseName);
                    coursesDropDown.DataValueField = nameof(Course.CourseID);
                    coursesDropDown.DataBind();

                    coursesDropDown.Items.Insert(0, new ListItem("Select a Course", ""));
                }
                else
                {
                    message.Text = "Please enter course name or partial name for the search.";
                }
            }
            catch (Exception ex)
            {
                message.Text = $"Unexpected errors have occured: {ex.Message}"; 
            }
        }

        protected void assessments_Click(object sender, EventArgs e)
        {
            try
            {                            
                if (coursesDropDown.Items.Count == 1)
                {
                    message.Text = "Please search for a course before clicking Planned Assessments.";
                }
                else if (coursesDropDown.SelectedValue != string.Empty)
                {
                    
                    PlannedAssessmentsController controller = new PlannedAssessmentsController();
                    var assessments = controller.GetAssessmentsByCourseId(coursesDropDown.SelectedValue);
                    AssessmentsGridView.DataSource = assessments;
                    AssessmentsGridView.DataBind();

                    string courseName = coursesDropDown.Items[coursesDropDown.SelectedIndex].Text;

                    gridViewHeader.Text = $"{courseName}";
                }
                else
                {
                    message.Text = "Please select a course from the list.";
                }
            }
            catch (Exception ex)
            {
                message.Text = $"Unexpected errors have occured: {ex.Message}";
            }
        }


        #region Add - Assessment Form
        protected void add_Click(object sender, EventArgs e)
        {            

            if (IsValid)
            {
                try
                {               

                    PlannedAssessment newAssessment = new PlannedAssessment();

                    newAssessment.Name = name.Text;

                    int temp;
                    if (int.TryParse(typeList.SelectedValue, out temp))
                        newAssessment.AssessmentTypeID = temp;

                    newAssessment.Description = string.IsNullOrWhiteSpace(desc.Text) ? null : desc.Text;

                    newAssessment.CourseID = filteredCourses.SelectedValue;

                    short value;
                    if (short.TryParse(weight.Text, out value))
                        newAssessment.Weight = value;

                    newAssessment.RequiredPass = requiredPass.Checked;

                    PlannedAssessmentsController controller = new PlannedAssessmentsController();
                    int id = controller.AddAsessment(newAssessment);

                    addErrors.Text = $"New Assessment with ID:{id} added.";

                    clearForm();

                }
                catch (Exception ex)
                {
                    string errors = GetInnerException(ex);
                    addErrors.Text = $"Unexpected errors have occured: {errors}";
                }
            }
        }

        protected void courseFilter_Click(object sender, EventArgs e)
        {
            try
            {
                if (filterQuery.Text != string.Empty)
                {
                    CoursesController controller = new CoursesController();

                    filteredCourses.DataSource = controller.LookupCourseByPartialName(filterQuery.Text);
                    filteredCourses.DataTextField = nameof(Course.CourseName);
                    filteredCourses.DataValueField = nameof(Course.CourseID);
                    filteredCourses.DataBind();

                    filteredCourses.Items.Insert(0, new ListItem("Select a Course", ""));
                }
                else
                {
                    addErrors.Text = "Please enter course name or partial name for the search.";
                }
            }
            catch (Exception ex)
            {
                addErrors.Text = $"Unexpected errors have occured: {ex.Message}";
            }
        }
        #endregion

        protected void AssessmentsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AssessmentsGridView.PageIndex = e.NewPageIndex;

            PlannedAssessmentsController controller = new PlannedAssessmentsController();
            var assessments = controller.GetAssessmentsByCourseId(coursesDropDown.SelectedValue);
            AssessmentsGridView.DataSource = assessments;
            AssessmentsGridView.DataBind();
        }
    }
}