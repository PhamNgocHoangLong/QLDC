using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLDC
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection myCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DCConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //khi dang load k dung gi thi k tra rq
            {
                try
                {
                    myCon.Open();
                    using (SqlCommand myCom = new SqlCommand("dbo.GetDanhSach", myCon))
                    {
                        /*myCom.Parameters.Add("@NhomID", sqlDbType: SqlDbType.VarChar).Value = nhomID;*/
                        myCom.Connection = myCon;
                        myCom.CommandType = CommandType.StoredProcedure;

                        SqlDataReader myDr = myCom.ExecuteReader();

                        gvDanCu.DataSource = myDr;
                        gvDanCu.DataBind();

                        myDr.Close();
                    }
                }
                catch (Exception ex) { }
                finally { myCon.Close(); }
            }
        }
        protected void gvDanCu_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "updsanpham")
            {

            }
        }
         

        protected void gvDanCu_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}