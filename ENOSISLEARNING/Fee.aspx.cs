using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class Fee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString.ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAME"] != null && Session["CANDID"] != null)
            {
                lbltxt.Text = "Welcome " + Session["USERNAME"].ToString();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                //FeeGridView();
            }
        }
        //Bind Fee GidView//
        [WebMethod]
        public static List<FeeRecord> GetFee()
        {
            List<FeeRecord> records = new List<FeeRecord>();

            try
            {
                // Get Candidate Code from Session
                string CANDIDATE_CODE = HttpContext.Current.Session["CANDID"]?.ToString();
                if (string.IsNullOrEmpty(CANDIDATE_CODE))
                {
                    throw new Exception("Session Expired. Please login again.");
                }

                // Database Connection
                string connStr = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = @"
                SELECT 
                    C.Candidate_Code, 
                    C.FullName AS FULLNAME, 
                    CF.RECEIPTID, 
                    CF.CREATEDDATE, 
                    CF.CANDIDATEID, 
                    CF.FEESAMOUNT, 
                    CF.FEESPAIDDATE, 
                    CF.FEESDUEDATE, 
                    CF.FEESTYPE, 
                    CF.STATUS 
                FROM Candidates C 
                JOIN CANDIDATE_FEESDETAIL CF 
                    ON C.Candidate_Code = CF.CANDIDATEID 
                WHERE C.Candidate_Code = @CandidateCode";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@CandidateCode", CANDIDATE_CODE);
                        con.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                records.Add(new FeeRecord
                                {
                                    CANDIDATE_CODE = dr["Candidate_Code"].ToString(),
                                    FULLNAME = dr["FULLNAME"].ToString(),
                                    RECEIPTID = dr["RECEIPTID"].ToString(),
                                    CREATEDDATE = dr["CREATEDDATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["CREATEDDATE"]).ToString("dd-MM-yyyy"),
                                    CANDIDATEID = dr["CANDIDATEID"].ToString(),
                                    FEESAMOUNT = dr["FEESAMOUNT"].ToString(),
                                    FEESPAIDDATE = dr["FEESPAIDDATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["FEESPAIDDATE"]).ToString("dd-MM-yyyy"),
                                    FEESDUEDATE = dr["FEESDUEDATE"] == DBNull.Value ? "" : Convert.ToDateTime(dr["FEESDUEDATE"]).ToString("dd-MM-yyyy"),
                                    FEESTYPE = dr["FEESTYPE"].ToString(),
                                    STATUS = dr["STATUS"].ToString(),
                                });
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error fetching data: " + ex.Message);
            }

            return records;
        }
        public class FeeRecord
        {
            public string CANDIDATE_CODE { get; set; }
            public string FULLNAME { get; set; }
            public string RECEIPTID { get; set; }
            public string CREATEDDATE { get; set; }
            public string CANDIDATEID { get; set; }
            public string FEESAMOUNT { get; set; }
            public string FEESPAIDDATE { get; set; }
            public string FEESDUEDATE { get; set; }
            public string FEESTYPE { get; set; }
            public string STATUS { get; set; }
        }
    }
}