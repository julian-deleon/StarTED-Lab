using Star_TEDSystem.ENTITIES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Star_TEDSystem.DAL;
using System.ComponentModel;

namespace Star_TEDSystem.BLL
{
    [DataObject]
    public class AssessmentTypeController
    {

        public List<AssessmentType> ListAllAssessmentTypes()
        {
            using (var context = new Star_TEDContext())
            {
                return context.AssessmentTypes.ToList();
            }
        }
    }
}