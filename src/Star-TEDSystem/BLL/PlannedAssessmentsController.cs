using Star_TEDSystem.DAL;
using Star_TEDSystem.ENTITIES;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace Star_TEDSystem.BLL
{
    [DataObject]
    public class PlannedAssessmentsController
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<PlannedAssessment> GetAssessmentsByCourseId (string courseId)
        {
            using (var context = new Star_TEDContext())
            {
                List<PlannedAssessment> result;

                var assessments = context.Database.SqlQuery<PlannedAssessment>("EXEC PlannedAssessments_FindByCourse {0}", courseId);

                result = assessments.ToList();
                return result;
            }
        }

        public PlannedAssessment GetAsssessment (int assessId)
        {
            using (var context = new Star_TEDContext())
            {
                PlannedAssessment found = context.PlannedAssessments.Find(assessId);
                return found;
            }
        }


        #region CRUD Methods

        public int AddAsessment (PlannedAssessment data)
        {
            using (var context = new Star_TEDContext())
            {
                context.PlannedAssessments.Add(data);
                context.SaveChanges();
                return data.AssessmentID;
            }
        }

        public void Update (PlannedAssessment existing)
        {
            using (var context = new Star_TEDContext())
            {
                var toUpdate = context.Entry(existing);
                toUpdate.State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        public void Delete (int assessmentId)
        {
            using (var context = new Star_TEDContext())
            {
                var match = context.PlannedAssessments.Find(assessmentId);
                context.PlannedAssessments.Remove(match);
                context.SaveChanges();
            }
        }

        #endregion

    }
}