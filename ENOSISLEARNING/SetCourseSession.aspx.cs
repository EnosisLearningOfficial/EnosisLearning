using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class SetCourseSession : System.Web.UI.Page
    {
        // In SetCourseSession.aspx.cs (Page_Load)
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var reader = new System.IO.StreamReader(Request.InputStream))
            {
                string json = reader.ReadToEnd();
                var data = new JavaScriptSerializer().Deserialize<Dictionary<string, string>>(json);
                if (data.ContainsKey("courseId"))
                {
                    Session["CourseId"] = data["courseId"];
                }
            }
        }
    }
}