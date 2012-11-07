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

public partial class AlumnoDetalle : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnosX = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.CARRERASTableAdapter carreras = new dsLaboratoriosBDTableAdapters.CARRERASTableAdapter();
    dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter prestamos = new dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public Store GridStore { get; set; }
    public void Show()
    {
        this.AlumnoVentana.Show();
    }
    public void SetAlumno(int alumnoId) 
    {
        var stComboBox = this.sltCarrera.GetStore();
        stComboBox.DataSource = carreras.GetData();
        stComboBox.DataBind();

        this.stArticulos.DataSource = articulos.GetData();
        this.stArticulos.DataBind();

        this.stAlumnoDetalle.DataSource = alumnosX.GetDataByAlumnoId(alumnoId);
        this.stAlumnoDetalle.DataBind();

        this.stPrestamosRealizados.DataSource = prestamos.GetDataByAlumnoId(alumnoId);
        this.stPrestamosRealizados.DataBind();

       
    }
    protected void btnGuardarDetalleAlumno(object sender, DirectEventArgs e)
    {
        try
        {
            int id = int.Parse(this.txtId.Text);
            int cuenta = int.Parse(this.txtCuenta.Text);
            string nombre = this.txtNombre.Text;
            int carrera = int.Parse(this.sltCarrera.SelectedItem.Value);
            string tel = this.txtTelefono.Text;
            string correo = this.txtCorreo.Text;
            alumnosX.Update_Alumno(cuenta, nombre, tel, correo, carrera, id);
            this.stAlumnoDetalle.Reload();
            this.GridStore.Reload();
            this.AlumnoVentana.Hide();
        }
        catch(Exception) {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Error al actualizar",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Ingreso de datos incorretos",
                Shadow = true,

            });
        }
    }
}