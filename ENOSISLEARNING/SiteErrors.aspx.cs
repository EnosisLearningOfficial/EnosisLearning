using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class SiteErrors : System.Web.UI.Page
    {
        private void BindErrors()
        {

            string strcomm = "SELECT * FROM EXCEPTIONLOGS ORDER BY EXCEPTIONID DESC";
           // DataTable dtRef = new DataTable();
           // SqlDataAdapter adap = new SqlDataAdapter(strcomm, con);
            //adap.Fill(dtRef);
            grvErrors.DataSource = dbconnect.GetDataSet(strcomm);
            grvErrors.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindErrors();
            }
        }
    }
}