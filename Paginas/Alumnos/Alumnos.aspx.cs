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

public partial class Default2 : System.Web.UI.Page
{
    public int TipoFiltro = -1;
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.CARRERASTableAdapter carreras = new dsLaboratoriosBDTableAdapters.CARRERASTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.stCarreras.DataSource = carreras.GetData();
        this.stCarreras.DataBind();

        this.stAlumnos.DataSource = alumnos.GetData();
        this.stAlumnos.DataBind();
        
        this.AlumnoDetalle1.GridStore = this.stAlumnos;
        this.AlumnoNuevo1.GridStore = this.stAlumnos;
        //this.cmbDisplayCarrera.SelectedItem.Text
        //var x = this.stCarreras.GetById(1);
        //.string.string hola = "jh";

        var storeTipoCampo = this.cmbtipoCampo.GetStore();
        storeTipoCampo.DataSource = new object[] 
        { 
            new object [] {1, "CUENTA"},
            new object [] {2, "NOMBRE"},
            new object [] {3, "CARRERA"}
        };
        storeTipoCampo.DataBind();

    }
    protected void mostrarVentanaAlumnoDetalle(object sender, DirectEventArgs e) 
    {
        string id = e.ExtraParams["id"];
        this.AlumnoDetalle1.SetAlumno(int.Parse(id));
        this.AlumnoDetalle1.Show();
    }
    protected void mostrarVentanaAlumnoNuevo(object sender, DirectEventArgs e)
    {
        //string hola = "ha";
        //string id = e.ExtraParams["id"];
        //this.AlumnoDetalle1.SetAlumno(int.Parse(id));
        //this.AlumnoDetalle1.Show();
        //this.AlumnoNuevo1.Show();
        this.AlumnoNuevo1.Show();
    }

    
    //protected void Filtrar(object sender, DirectEventArgs e) 
    //{
        
    //    if(TipoFiltro == 1){
    //        TipoFiltro = -1;
    //    //    try {
    //    //       // this.stAlumnos.FilterBy(new JFunction { Fn = string.Format("getStringFilter ( '{0}' )","ALUMNO_NOMBRE") });
    //    //    }
    //    //    catch(Exception)
    //    //    {
    //    //    }
    //    }
    //    //TipoFiltro = -1;
    //}
    

    //protected void ObtenerTipoFiltro(object sender, DirectEventArgs e) 
    //{
    //    string valueCadena = this.cmbtipoCampo.SelectedItem.Value;
    //    int value = int.Parse(valueCadena);
    //    TipoFiltro = value;
    //}
}