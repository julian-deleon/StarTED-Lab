using Star_TEDSystem.ENTITIES;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Star_TEDSystem.DAL
{
    public class Star_TEDContext : DbContext
    {
        public Star_TEDContext() : base("name=StarTEDDb")
        {
            Database.SetInitializer<Star_TEDContext>(null);
        }

        public DbSet<Course> Courses { get; set; }
        public DbSet<AssessmentType> AssessmentTypes { get; set; }
        public DbSet<PlannedAssessment> PlannedAssessments { get; set; }

    }
}