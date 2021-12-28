using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DropDownlistBindUsinDatabase
{
    public partial class index : System.Web.UI.Page
    {
        ClassAdmin admin = new ClassAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddtcategory_id.DataSource = admin.DisplayCategoryByStatus();
                ddtcategory_id.DataTextField = "category";
                ddtcategory_id.DataValueField = "id";
                ddtcategory_id.DataBind();
            }
            
        }

        protected void bttnsubmit_Click(object sender, EventArgs e)
        {   
            // Dish Added
            int lastinsertedid = 0;
            int category_id = Convert.ToInt32(ddtcategory_id.SelectedItem.Value);
            string dish_name = txtdish.Text;
            string dish_desc = txtdish_detail.Text;
            string imagename = String.Empty;
            string type = ddttype.SelectedValue.ToString();
            DateTime added_on = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
            
            // Image File Type Validation
            string[] validFileTypes = { "png", "jpg", "jpeg"};
            string ext = System.IO.Path.GetExtension(f1.PostedFile.FileName);
            bool isValidFile = false;
            for (int i = 0; i < validFileTypes.Length; i++)
            {
                if (ext == "." + validFileTypes[i])
                {
                    isValidFile = true;
                    break;
                }
            }
            if (!isValidFile)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes);
            }
            else
            {
                //Label1.ForeColor = System.Drawing.Color.Green;
                //Label1.Text = "File uploaded successfully.";
                
                imagename = ClassRandom.GetRandomPassword(9) + "_" + Path.GetFileName(f1.FileName);
                f1.SaveAs(Request.PhysicalApplicationPath + "/media/dish/" + imagename.ToString());

                lastinsertedid = admin.InsertionDish(category_id, dish_name, dish_desc, imagename, type, added_on);


                // Dish Details Added 
                string[] attributeValues = Request.Form.GetValues("attribute");
                string[] priceValues = Request.Form.GetValues("price");
                string[] statusValues = Request.Form.GetValues("status");

                for (int i = 0; i < attributeValues.Length; i++)
                {
                    string attribute = attributeValues[i];
                    int price = Convert.ToInt32(priceValues[i]);
                    byte status = Convert.ToByte(statusValues[i]);

                    admin.InsertionDishDetails(lastinsertedid, attribute, price, status, added_on);
                }
            }
        }
      
    }
}