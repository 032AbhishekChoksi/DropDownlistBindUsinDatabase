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
            
            ddcategory_id.DataSource = admin.DisplayCategoryByStatus();
            ddcategory_id.DataTextField = "category";
            ddcategory_id.DataValueField = "id";
            ddcategory_id.DataBind();
        }

        protected void bttnsubmit_Click(object sender, EventArgs e)
        {
            string[] attributeValues = Request.Form.GetValues("attribute");
            string[] priceValues = Request.Form.GetValues("price");
            string[] statusValues = Request.Form.GetValues("status");

            string imagename = ClassRandom.GetRandomPassword(9) + "_" + Path.GetFileName(f1.FileName) ;
            //f1.SaveAs(Request.PhysicalApplicationPath + "/media/dish/" + imagename.ToString());
        }
    }
}