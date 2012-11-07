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

public partial class Paginas_Prestamos_PrestamoDetalle : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter prestamos = new dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    dsLaboratoriosBDTableAdapters.EquipoPrestadoTableAdapter EquipoPrestadoTA = new dsLaboratoriosBDTableAdapters.EquipoPrestadoTableAdapter();
    dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter labs = new dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.CARRERASTableAdapter carreras = new dsLaboratoriosBDTableAdapters.CARRERASTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        var storeTipo = this.sltTipoPrestamo.GetStore();
        storeTipo.DataSource = new object[]
        {
            new object[] {0,"INTERNO"},
            new object[] {1,"EXTERNO"}
        };
        storeTipo.DataBind();

        this.stLaboratorio.DataSource = labs.GetData();
        this.stLaboratorio.DataBind();

        this.stMarca.DataSource = this.marcas.GetData();
        this.stMarca.DataBind();
    }
    public Store GridStore { get; set; }
    public void Show()
    {
        this.VentanaPrestamoDetalle.Show();
    }
    public void SetPrestamo(int id) 
    {
       

        this.stPrestamoAlumnoDetalle.DataSource = alumnos.GetData();
        this.stPrestamoAlumnoDetalle.DataBind();

        this.stPrestamoArticuloDetalle.DataSource = articulos.GetData();
        this.stPrestamoArticuloDetalle.DataBind();

        this.stPrestamoUsuarioDetalle.DataSource = usuarios.GetData();
        this.stPrestamoUsuarioDetalle.DataBind();

        this.stPrestamoDetalle.DataSource = prestamos.GetDataByID(id);
        this.stPrestamoDetalle.DataBind();

        var storeTipo = this.sltTipoPrestamo.GetStore();
        storeTipo.DataSource = new object[]
        {
            new object[] {0,"INTERNO"},
            new object[] {1,"EXTERNO"}
        };
        storeTipo.DataBind();
    }
    public void SetPrestamoEquipoPrestado(int alumnoId) 
    {
        var stCarrera = this.txtCarrera.GetStore();
        stCarrera.DataSource = carreras.GetData();
        stCarrera.DataBind();

        this.stLaboratorio.DataSource = labs.GetData();
        this.stLaboratorio.DataBind();

        this.stAlumno.DataSource = alumnos.GetDataByAlumnoId(alumnoId);
        this.stAlumno.DataBind();
        
        this.stArticulo.DataSource = EquipoPrestadoTA.GetDataEquipoPrestadobyAlumnoId(alumnoId);
        this.stArticulo.DataBind();
    }
    
    protected void activar(object sender, DirectEventArgs e) { }
    protected void mostrarMulta(object sender, DirectEventArgs e) 
    {
    }
    protected void btnGuardarDetallePrestamo(object sender, DirectEventArgs e) 
    { 
    }
}