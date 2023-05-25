using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Star_TEDSystem.ENTITIES
{
    
    public class PlannedAssessment
    {
        [Key]
        public int AssessmentID { get; set; }
        public string Name { get; set; }
        public int? AssessmentTypeID { get; set; }
        public string Description { get; set; }
        public string CourseID { get; set; }
        public Int16 Weight { get; set; }
        public Boolean RequiredPass { get; set; }

    }
}