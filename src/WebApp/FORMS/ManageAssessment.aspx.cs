using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Star_TEDSystem.BLL;
using Star_TEDSystem.ENTITIES;

namespace WebApp.FORMS
{
    public partial class ManageAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Message.Text = string.Empty;

            if (!IsPostBack)
            {
                LoadAssessmentInfo();
                populateAssessmentTypeDropDown();
            }
        }

        private string GetInnerException(Exception ex)
        {
            Exception current = ex;
            while (current.InnerException != null)
                current = current.InnerException;
            return current.Message;
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

        private void LoadAssessmentInfo ()
        {
            int assessmentId;
            if (int.TryParse(Request.QueryString[nameof(assessmentId)], out assessmentId))
            {
                PlannedAssessmentsController controller = new PlannedAssessmentsController();
                var assessment = controller.GetAsssessment(assessmentId);

                AssessID.Text = assessment.AssessmentID.ToString();
                name.Text = assessment.Name;
                typeList.SelectedValue = assessment.AssessmentTypeID.ToString();
                desc.Text = string.IsNullOrWhiteSpace(assessment.Description) ? null : assessment.Description;

                CoursesController cntrlr = new CoursesController();
                var course = cntrlr.GetCourse(assessment.CourseID);
                courseName.Text = course.CourseName;

                weight.Text = assessment.Weight.ToString();
                requiredPass.Checked = assessment.RequiredPass;

            }
            else
            {
                Response.Redirect($"~/Forms/CRUD.aspx");
            }

          
        }

        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid)
                {
                    PlannedAssessment updated = new PlannedAssessment();

                    int temp;
                    if (int.TryParse(AssessID.Text, out temp))
                        updated.AssessmentID = temp;

                    updated.Name = name.Text;

                    if (int.TryParse(typeList.SelectedValue, out temp))
                        updated.AssessmentTypeID = temp;
                    
                    updated.Description = string.IsNullOrWhiteSpace(desc.Text) ? null : desc.Text;

                    short value;
                    if (short.TryParse(weight.Text, out value))
                        updated.Weight = value;

                    updated.RequiredPass = requiredPass.Checked;

                    PlannedAssessmentsController controller = new PlannedAssessmentsController();
                    var assessment = controller.GetAsssessment(int.Parse(AssessID.Text));

                    updated.CourseID = assessment.CourseID;
                    controller.Update(updated);

                    Message.Text = $"Assessment {AssessID.Text} updated.";
                }
            }
            catch (Exception ex)
            {
                string details = GetInnerException(ex);
                Message.Text = $"Unexpected errors have occured: {details}";
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(AssessID.Text);

                PlannedAssessmentsController controller = new PlannedAssessmentsController();
                controller.Delete(id);

                Message.Text = $"Assessment {AssessID.Text} has been deleted.";

                AssessID.Text = string.Empty;
                name.Text = string.Empty;
                typeList.SelectedIndex = 0;
                desc.Text = string.Empty;
                courseName.Text = string.Empty;
                weight.Text = string.Empty;
                requiredPass.Checked = false;

                // redirect to CRUD page after successful Delete
                Response.AddHeader("REFRESH", "1;URL=CRUD.aspx");

            }
            catch (Exception ex)
            {
                string details = GetInnerException(ex);
                Message.Text = $"Unexpected errors have occured: {details}. Assessment Description marked \"DELETED\" instead";

                PlannedAssessment updated = new PlannedAssessment();

                // handle Delete exceptions by marking description as DELETED
                int temp;
                if (int.TryParse(AssessID.Text, out temp))
                    updated.AssessmentID = temp;

                updated.Name = name.Text;

                if (int.TryParse(typeList.SelectedValue, out temp))
                    updated.AssessmentTypeID = temp;

                updated.Description = "DELETED";

                short value;
                if (short.TryParse(weight.Text, out value))
                    updated.Weight = value;

                updated.RequiredPass = requiredPass.Checked;

                PlannedAssessmentsController controller = new PlannedAssessmentsController();
                var assessment = controller.GetAsssessment(int.Parse(AssessID.Text));

                updated.CourseID = assessment.CourseID;
                controller.Update(updated);

            }
        }
    }
}