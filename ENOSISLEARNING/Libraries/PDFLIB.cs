using System;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;



namespace ENOSISLEARNING
{
    public static class PDFLIB
    {
        public static iTextSharp.text.Font GetTahoma()
        {
            var fontName = "French";
            if (!FontFactory.IsRegistered(fontName))
            {
                var fontPath = Environment.GetEnvironmentVariable("SystemRoot") + "\\fonts\\FRSCRIPT.TTF.ttf";
                FontFactory.Register(fontPath);
            }
            return FontFactory.GetFont(fontName, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        }
        public static void GeneratePdf(string lblsname, string txtcourse, string txtsdate, string txtedate, string txtgrade)
        {


            string imageFilePath = HttpContext.Current.Server.MapPath(".") + "/img/cert_bg.png";
            // Page site and margin left, right, top, bottom is defined
            Rectangle r = new Rectangle(500f, 400f);
            r.BackgroundColor = new BaseColor(255, 255, 255, 1);
            Document pdfDoc = new Document(r);
            //Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, HttpContext.Current.Response.OutputStream);
            pdfDoc.Open();


            pdfDoc.SetMargins(0f, 0f, 0f, 0f);

            iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(imageFilePath);
            string imgpath = HttpContext.Current.Server.MapPath(".") + "/img/logo.png";
            string imgpath1 = HttpContext.Current.Server.MapPath(".") + "/img/sign.png";

            iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(imgpath);
            iTextSharp.text.Image sign = iTextSharp.text.Image.GetInstance(imgpath1);
            //Resize image depend upon your need
            //For give the size to image
            jpg.ScaleToFit(580f, 400f);
            sign.ScaleToFit(55f, 40f);
            //If you want to choose image as background then,

            jpg.Alignment = iTextSharp.text.Image.UNDERLYING;
            logo.ScaleToFit(80, 80);

            //If you want to give absolute/specified fix position to image.
            // jpg.SetAbsolutePosition(0,2000);
            Font font1 = new Font(FontFactory.GetFont("Broadway", 40f, Font.BOLDITALIC, new BaseColor(37, 56, 89, 1)));
            Font font4 = new Font(FontFactory.GetFont("sans-serif", 8f, new BaseColor(System.Drawing.Color.Black)));
            Font font3 = new Font(FontFactory.GetFont("sans-serif", 22f, new BaseColor(0, 100, 149, 1)));
            Font font5 = new Font(FontFactory.GetFont("sans-serif", 22f, new BaseColor(243, 146, 36, 1)));

            Font font2 = new Font(FontFactory.GetFont("Helvetica-Italic", 12f, Font.ITALIC, new BaseColor(7, 2, 2, 1)));
            Font font7 = new Font(FontFactory.GetFont("sans-serif", 12f, Font.BOLD, new BaseColor(7, 2, 2, 1)));

            Font font6 = new Font(FontFactory.GetFont("ITCEDSCR", 30f, Font.BOLD, new BaseColor(7, 2, 2, 1)));


         //   pdfDoc.Open();
            Chunk cch = new Chunk("CERTIFICATE", font1);
            Chunk cch1 = new Chunk("\n OF COMPLETION", font2);
            cch.setLineHeight(0.5f);
            Paragraph heading = new Paragraph();
            heading.Add(cch);
            heading.Add(cch1);
            heading.SpacingBefore = 20f;
            heading.SpacingAfter = 10f;
            heading.Alignment = Element.ALIGN_CENTER;

            pdfDoc.NewPage();
            Paragraph p1 = new Paragraph();
            Chunk p1c1 = new Chunk("enosis", font3);
            Chunk p1c2 = new Chunk(" learning", font5);
            p1.Add(p1c1);
            p1.Add(p1c2);

            p1.SpacingBefore = 10f;
            p1.SpacingAfter = -0.5f;
            p1.Alignment = Element.ALIGN_CENTER;
            Paragraph p2 = new Paragraph();
            Chunk p1c3 = new Chunk("Creating Software Professionals", font4);
            p2.Add(p1c3);
            p2.SetLeading(0f, 1f);
            p2.SpacingBefore = -0.5f;
            p2.SpacingAfter = 20f;
            p2.Alignment = Element.ALIGN_CENTER;
            Paragraph paragraph = new Paragraph();
            Chunk c1 = new Chunk("Rewards This Certificate of Proficiency to \n", font2);


            //Paragraph Text = new Paragraph("This is test file");
            //pdfDoc.Add(Text);

            Chunk c2 = new Chunk(lblsname, font6);
            Chunk c3 = new Chunk("\n for sucessfully completing the course of ", font2);
            Chunk c4 = new Chunk(txtcourse, font2);
            Chunk c5 = new Chunk("\n held from ", font2);
            Chunk c8 = new Chunk(txtsdate, font2);
            Chunk c9 = new Chunk(" to ", font2);
            Chunk c10 = new Chunk(txtedate, font2);
            Chunk c11 = new Chunk(" at Pune ", font2);
            Chunk c6 = new Chunk("and satisfying \n the qualifying requirements is", font2);
            Chunk c7 = new Chunk(" awarded with grade ", font2);
            Chunk c12 = new Chunk(txtgrade, font2);
            c2.SetUnderline(0.5f, -1.5f);

            c4.SetUnderline(0.5f, -1.5f);
            c10.SetUnderline(0.5f, -1.5f);
            c8.SetUnderline(0.5f, -1.5f);
            c12.SetUnderline(0.5f, -1.5f);
            c1.setLineHeight(30f);
            c2.setLineHeight(35f);
            c3.setLineHeight(35f);
            c4.setLineHeight(20f);
            c5.setLineHeight(20f);
            c6.setLineHeight(20f);
            c7.setLineHeight(20f);
            c8.setLineHeight(20f);
            c9.setLineHeight(20f);
            c10.setLineHeight(20f);
            c11.setLineHeight(20f);
            c12.setLineHeight(20f);

            paragraph.Add(c1);
            paragraph.Add(c2);
            paragraph.Add(c3);

            paragraph.Add(c4);
            paragraph.Add(c5);
            paragraph.Add(c8);
            paragraph.Add(c9);

            paragraph.Add(c10);
            paragraph.Add(c11);
            paragraph.Add(c6);
            paragraph.Add(c7);
            paragraph.Add(c12);
            paragraph.SpacingAfter = 10f;
            paragraph.Alignment = Element.ALIGN_CENTER;
            PdfPTable table = new PdfPTable(3);
            table.SpacingBefore = 20f;
            Phrase cc = new Phrase("Date of issue", font2);
            //Chunk ctext1 = new Chunk(DateTime.Now.ToShortDateString(), font7);
            Chunk ctext1 = new Chunk(txtedate, font7);

            ctext1.SetUnderline(0.5f, -1.5f);
            PdfPCell cell4 = new PdfPCell(new Phrase(ctext1));
            cell4.Border = 0;
            cell4.HorizontalAlignment = Element.ALIGN_CENTER;
            cell4.VerticalAlignment = Element.ALIGN_BOTTOM;
            PdfPCell cell = new PdfPCell(new Phrase("Date of issue \n", font7));
            cell.HorizontalAlignment = Element.ALIGN_CENTER;
            cell.Border = 0;
            cell.VerticalAlignment = Element.ALIGN_TOP;
            PdfPCell cell2 = new PdfPCell(new Phrase("Signatory \n", font7));
            cell2.Border = 0;
            cell2.HorizontalAlignment = Element.ALIGN_CENTER;
            cell2.VerticalAlignment = Element.ALIGN_TOP;
            PdfPCell cell5 = new PdfPCell(sign);

            cell5.Border = 0;
            cell5.HorizontalAlignment = Element.ALIGN_CENTER;
            cell5.VerticalAlignment = Element.ALIGN_BOTTOM;

            // cell2.Colspan = 2;
            PdfPCell cell3 = new PdfPCell(logo);
            cell3.Border = 0;
            cell3.Rowspan = 2;
            cell3.HorizontalAlignment = Element.ALIGN_CENTER;
            cell3.VerticalAlignment = Element.ALIGN_BOTTOM;
            table.AddCell(cell4);
            table.AddCell(cell3);

            table.AddCell(cell5);
            table.AddCell(cell);
            table.AddCell(cell2);

            pdfDoc.Add(jpg);
            pdfDoc.Add(p1);
            pdfDoc.Add(p2);
            pdfDoc.Add(heading);
            pdfDoc.Add(paragraph);
            pdfDoc.Add(table);
            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=Example.pdf");
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Write(pdfDoc);
            HttpContext.Current.Response.End();




        }
        
        public static void genrateRegistrationPdf(string studName, string Course, string Fees, string Mobile, string Gender, string DOB, string Email, string Qual, string Year, string Month)
        {
            try
            {
          
                HttpContext.Current.Response.ContentType = "application/pdf";
                string file = studName + "_" + DateTime.Now.ToString("ddMMyyyyHHss") + ".pdf";
                HttpContext.Current.Session["filename"] = file;
                HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + file);
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);

                string folderpath = HttpContext.Current.Server.MapPath(@"~/RegistrationForm/") + file;
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
                PdfPCell cell = new PdfPCell(new Phrase("Student Name: " + studName));

                cell.Colspan = 2;

                cell.HorizontalAlignment = 0; //0=Left, 1=Centre, 2=Right
                table.AddCell(cell);
                table.AddCell("Mobile number: " + Mobile);
                table.AddCell("DOB: " + DOB);
                table.AddCell("Email ID: " + Email);
                table.AddCell("Gender: " + Gender);
                table.AddCell("Qualification: " + Qual);
                table.AddCell("Experience: " + Year + "yr " + Month + "month");

                Chunk course = new Chunk("Course Details: " + Course, font2);
                course.SetUnderline(0.5f, -1.5f);
                Paragraph coursepara = new Paragraph();

                coursepara.Add(course);
                coursepara.SpacingBefore = 20f;
                coursepara.SpacingAfter = 2f;
                coursepara.Alignment = Element.ALIGN_CENTER;

                PdfPTable coursetable = new PdfPTable(2);
                coursetable.SpacingBefore = 2f;

                coursetable.AddCell("Course number: ");
                coursetable.AddCell("Training Program: ");
                coursetable.AddCell("Batch Timing: ");
                coursetable.AddCell("Batch Started From: ");
                coursetable.AddCell("Fees Payment Mode: ");

                coursetable.AddCell("Total Fees: " + Fees);
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

                feestable.AddCell("Registration Fees");
                feestable.AddCell("");
                feestable.AddCell("");
                feestable.AddCell("1st Installment");
                feestable.AddCell("");
                feestable.AddCell("");
                feestable.AddCell("2nd Installment");
                feestable.AddCell("");
                feestable.AddCell("");
                feestable.AddCell("3rd Installment");
                feestable.AddCell("");
                feestable.AddCell("");
                PdfPCell feescell = new PdfPCell(new Phrase("Total Fees: " + Fees));

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
                string imgpath = HttpContext.Current.Server.MapPath(".") + "/Images/enosislogo.png";


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
              
            }
            catch (Exception ex)
            {
         //       lblError.Text = ex.Message;
                string pageName = System.IO.Path.GetFileName(HttpContext.Current.Request.Path);
                dbconnect.LogError(pageName, ex.Message);

            }
        }


       


    }
}