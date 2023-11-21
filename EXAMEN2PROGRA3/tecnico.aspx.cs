using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EXAMEN2PROGRA3.Clases;

namespace EXAMEN2PROGRA3
{
    public partial class tecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
            }
        }
        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM TECNICOS"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            datagrid.DataSource = dt;
                            datagrid.DataBind();
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int resultado = Clases.tecnico.Agregar(tnombre.Text, tespecialidad.Text);

            if (resultado > 0)
            {
                alertas("El técnico ha sido agregado con éxito");
                tnombre.Text = string.Empty;
                tespecialidad.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al agrerar el técnico");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int resultado = Clases.tecnico.Borrar(int.Parse(tid.Text));

            if (resultado > 0)
            {
                alertas("El técnico ha sido borrado con éxito");
                tid.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al borrar el técnico");

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int resultado = Clases.tecnico.Modificar(int.Parse(tid.Text), tnombre.Text, tespecialidad.Text);

            if (resultado > 0)
            {
                alertas("El técnico ha sido modificado con éxito");
                tid.Text = string.Empty;
                tnombre.Text = string.Empty;
                tespecialidad.Text = string.Empty;
                LlenarGrid();
            }
            else
            {
                alertas("Error al modificar el técnico");

            }
        }

        protected void Bconsulta_Click(object sender, EventArgs e)
        {
            int id = int.Parse(tid.Text);
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM TECNICOS WHERE TECNICOID ='" + id + "'"))


                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        datagrid.DataSource = dt;
                        datagrid.DataBind(); 
                    }
                }
            }
        }
    }
}