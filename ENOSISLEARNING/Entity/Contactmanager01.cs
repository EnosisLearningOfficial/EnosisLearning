using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ENOSISLEARNING.Entity
{
    public class Contactmanager01
    {

        public int intCategoryId { get; set; }
        public string strName { get; set; }
        public string strEmail { get; set; }
        public string strMobile { get; set; }
        public string strCategoryName { get; set; }
        public string strComments { get; set; }
        public string strRating { get; set; }
        public string strflag { get; set; }
        public string strSearchQuery { get; set; }
        public string strAddress { get; set; }
        public string strWebsite { get; set; }


    }


    public class BLContactmanager
    {

        Contactmanager01 Objcontactmanager01 = new Contactmanager01();
        DLContactmanager   ObjDLdbconnect = new DLContactmanager();
        public DataTable FnGetAllCategoryData(Contactmanager01 Objcontactmanager01)
        {
            return ObjDLdbconnect.GetGRIDVIEW(Objcontactmanager01);
        }

        public DataTable FnCategorySearch(Contactmanager01 Objcontactmanager01)
        {
            return ObjDLdbconnect.SearchCategory(Objcontactmanager01);
        }

        public bool fnsaveDetail(Contactmanager01 Objcontactmanager01)
        {
            return ObjDLdbconnect.FnSaveData(Objcontactmanager01);
        }
        public bool fnUpdate(Contactmanager01 Objcontactmanager01)
        {
            return ObjDLdbconnect.FnUpdate(Objcontactmanager01);
        }

        public bool FnDelete(Contactmanager01 Objcontactmanager01)
        {
            return ObjDLdbconnect.FnDelete(Objcontactmanager01);
        }

    }


   public class DLContactmanager
    {
        dbconnect gb = new dbconnect();
       // global gb = new dbconnect();
        SqlCommand cmd = new SqlCommand();

        public bool FnSaveData(Contactmanager01 Objcontactmanager01)
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SP_CategoryManager";
            cmd.Parameters.AddWithValue("@CategoryId", Objcontactmanager01.intCategoryId);
            cmd.Parameters.AddWithValue("@Name", Objcontactmanager01.strName);
            cmd.Parameters.AddWithValue("@Email", Objcontactmanager01.strEmail);
            cmd.Parameters.AddWithValue("@Mobile", Objcontactmanager01.strMobile);
            cmd.Parameters.AddWithValue("@CategoryName", Objcontactmanager01.strCategoryName);
            cmd.Parameters.AddWithValue("@Comments", Objcontactmanager01.strComments);
            cmd.Parameters.AddWithValue("@Address ", Objcontactmanager01.strAddress);
            cmd.Parameters.AddWithValue("@Website", Objcontactmanager01.strWebsite);
            cmd.Parameters.AddWithValue("@Rating", Objcontactmanager01.strRating);
            cmd.Parameters.AddWithValue("@flag", Objcontactmanager01.strflag);
            return  gb.FnSaveData(cmd);
        }
        public bool FnUpdate(Contactmanager01 Objcontactmanager01)
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SP_CategoryManager";
            cmd.Parameters.AddWithValue("@CategoryId", Objcontactmanager01.intCategoryId);
            cmd.Parameters.AddWithValue("@Name", Objcontactmanager01.strName);
            cmd.Parameters.AddWithValue("@Email", Objcontactmanager01.strEmail);
            cmd.Parameters.AddWithValue("@Mobile", Objcontactmanager01.strMobile);
            cmd.Parameters.AddWithValue("@CategoryName", Objcontactmanager01.strCategoryName);
            cmd.Parameters.AddWithValue("@Comments", Objcontactmanager01.strComments);
            cmd.Parameters.AddWithValue("@flag", Objcontactmanager01.strflag);
            return gb.FnSaveData(cmd);
        }
        public DataTable SearchCategory(Contactmanager01 Objcontactmanager01)
        {
           
            cmd.Parameters.Clear();
            cmd.CommandText = "SP_CategoryManager";
            //cmd.Parameters.AddWithValue("@CategoryID", Objcontactmanager01.intCategoryId);
            cmd.Parameters.AddWithValue("@Name", Objcontactmanager01.strName); 
            cmd.Parameters.AddWithValue("@CategoryName", Objcontactmanager01.strCategoryName);
            cmd.Parameters.AddWithValue("@flag", Objcontactmanager01.strflag);
            return gb.FnReturnDataTable(cmd);
        }


        public DataTable GetGRIDVIEW(Contactmanager01 Objcontactmanager01)
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SP_CategoryManager";
            cmd.Parameters.AddWithValue("@CategoryID", Objcontactmanager01.strSearchQuery);
            cmd.Parameters.AddWithValue("@flag", Objcontactmanager01.strflag);

            return gb.FnReturnDataTable(cmd);

        }
        public bool FnDelete(Contactmanager01 Objcontactmanager01)
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SP_CategoryManager";
            cmd.Parameters.AddWithValue("@CategoryId", Objcontactmanager01.strSearchQuery);
            cmd.Parameters.AddWithValue("@flag", Objcontactmanager01.strflag);
            return gb.FnSaveData(cmd);
        }

    }


}
