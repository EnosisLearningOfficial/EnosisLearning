using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ENOSISLEARNING
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTablesToDropDown();
            }
        }
      private void BindTablesToDropDown()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Query to get the table name along with the schema
                string query = "SELECT s.name + '.' + t.name AS TableName FROM sys.tables t INNER JOIN sys.schemas s ON t.schema_id = s.schema_id ORDER BY s.name, t.name";
                SqlCommand cmd = new SqlCommand(query, con);

                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();

                    // Bind the data to the DropDownList
                    DropDownList1.DataSource = dr;
                    DropDownList1.DataTextField = "TableName"; // The combined schema and table name
                    DropDownList1.DataValueField = "TableName"; // The value field to also contain the schema and table name
                    DropDownList1.DataBind();

                    // Insert a default item at the top
                    DropDownList1.Items.Insert(0, new ListItem("--Select Table--", "0"));
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTable = DropDownList1.SelectedValue;

            if (selectedTable != "0")
            {
                string primaryKey = GetPrimaryKeyForTable(selectedTable);
                if (!string.IsNullOrEmpty(primaryKey))
                {
                    GridView1.DataKeyNames = new string[] { primaryKey };
                    BindSelectedTableToGridView(selectedTable);
                }
                else
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind();
                }
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }
        private string GetPrimaryKeyForTable(string tableName)
        {
            string primaryKey = "";
            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT c.name FROM sys.index_columns ic " +
                               "INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id " +
                               "INNER JOIN sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id " +
                               "WHERE i.is_primary_key = 1 AND ic.object_id = OBJECT_ID(@TableName)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TableName", tableName); // TableName will include schema

                try
                {
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        primaryKey = result.ToString();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
            return primaryKey;
        }

       // Edit Mode
        private void BindSelectedTableToGridView(string tableName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = $"SELECT * FROM {tableName}"; // No need to modify as tableName now includes the schema
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();

                try
                {
                    con.Open();
                    da.Fill(dt);

                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    GridView1.BorderColor = System.Drawing.Color.White;
                    GridView1.BackColor = System.Drawing.Color.White;
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindSelectedTableToGridView(DropDownList1.SelectedValue);
        }

        // Cancel Edit
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindSelectedTableToGridView(DropDownList1.SelectedValue);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string selectedTable = DropDownList1.SelectedValue;

            // Retrieve the primary key value from the DataKeys collection
            string primaryKey = GridView1.DataKeys[e.RowIndex].Value.ToString();

            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Dictionary to hold the column names and their new values
            Dictionary<string, string> updatedValues = new Dictionary<string, string>();

            // Loop through the columns in the GridView (skipping the first column if it's the action buttons)
            for (int i = 1; i < row.Cells.Count - 1; i++) // Assuming the first column is the primary key or action column
            {
                // Get the column name for the current column index
                string columnName = GetColumnNameForTable(selectedTable, i - 1); // Adjust column index by -1 to match the DB

                // Get the TextBox control from the current cell
                TextBox textBox = row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault();
                if (textBox != null)
                {
                    // Store the new value from the TextBox in the dictionary
                    updatedValues[columnName] = textBox.Text;
                }
            }

            // Update the database with the new values
            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Construct the UPDATE query dynamically
                string updateQuery = $"UPDATE {selectedTable} SET ";
                foreach (var column in updatedValues)
                {
                    updateQuery += $"{column.Key} = @{column.Key},";
                }
                updateQuery = updateQuery.TrimEnd(','); // Remove the trailing comma
                updateQuery += $" WHERE {GetPrimaryKeyForTable(selectedTable)} = @PrimaryKey";

                SqlCommand cmd = new SqlCommand(updateQuery, con);
                // Add the updated values as parameters
                foreach (var column in updatedValues)
                {
                    cmd.Parameters.AddWithValue($"@{column.Key}", column.Value);
                }
                cmd.Parameters.AddWithValue("@PrimaryKey", primaryKey);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    GridView1.EditIndex = -1; // Reset edit index
                    BindSelectedTableToGridView(selectedTable); // Rebind GridView
                    ScriptManager.RegisterStartupScript(this, GetType(), "showMessage", "alert('Record Updated Successfully.');", true);
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showMessage", "alert('Record Not Updated."+ex.Message+"');", true);
                }
            }
        }
      private string GetColumnNameForTable(string tableName, int columnIndex)
        {
            string columnName = "";
            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = $"SELECT c.name FROM sys.columns c WHERE c.object_id = OBJECT_ID(@TableName) ORDER BY column_id OFFSET @ColumnIndex ROWS FETCH NEXT 1 ROWS ONLY";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@TableName", tableName);
                cmd.Parameters.AddWithValue("@ColumnIndex", columnIndex);

                try
                {
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        columnName = result.ToString();
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
            return columnName;
        }


        // Delete
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the selected table name
            string selectedTable = DropDownList1.SelectedValue;

            // Retrieve the primary key value from the DataKeys collection
            string primaryKey = GridView1.DataKeys[e.RowIndex].Value.ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["conn_enosislearning"].ConnectionString;

            // Get the primary key column name dynamically
            string primaryKeyColumn = GetPrimaryKeyForTable(selectedTable);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Construct the DELETE query
                string query = $"DELETE FROM {selectedTable} WHERE {primaryKeyColumn} = @PrimaryKey";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@PrimaryKey", primaryKey);

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Rebind the GridView to reflect changes
                    BindSelectedTableToGridView(selectedTable); // Rebind to reflect the change

                    // Display success message
                    ScriptManager.RegisterStartupScript(this, GetType(), "showMessage", "alert('Record Deleted Successfully.');", true);

                }
                catch (Exception ex)
                {
                    // Handle exceptions (optional logging)
                    ScriptManager.RegisterStartupScript(this, GetType(), "showMessage", "alert('Record Not Deleted." + ex.Message + "');", true);
                }
            }
        }
      protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (GridView1.PageIndex == 0 && e.NewPageIndex < 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showWarning", "alert('You are already on the first page.');", true);
                e.Cancel = true;
            }
            else
            {
                string tableName = DropDownList1.SelectedValue;
                GridView1.PageIndex = e.NewPageIndex;
                BindSelectedTableToGridView(tableName);
            }
        }
    }
 }

