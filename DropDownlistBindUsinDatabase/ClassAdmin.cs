using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DropDownlistBindUsinDatabase
{
    class ClassAdmin
    {
        public static string maincon = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        public static SqlConnection con = new SqlConnection(maincon);
        public static SqlCommand cmd = new SqlCommand();
        public static SqlDataAdapter adp = new SqlDataAdapter();
        public static DataTable dt = new DataTable();
        public static int id;
        public DataTable DisplayCategoryByStatus()
        {
            try
            {
                con.Close();
                cmd = new SqlCommand("SP_Display_CategoryByStatus");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                adp = new SqlDataAdapter(cmd);
                dt = new DataTable();
                adp.Fill(dt);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return dt;
        }

        public int InsertionDish(int category_id,string dish_name,string dish_desc,string image,string type, DateTime added_on)
        {
            try
            {
                con.Close();
                cmd = new SqlCommand("SP_Insertion_Dish");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@category_id", category_id);
                cmd.Parameters.AddWithValue("@dish_name", dish_name);
                cmd.Parameters.AddWithValue("@dish_desc", dish_desc);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@type", type);
                cmd.Parameters.AddWithValue("@added_on", added_on);
                cmd.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                id  = Convert.ToInt32(cmd.Parameters["@id"].Value);
                con.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return id;
        }

        public void InsertionDishDetails(int dish_id,string attribute,int price,byte status,DateTime added_on)
        {
            try
            {
                con.Close();
                cmd = new SqlCommand("SP_Insertion_Dish_Details");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@dish_id", dish_id);
                cmd.Parameters.AddWithValue("@attribute", attribute);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@status", status);
                cmd.Parameters.AddWithValue("@added_on", added_on);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}