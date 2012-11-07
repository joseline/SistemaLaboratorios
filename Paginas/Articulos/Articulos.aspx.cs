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
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    dsLaboratoriosBDTableAdapters.MARCASTableAdapter marcas = new dsLaboratoriosBDTableAdapters.MARCASTableAdapter();
    dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter laboratorios = new dsLaboratoriosBDTableAdapters.LABORATORIOSTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        


        this.stArticulos.DataSource = articulos.GetData();
        this.stArticulos.DataBind();


        this.stArticuloMarca.DataSource = marcas.GetData();
        this.stArticuloMarca.DataBind();

        this.stArticuloLab.DataSource = laboratorios.GetData();
        this.stArticuloLab.DataBind();

       
    }

    protected void mostrarVentanaArticuloDetalle(object sender, DirectEventArgs e)
    {
        string serie = e.ExtraParams["id"];
        this.ArticuloDetalle1.SetArticulo(serie);
        this.ArticuloDetalle1.Show();
        //this.AlumnoDetalle1.SetAlumno(int.Parse(id));
        //this.AlumnoDetalle1.Show();
    }
    protected void mostrarVentanaArticuloNuevo(object sender, DirectEventArgs e)
    {
        
        this.ArticuloNuevo1.Show();
    }
}