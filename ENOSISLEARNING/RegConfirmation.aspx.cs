using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.IO;
using Org.BouncyCastle.Asn1.Ocsp;

namespace ENOSISLEARNING
{
    public partial class RegConfirmation : System.Web.UI.Page
    {
        string CONNSTRING = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();
        SqlConnection sconn = null;

        private void ShowDetails(int RegNo)
        {
            if (Session["CANDIDATENAME"] != null)
            {
                hr1.InnerText = hr1.InnerText + " " + Session["CANDIDATENAME"].ToString() + ",";

                lblCandidateName.Text = Session["CANDIDATENAME"].ToString();
            }
            else
            {
               /* if (Session["STUDNAME"] != null)
                {
                    hr1.InnerText = hr1.InnerText + " " + Session["STUDNAME"].ToString() + ",";

                    lblCandidateName.Text = Session["STUDNAME"].ToString();
                }*/
            }


            string QUERY1 = "SELECT CC.COURSEID,CD.COURSENAME FROM CANDIDATES_COURSES CC INNER JOIN COURSES_DETAIL CD ON CC.COURSEID = CD.COURSEID WHERE CC.CANDIDATEID=" + RegNo;
            SqlDataAdapter adap1 = new SqlDataAdapter(QUERY1, sconn);
            DataTable dt1 = new DataTable();
            adap1.Fill(dt1);
            string message = "";

            for (int r = 0; r < dt1.Rows.Count; r = r + 1)
            {
                if (message.Length > 0)
                {
                    message = message + "," + dt1.Rows[r]["COURSENAME"].ToString();
                }
                else
                {
                    message = dt1.Rows[r]["COURSENAME"].ToString();
                }
            }
            lblEnrolledCourses.Text = message.ToString();
            if (message.Length > 0)
            {
                sconn.Open();
                string str = "SELECT SUM(TOTALFEES) FROM CANDIDATES WHERE CANDIDATE_CODE=" + RegNo;
                SqlCommand COMM1 = new SqlCommand(str, sconn);
                object obj = COMM1.ExecuteScalar();
       
                if (obj != null && obj.ToString().Length > 0)
                {
                    double fees = Convert.ToDouble(obj.ToString());
                    lblTotalFees.Text = lblTotalFees.Text + " = " + fees.ToString();
                }
             
           
                string str1 = "select SUM(FEESAMOUNT) from CANDIDATE_FEESDETAIL where STATUS='PAID' AND CANDIDATEID=" + RegNo;
                SqlCommand COMM2 = new SqlCommand(str1, sconn);
                object obj1 = COMM2.ExecuteScalar();
               sconn.Close();
                if (obj1 != null && obj1.ToString().Length > 0)
                {
                    double paidfees = Convert.ToDouble(obj1.ToString());
                    lblPaidFees.Text = lblPaidFees.Text + " = " + paidfees.ToString();
                }

            }
            else
            {
               
            }

         



        }
       

        protected void Page_Load(object sender, EventArgs e)
        {

            try { 
            
            if (Session["USERNAME"] == null)
            {
                divfees.Visible = false;
                hrfees.Visible = false;
                btnFeesDetails.Visible = false;
                //Response.Redirect("Login.aspx");
            }
            else
            {
                divfees.Visible = true;
                hrfees.Visible = true;
                btnFeesDetails.Visible = true;

            }

            sconn = new SqlConnection(CONNSTRING);
                int RegNo = 0;
                if (!Page.IsPostBack)
                {
                   

                 
                   if (Request.QueryString["Id"] != null)
                    {
                        RegNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
                       string url = "EnosisRegistration.aspx?Id=" + RegNo + "";
                        string baseurl = CommonFunction.GetSiteRootUrl();
                        string loginurl = baseurl + "//" + url;
                        lblRegNo.Text = RegNo.ToString();

                        hykRegUrl.Text = url;// "http://www.enosislearning.com/EnosisRegistration.aspx?Id=" + RegNo;
                        hykRegUrl.NavigateUrl = url;// "http://www.enosislearning.com/EnosisRegistration?Id=" + RegNo;
                       
                    }
                  string previousPageName = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath);
                    BindGrid();
                    RegNo = Convert.ToInt32(lblRegNo.Text);
                    ShowDetails(RegNo);
                    if (previousPageName.Contains("EnosisRegistration.aspx"))
                    {
                        grvCandidatesFees.EditIndex = 0;
                    }
                    
                   
               }
                else
                {
                    if (Request.QueryString["Id"] != null)
                    {
                        RegNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
                       string url = "EnosisRegistration.aspx?Id=" + RegNo + "";
                        string baseurl = CommonFunction.GetSiteRootUrl();
                        string loginurl = baseurl + "//" + url;
                        lblRegNo.Text = RegNo.ToString();
                       
                        hykRegUrl.Text = url;// "http://www.enosislearning.com/EnosisRegistration.aspx?Id=" + RegNo;
                        hykRegUrl.NavigateUrl = url;// "http://www.enosislearning.com/EnosisRegistration?Id=" + RegNo;
                        BindGrid();
                        ShowDetails(RegNo);
                    }
                }
               
                
            }
            


            catch (Exception ex)
            {
                //lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }
        }


        

        private void BindGrid()
        {
            try
            {
                int RegNo = Convert.ToInt32(lblRegNo.Text);
                string constr = System.Configuration.ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ToString();


                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from CANDIDATE_FEESDETAIL WHERE CANDIDATEID=" + RegNo))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                grvCandidatesFees.DataSource = dt;
                                grvCandidatesFees.DataBind();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }

        protected void grvCandidatesFees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                grvCandidatesFees.EditIndex = e.NewEditIndex;
                BindGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
           
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }
        }

        

        protected void grvCandidatesFees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow grv = (GridViewRow)grvCandidatesFees.Rows[e.RowIndex];
              
            
                int ReceiptId = Convert.ToInt32(grvCandidatesFees.DataKeys[e.RowIndex].Value);
                int CanId = Convert.ToInt32(lblRegNo.Text);
                TextBox txtFeesType = (TextBox)grv.FindControl("txtEFeesType");
                TextBox txtFeesAmount = (TextBox)grv.FindControl("txtEFeesAmount");
                TextBox txtFeesDueDate = (TextBox)grv.FindControl("txtEFeesDueDate");
                DropDownList drpStatus = (DropDownList)grv.FindControl("drpStatus");
                TextBox txtComments = (TextBox)grv.FindControl("txtEComments");

                string status = drpStatus.SelectedItem.Text;
                double fees = Convert.ToDouble(txtFeesAmount.Text);
                string[] dates = null;
                if (txtFeesDueDate.Text.ToString().Contains('-') == true)
                {

                    dates = txtFeesDueDate.Text.Split('-');
                }
                else if (txtFeesDueDate.Text.ToString().Contains('/') == true)
                {
                    dates = txtFeesDueDate.Text.Split('/');
                }

                string dobdate = dates[1].ToString() + "/" + dates[0].ToString() + "/" + dates[2].ToString();

            
                sconn.Open();
           
                string query = "UPDATE CANDIDATE_FEESDETAIL SET [FEESTYPE] = '" + txtFeesType.Text + "',[FEESAMOUNT]=" + fees + ",[FEESDUEDATE]='" + dobdate + "',[STATUS]='" + status + "',[COMMENTS]='" + txtComments.Text + "',[UPDATEDDATE]=GETDATE() WHERE RECEIPTID=" + ReceiptId;
                SqlCommand cmd = new SqlCommand(query, sconn);

                int result = cmd.ExecuteNonQuery();
                sconn.Close();
                grvCandidatesFees.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
      
            string pageName = System.IO.Path.GetFileName(Request.Path);
            dbconnect.LogError(pageName, ex.Message);


             }
        }

            
        

        protected void grvCandidatesFees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                grvCandidatesFees.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
 
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }


        }

        protected void grvCandidatesFees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int ReceiptId = Convert.ToInt32(grvCandidatesFees.DataKeys[0].Value);

                sconn.Open();
          
                string query = "DELETE FROM CANDIDATE_FEESDETAIL WHERE RECEIPTID=" + ReceiptId;
                SqlCommand cmd = new SqlCommand(query, sconn);

                int result = cmd.ExecuteNonQuery();
                sconn.Close();
                grvCandidatesFees.EditIndex = -1;
                BindGrid();
            }
            catch (Exception ex)
            {
            string pageName = System.IO.Path.GetFileName(Request.Path);
            dbconnect.LogError(pageName, ex.Message);

            }
            
        }

        protected void grvCandidatesFees_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    int CanId = Convert.ToInt32(lblRegNo.Text);
                    TextBox txtFeesType = (TextBox)grvCandidatesFees.FooterRow.FindControl("txtFFeesType");
                    TextBox txtFeesAmount = (TextBox)grvCandidatesFees.FooterRow.FindControl("txtFFeesAmount");
                    TextBox txtFeesDueDate = (TextBox)grvCandidatesFees.FooterRow.FindControl("txtFotFeesDueDate");
              
                    DropDownList drpFStatus = (DropDownList)grvCandidatesFees.FooterRow.FindControl("drpFStatus");
                    string status = drpFStatus.SelectedItem.Text;

                    TextBox txtFComments = (TextBox)grvCandidatesFees.FooterRow.FindControl("txtFComments");


                
                    double fees = Convert.ToDouble(txtFeesAmount.Text);
                
                    string[] dates = null;
                    if (txtFeesDueDate.Text.ToString().Contains('-') == true)
                    {

                        dates = txtFeesDueDate.Text.Split('-');
                    }
                    else if (txtFeesDueDate.Text.ToString().Contains('/') == true)
                    {
                        dates = txtFeesDueDate.Text.Split('/');
                    }


                    string date = dates[1].ToString() + "/" + dates[0].ToString() + "/" + dates[2].ToString();

                    sconn.Open();
              
                    string query = "INSERT INTO CANDIDATE_FEESDETAIL([CANDIDATEID],[FEESTYPE],[FEESAMOUNT],[FEESDUEDATE],[STATUS],[COMMENTS]) VALUES(" + CanId + ",'" + txtFeesType.Text + "'," + fees + ",'" + date + "','" + status + "','" + txtFComments.Text + "')";
                    SqlCommand cmd = new SqlCommand(query, sconn);

                    int result = cmd.ExecuteNonQuery();
                    sconn.Close();
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
 
                string pageName = System.IO.Path.GetFileName(Request.Path);
                dbconnect.LogError(pageName, ex.Message);


            }
        }



        

        protected void grvCandidatesFees_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
      
        protected void btnFeesDetails_Click(object sender, EventArgs e)
        {
            genrateRegistrationPdf();
          Response.Redirect("~/SearchCandidate.aspx");
         
        }

        public void genrateRegistrationPdf()
        {
            dbconnect db = new dbconnect();
            int RegNo=0;
            if (Request.QueryString["Id"] != null)
            {
                RegNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
            }
            DataTable dt = db.fetchdetails(RegNo);
            DataTable dt1 = db.feesdetails(RegNo);
            Response.ContentType = "application/pdf";
            string file = dt.Rows[0][1].ToString() + "_" + DateTime.Now.ToString("ddMMyyyyHHss") + ".pdf";
            ViewState["filename"] = file;
            Response.AddHeader("content-disposition", "attachment;filename=" + file);


            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
            string folderpath = Server.MapPath(@"~/RegistrationForm/") + file;
            PdfWriter.GetInstance(pdfDoc, new FileStream(folderpath, FileMode.Create));

            pdfDoc.Open();
            Font font1 = new Font(FontFactory.GetFont("Broadway", 40f, Font.BOLDITALIC, new BaseColor(37, 56, 89, 1)));
            Font font2 = new Font(FontFactory.GetFont("Broadway", 12f, Font.NORMAL, new BaseColor(37, 56, 89, 1)));
            Chunk cch = new Chunk("\n Registration Form", font1);
            cch.SetUnderline(0.5f, -1.5f);
            Chunk cch1 = new Chunk("\n\n Personal info", font2);
            cch1.SetUnderline(0.5f, -1.5f);
            Paragraph heading = new Paragraph();
            heading.Add(cch);
            heading.Add(cch1);
            heading.SpacingBefore = 40f;
            heading.SpacingAfter = 2f;
            heading.Alignment = Element.ALIGN_CENTER;
            PdfPTable table = new PdfPTable(2);
            table.SpacingBefore = 2f;
            PdfPCell cell = new PdfPCell(new Phrase("Student Name: " + dt.Rows[0][1].ToString()));

            cell.Colspan = 2;

            cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            table.AddCell("Mobile number: " + dt.Rows[0][4].ToString());

            table.AddCell("DOB: " + dt.Rows[0][3].ToString());

            table.AddCell("Email ID: " + dt.Rows[0][5].ToString());

            table.AddCell("Gender: " + dt.Rows[0][2].ToString());

            table.AddCell("Qualification: " + dt.Rows[0][7].ToString());

            table.AddCell("Experience: " + dt.Rows[0][9].ToString()+"yr "+dt.Rows[0][10].ToString()+"months");

            Chunk course = new Chunk("Course Details: " + dt.Rows[0][6].ToString(), font2);
            course.SetUnderline(0.5f, -1.5f);
            Paragraph coursepara = new Paragraph();

            coursepara.Add(course);
            coursepara.SpacingBefore = 20f;
            coursepara.SpacingAfter = 2f;
            coursepara.Alignment = Element.ALIGN_CENTER;

            PdfPTable coursetable = new PdfPTable(2);
            coursetable.SpacingBefore = 2f;

            coursetable.AddCell("Course number: "+dt.Rows[0][11].ToString());

            coursetable.AddCell("Training Program: "+dt.Rows[0][6].ToString());

            coursetable.AddCell("Batch Timing: ");

            coursetable.AddCell("Batch Started From: ");

            coursetable.AddCell("Fees Payment Mode: ");

            coursetable.AddCell("Total Fees: " + dt.Rows[0][8].ToString());
            Chunk fees = new Chunk("Fees Structure: ", font2);
            fees.SetUnderline(0.5f, -1.5f);
            Paragraph feespara = new Paragraph();

            feespara.Add(fees);
            feespara.SpacingBefore = 10f;
            feespara.SpacingAfter = 2f;
            feespara.Alignment = Element.ALIGN_CENTER;

            PdfPTable feestable = new PdfPTable(3);
            feestable.SpacingBefore = 2f;

            feestable.AddCell("Particulars");

            feestable.AddCell("Amount");

            feestable.AddCell("Date");

    
           
          
            for (int i=0;i<dt1.Rows.Count;i++)
            {
                switch (i)
                {
                    case 0: feestable.AddCell("Registration Fees");
                        break;
                    case 1: feestable.AddCell("1st Installment");
                        break;
                    case 2: feestable.AddCell("2nd Installment");
                        break;
                    case 3: feestable.AddCell("3rd Installment");
                        break;
                    case 4: feestable.AddCell("4th Installment");
                        break;
                    case 5: feestable.AddCell("5th Installment");
                        break;
                    case 6: feestable.AddCell("6th Installment");
                        break;
                    case 7: feestable.AddCell("7th Installment");
                        break;
                    case 8: feestable.AddCell("8th Installment");
                        break;
                    case 9: feestable.AddCell("9th Installment");
                        break;
                    case 10: feestable.AddCell("10th Installment");
                        break;
                }
            
                feestable.AddCell(Convert.ToString(dt1.Rows[i][3]));
                feestable.AddCell(Convert.ToString(dt1.Rows[i][4]));
            }
           
           
            PdfPCell feescell = new PdfPCell(new Phrase("Total Fees: " + dt.Rows[0][8]));

            feescell.Colspan = 3;

            feescell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            feestable.AddCell(feescell);


            Chunk student = new Chunk("Student CheckList", font2);
            student.SetUnderline(0.5f, -1.5f);
            Paragraph studpara = new Paragraph();

            studpara.Add(student);
            studpara.SpacingBefore = 10f;
            studpara.SpacingAfter = 2f;
            studpara.Alignment = Element.ALIGN_CENTER;

            PdfPTable studtable = new PdfPTable(5);
            studtable.SpacingBefore = 2f;

            studtable.AddCell("Sr. No.");

            studtable.AddCell("Particulars");

            studtable.AddCell("CheckList");

            studtable.AddCell("Status");
            studtable.AddCell("Sign");
            PdfPCell srnocell = new PdfPCell(new Phrase("1"));

            srnocell.Rowspan = 3;

            srnocell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(srnocell);
            PdfPCell pcell = new PdfPCell(new Phrase("Support Material"));

            pcell.Rowspan = 3;

            pcell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(pcell);
            studtable.AddCell("Setup Recieved");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Soft Copy of Study Material");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Hard Copy of Study Material");
            studtable.AddCell(" ");
            studtable.AddCell(" ");

            PdfPCell srno2cell = new PdfPCell(new Phrase("2"));

            srno2cell.Rowspan = 5;

            srno2cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(srno2cell);
            PdfPCell p2cell = new PdfPCell(new Phrase("Placement Assistance"));

            p2cell.Rowspan = 5;

            p2cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(p2cell);
            studtable.AddCell("Resume Prepared");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Job Portal reviewed updated");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Interview Session Attended");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Interview Test Conducted");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Interview Mockup Conducted");
            studtable.AddCell(" ");
            studtable.AddCell(" ");

            PdfPCell srno3cell = new PdfPCell(new Phrase("3"));

            srno3cell.Rowspan = 3;

            srno3cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(srno3cell);
            PdfPCell p3cell = new PdfPCell(new Phrase("Assignment And Test"));

            p3cell.Rowspan = 3;

            p3cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(p3cell);
            studtable.AddCell("Assignment 1");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Assignment 2");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Final Test");
            studtable.AddCell(" ");
            studtable.AddCell(" ");

            PdfPCell srno4cell = new PdfPCell(new Phrase("4"));

            srno4cell.Rowspan = 2;

            srno4cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(srno4cell);
            PdfPCell p4cell = new PdfPCell(new Phrase("Feedback"));

            p4cell.Rowspan = 2;

            p4cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
            studtable.AddCell(p4cell);
            studtable.AddCell("Feedback Form");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            studtable.AddCell("Upgradation");
            studtable.AddCell(" ");
            studtable.AddCell(" ");
            PdfPTable signaturetable = new PdfPTable(3);
            signaturetable.SpacingBefore = 30f;
            PdfPCell studsigncell = new PdfPCell(new Phrase("_____________\n\n Student Signature"));
            studsigncell.Border = 0;
            studsigncell.VerticalAlignment = Element.ALIGN_BOTTOM;
            studsigncell.HorizontalAlignment = Element.ALIGN_CENTER;
            signaturetable.AddCell(studsigncell);
            string imgpath = Server.MapPath(".") + "/Images/enosislogo.png";


            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(imgpath);
            logo.ScaleToFit(100, 50);
            PdfPCell studlogo = new PdfPCell(logo);
            studlogo.Border = 0;
            studlogo.HorizontalAlignment = Element.ALIGN_CENTER;
            studlogo.VerticalAlignment = Element.ALIGN_BOTTOM;
            signaturetable.AddCell(studlogo);
            PdfPCell cordsigncell = new PdfPCell(new Phrase("________________\n\n Cordinator Signature"));
            cordsigncell.Border = 0;
            cordsigncell.VerticalAlignment = Element.ALIGN_BOTTOM;
            cordsigncell.HorizontalAlignment = Element.ALIGN_CENTER;
            signaturetable.AddCell(cordsigncell);



            pdfDoc.NewPage();
            pdfDoc.Add(heading);
            pdfDoc.Add(table);
            pdfDoc.Add(coursepara);
            pdfDoc.Add(coursetable);
            pdfDoc.Add(feespara);
            pdfDoc.Add(feestable);
            pdfDoc.Add(studpara);
            pdfDoc.Add(studtable);
            pdfDoc.Add(signaturetable);
            pdfDoc.Close();

            updateRegistrationStatus(dt.Rows[0][1].ToString());







        }
        protected void updateRegistrationStatus(string name)
        {

            dbconnect db = new dbconnect();

            if (ViewState["filename"] != null)
            {
                string file = ViewState["filename"].ToString();
               
                int i = db.updateRegistrationStatus(name, file);
            }

        }
       

        
    }
}