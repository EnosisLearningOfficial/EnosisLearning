using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

    namespace ENOSISLEARNING
    {
        public partial class Feedback_Form : System.Web.UI.Page
        {
         protected int overallRating;
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["CONN_ENOSISLEARNING"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Feedback_Data (Name, Email, ContactNo, CommunicationSkills, PreparednessOfSubject, PresentationSkills, KnowledgeAboutSubject, ProblemSolvingSkills, Punctuality, OverallBehaviour, CommentsSuggestions, OverallRating) VALUES (@Name, @Email, @ContactNo, @CommunicationSkills, @PreparednessOfSubject, @PresentationSkills, @KnowledgeAboutSubject, @ProblemSolvingSkills, @Punctuality, @OverallBehaviour, @CommentsSuggestions, @OverallRating)";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Name", txtName.Text);
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);
                            cmd.Parameters.AddWithValue("@CommunicationSkills", GetSelectedValue(rblCommunicationSkillsVG, rblCommunicationSkillsG, rblCommunicationSkillsF, rblCommunicationSkillsP, rblCommunicationSkillsVP));
                            cmd.Parameters.AddWithValue("@PreparednessOfSubject", GetSelectedValue(rblPreparednessOfSubjectVG, rblPreparednessOfSubjectG, rblPreparednessOfSubjectF, rblPreparednessOfSubjectP, rblPreparednessOfSubjectVP));
                            cmd.Parameters.AddWithValue("@PresentationSkills", GetSelectedValue(rblPresentationSkillsVG, rblPresentationSkillsG, rblPresentationSkillsF, rblPresentationSkillsP, rblPresentationSkillsVP));
                            cmd.Parameters.AddWithValue("@KnowledgeAboutSubject", GetSelectedValue(rblKnowledgeAboutSubjectVG, rblKnowledgeAboutSubjectG, rblKnowledgeAboutSubjectF, rblKnowledgeAboutSubjectP, rblKnowledgeAboutSubjectVP));
                            cmd.Parameters.AddWithValue("@ProblemSolvingSkills", GetSelectedValue(rblProblemSolvingSkillsVG, rblProblemSolvingSkillsG, rblProblemSolvingSkillsF, rblProblemSolvingSkillsP, rblProblemSolvingSkillsVP));
                            cmd.Parameters.AddWithValue("@Punctuality", GetSelectedValue(rblPunctualityVG, rblPunctualityG, rblPunctualityF, rblPunctualityP, rblPunctualityVP));
                            cmd.Parameters.AddWithValue("@OverallBehaviour", GetSelectedValue(rblOverallBehaviourVG, rblOverallBehaviourG, rblOverallBehaviourF, rblOverallBehaviourP, rblOverallBehaviourVP));
                            cmd.Parameters.AddWithValue("@CommentsSuggestions", txtCommentsSuggestions.Text);
                            cmd.Parameters.AddWithValue("@OverallRating", Request.Form["overallRating"]);

                            conn.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Feedback submitted successfully!";
                            }
                            else
                            {
                                lblMessage.Text = "An error occurred while submitting feedback.";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }





        private string GetSelectedValue(params RadioButton[] radioButtons)
        {
            foreach (var radioButton in radioButtons)
            {
                if (radioButton.Checked)
                {
                    return radioButton.Text;
                }
            }
            return string.Empty;
        }

        protected void rblCommunicationSkills_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void rblCommunicationSkills_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
