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
    dsLaboratoriosBDTableAdapters.CALIBRACIONESTableAdapter cali = new dsLaboratoriosBDTableAdapters.CALIBRACIONESTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.stCaliUsuarios.DataSource = usuarios.GetData();
        this.stCaliUsuarios.DataBind();

        this.stCalibraciones.DataSource = cali.GetData();
        this.stCalibraciones.DataBind();

        this.stCaliArticulos.DataSource = articulos.GetData();
        this.stCaliArticulos.DataBind();

        this.CalibracionDetalle1.GridStore = this.stCalibraciones;

    }

    protected void mostrarVentanaCaliDetalle(object sender, DirectEventArgs e) 
    {
        int id = int.Parse(e.ExtraParams["id"]);
        int articuloid = int.Parse(e.ExtraParams["articulo"]);
        this.CalibracionDetalle1.SetCalibracion(id,articuloid);
        this.CalibracionDetalle1.Show();
    }
    protected void mostrarVentanaCalibracionNuevo(object sender, DirectEventArgs e)
    {
        this.CalibracionNuevo1.Show();

    }
}