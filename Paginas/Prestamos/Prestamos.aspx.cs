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
    dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter prestamos = new dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
      

        this.stPrestamos.DataSource = prestamos.GetData();
        this.stPrestamos.DataBind();

        this.stPrestamoAlumno.DataSource = alumnos.GetData();
        this.stPrestamoAlumno.DataBind();

        this.stPrestamoArticulo.DataSource = articulos.GetData();
        this.stPrestamoArticulo.DataBind();
        
        this.PrestamoNuevo1.GridStore = this.stPrestamos;
    }
    protected void mostrarVentanaPrestamoDetalle(object sender, DirectEventArgs e) 
    {
        int id = int.Parse(e.ExtraParams["id"]);
        int alumnoid = int.Parse(e.ExtraParams["alumnoid"]);
        this.PrestamoDetalle1.SetPrestamo(id);
        this.PrestamoDetalle1.SetPrestamoEquipoPrestado(alumnoid);
        this.PrestamoDetalle1.Show();
    }
    protected void mostrarVentanaPrestamoNuevo(object sender, DirectEventArgs e)
    {
        this.PrestamoNuevo1.Show();
    }
}