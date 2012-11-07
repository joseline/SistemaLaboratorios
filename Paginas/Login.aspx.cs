using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext;
using Ext.Net;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Security;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection("Data Source=JOSS-PC\\SQLEXPRESS;Initial Catalog=LaboratoriosBD;Integrated Security=True");
    }

     protected void btnAceptarClick(object sender, DirectEventArgs e)
     {
         if(this.txtUsuario.Text != null && this.txtContrasenia.Text != null)
         {
             string usuario = "'" + this.txtUsuario.Text + "'";
             string pass = "'" + this.txtContrasenia.Text + "'";
             string consulta = "SELECT * FROM USUARIOS WHERE USUARIO_ACTIVO=1 AND USUARIO_NICK = " + usuario + " AND USUARIO_CONTRASENA = " + pass;
             SqlCommand cmd = new SqlCommand();
             SqlDataReader rd;
             cmd.CommandText = consulta;
             cmd.CommandType = CommandType.Text;
             cmd.Connection = conn;
             conn.Open();
             rd = cmd.ExecuteReader();
             if (rd.Read() == true)
             {
                 FormsAuthentication.SetAuthCookie(txtUsuario.Text, false /* createPersistentCookie */);
                 Response.Redirect("~/Default.aspx");
             }
             else
             {
                 Ext.Net.Notification.Show(new NotificationConfig
                 {
                     Title = "Error Login",
                     Icon = Icon.Error,
                     Width = 400,
                     Height = 100,
                     Html = "Usuario/contraseña No valido",
                     Shadow = true,

                 });

             }

         }
     }
     protected void btnCancelarClick(object sender, DirectEventArgs e)
     {
     }
}