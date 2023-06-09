﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Star_TEDSystem.ENTITIES
{
    public class Course
    {
       
        public string CourseID { get; set; }
        public string CourseName { get; set; }
        public decimal Credits { get; set; }
        public int? TotalHours { get; set; }
        public int? ClassroomType { get; set; }
        public int Term { get; set; }
        public decimal Tuition { get; set; }
        public string Description { get; set; }
    }
}