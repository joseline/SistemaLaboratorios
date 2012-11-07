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

public partial class Paginas_AlumnoNuevo : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnosX = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.CARRERASTableAdapter carreras = new dsLaboratoriosBDTableAdapters.CARRERASTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        var stComboBox = this.sltCarrera.GetStore();
        stComboBox.DataSource = carreras.GetData();
        stComboBox.DataBind();

        //this.stAlumnoNuevo.DataSource = alumnosX.GetData();
        //this.stAlumnoNuevo.DataBind();
    }
    public Store GridStore { get; set; }
    public void limpiar()
    {
        this.fpAlumnoNuevo.Reset();
    }
    public void Show()
    {
        limpiar();
        this.AlumnoVentanaNuevo.Show();
    }
    protected void btnGuardarNuevoAlumno(object sender, DirectEventArgs e)
    {
        
        try
        {

            int cuenta = int.Parse(this.txtCuenta.Text);
            string nombre = this.txtNombre.Text;
            int carrera = int.Parse(this.sltCarrera.SelectedItem.Value);
            string tel = this.txtTelefono.Text;
            string correo = this.txtCorreo.Text;
            alumnosX.Insert_Alumno(cuenta, nombre, tel, correo, carrera);
            //this.stAlumnoNuevo.Reload();
            this.GridStore.Reload();
            limpiar();
            this.AlumnoVentanaNuevo.Hide();
        }
        catch (Exception)
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error al guardar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos",
                Shadow = true,

            });
        }
    }
}