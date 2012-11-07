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

public partial class Paginas_Prestamos_PrestamoNuevo : System.Web.UI.UserControl
{
    dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter prestamos = new dsLaboratoriosBDTableAdapters.PRESTAMOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter alumnos = new dsLaboratoriosBDTableAdapters.ALUMNOSTableAdapter();
    dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter usuarios = new dsLaboratoriosBDTableAdapters.USUARIOSTableAdapter();
    dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter articulos = new dsLaboratoriosBDTableAdapters.ARTICULOSTableAdapter();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        var storeTipo = this.sltTipoPrestamo.GetStore();
        storeTipo.DataSource = new object[]
        {
            new object[] {0,"INTERNO"},
            new object[] {1,"EXTERNO"}
        };
        storeTipo.DataBind();


        this.stPrestamoAlumnoNuevo.DataSource = alumnos.GetData();
        this.stPrestamoAlumnoNuevo.DataBind();

        this.stPrestamoArticuloNuevo.DataSource = articulos.GetData();
        this.stPrestamoArticuloNuevo.DataBind();

        this.stPrestamoUsuarioNuevo.DataSource = usuarios.GetData();
        this.stPrestamoUsuarioNuevo.DataBind();

    }
    public Store GridStore { get; set; }
    public void Show()
    {
        Limpiar();
        this.VentanaPrestamoNuevo.Show();
    }
    public void Limpiar() 
    {
        this.formaPrestamo.Reset();
    }
    protected void activar(object sender, DirectEventArgs e)
    {
        int type = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
        if (type == 1)
        {
            this.fsExterno.Disabled = false;
            this.dtefechaEntregar.Disabled = false;

            this.fsInterno.Disabled = true;
            this.tfHoraInicio.Disabled = true;
            this.tfHoraFin.Disabled = true;
        }
        if (type == 0)
        {
            this.fsInterno.Disabled = false;
            this.tfHoraInicio.Disabled = false;
            this.tfHoraFin.Disabled = false;

            this.fsExterno.Disabled = true;
            this.dtefechaEntregar.Disabled = true;
        }

    }
    protected void mostrarMulta(object sender, DirectEventArgs e) 
    {
        DateTime csFechaEntrada = this.dteFechaEntrada.SelectedDate;
        DateTime csFecha_a_Entregar = this.dtefechaEntregar.SelectedDate;
        if (csFechaEntrada > csFecha_a_Entregar)
        {
            this.chckMulta.Disabled = false;
        }
    }

    public decimal calcularMulta(decimal MultaXDia)
    {
        if (this.dteFechaEntrada.Text != "01/01/0001 12:00:00 a.m." && this.dtefechaEntregar.Text != "01/01/0001 12:00:00 a.m.")
        {
            Decimal TotalMulta = 0;
            DateTime fechaEntrada = this.dteFechaEntrada.SelectedDate;
            DateTime fechaEntregar = this.dtefechaEntregar.SelectedDate;
            int DiasOmitidos = 0;
            if (fechaEntrada > fechaEntregar)
            {
            
                TimeSpan resultado = fechaEntrada.Subtract(fechaEntregar);
                for (int i = 0; i < resultado.Days + 1; i++ )
                {
                    if (fechaEntregar.DayOfWeek ==  DayOfWeek.Sunday)
                    {
                        DiasOmitidos++;
                    }
                }
                TotalMulta = MultaXDia * (resultado.Days - DiasOmitidos);
            }
            return TotalMulta;
        }
        return 0;
    }
    public int ValidarPrestamo(int alumnnoId)
    {
        var esPermitido = prestamos.ValidarPrestamo(alumnnoId);
        return (int)esPermitido;
    }
    
    
    protected void btnGuardarNuevoPrestamo(object sender, DirectEventArgs e) 
    {
        int csalumnoID = int.Parse(this.sltCuenta.SelectedItem.Value);
        int csarticuloID = int.Parse(this.cmbSerie.SelectedItem.Value);
        decimal csarticuloMulta = (decimal)articulos.ObtenerMulta_Articulo(csarticuloID);
        int csNumeroMultas = -1;
        csNumeroMultas = ValidarPrestamo(csalumnoID);
        
        if (csNumeroMultas == 0)
        {
            try
            {
                int cstipoPrestamo = int.Parse(this.sltTipoPrestamo.SelectedItem.Value);
                Nullable<DateTime> csfechaEntrada = null;
                Nullable<DateTime> csfecha_a_Entregar = null;
                int csrecibidoPor;
                int csprestadoPor;
                DateTime csfechaSalida;
                string csobservaciones;
                    
                csfechaSalida = this.dteFechaSalida.SelectedDate;
                csfechaEntrada = this.dteFechaEntrada.SelectedDate;
                csprestadoPor = int.Parse(this.sltPrestadoPor.SelectedItem.Value);
                    
                csfecha_a_Entregar = this.dtefechaEntregar.SelectedDate;
                csobservaciones = this.txtObs.Text;
                    

                if(cstipoPrestamo==1)
                {
                    if (this.sltRecibidoPor.Text == "" && this.dteFechaEntrada.Text == "01/01/0001 12:00:00 a.m.")
                    {
                      prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, csfecha_a_Entregar, csprestadoPor, null, cstipoPrestamo, null, null, csobservaciones, 0,1);
                    }
                    else
                    {
                      csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);
                      int pago = Convert.ToInt32(this.chckMulta.Checked);
                      decimal TotalMulta = calcularMulta(csarticuloMulta);
                      prestamos.Insert_Prestamo(csalumnoID,csarticuloID,csfechaSalida,csfechaEntrada,csfecha_a_Entregar,csprestadoPor,csrecibidoPor,cstipoPrestamo,null,null,csobservaciones,TotalMulta,pago);
                    }
                }
                if(cstipoPrestamo == 0)
                {
                    TimeSpan csHoraInicio = this.tfHoraInicio.SelectedTime;
                    TimeSpan csHoraFin = this.tfHoraFin.SelectedTime;
                    DateTime csHI = Convert.ToDateTime(csHoraInicio);
                    DateTime csHF = Convert.ToDateTime(csHoraFin);
                    if (this.sltRecibidoPor.Text == "" && this.dteFechaEntrada.Text == "01/01/0001 12:00:00 a.m.")
                    {
                         prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, null, csfecha_a_Entregar, csprestadoPor, null, cstipoPrestamo,csHI, csHF, csobservaciones, 0, 1);
                    }
                    else
                    {
                        csrecibidoPor = int.Parse(this.sltRecibidoPor.SelectedItem.Value);
                        int pago = Convert.ToInt32(this.chckMulta.Checked);
                        decimal TotalMulta = calcularMulta(csarticuloMulta);
                        prestamos.Insert_Prestamo(csalumnoID, csarticuloID, csfechaSalida, csfechaEntrada, csfecha_a_Entregar, csprestadoPor, csrecibidoPor, cstipoPrestamo, csHI, csHF, csobservaciones, TotalMulta, pago);
                    }
                }

                this.GridStore.Reload();
                this.VentanaPrestamoNuevo.Hide();
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
        else 
        {
            Ext.Net.Notification.Show(new NotificationConfig
            {
                Title = "Prestamo No Permitido",
                Icon = Icon.Error,
                Width = 400,
                Height = 100,
                Html = "Este Alumno tiene " + csNumeroMultas+ " multas pendientes", 
                HideDelay = 5000,
                Shadow = true,

            });
        }
    }
}