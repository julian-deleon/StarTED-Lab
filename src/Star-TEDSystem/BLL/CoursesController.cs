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
    public class CoursesController
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Course> LookupCourseByPartialName(string partial)
        {
            using (var context =  new Star_TEDContext())
            {
                List<Course> result;

                var courses = context.Database.SqlQuery<Course>("EXEC Courses_FindByPartialName {0}", partial);

                result = courses.ToList();
                return result;
            }
        }

        public Course GetCourse(string courseId)
        {
            using (var context = new Star_TEDContext())
            {
                Course found = context.Courses.Find(courseId);
                return found;
            }
        }

        public List<Course> ListAllCourses()
        {
            using (var context = new Star_TEDContext())
            {
                return context.Courses.ToList();
            }
        }
    }
}