using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.FORMS
{
    public partial class Query : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            message.Text = string.Empty;

        }

        protected void courseSearch_Click(object sender, EventArgs e)
        {

            coursesDropDown.Items.Clear();

            coursesDropDown.Items.Insert(0, new ListItem("Select a Course", ""));
        }

        protected void coursesDataSource_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Exception innermost = e.Exception;

                while (innermost.InnerException != null)
                {
                    innermost = innermost.InnerException;     
                }

                message.Text = innermost.Message;
                e.ExceptionHandled = true;
            }
        }
    }
}