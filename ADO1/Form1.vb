Imports System.Data.SqlClient


Public Class From1
    Dim con As New SqlConnection("data source=NOVABOOK-V2\SQLEXPRESS2014; initial catalog=Northwind; integrated security=true")

    Sub Buscar()
        Try

            Dim da As New SqlDataAdapter("select * from factura where NFact=" & CStr(Int(Val(NFact.Text))).Trim, con)
            'se llama da por dataadapter
            Dim ds As New DataSet
            da.Fill(ds, "Facturas")
            Grilla.DataSource = ds.Tables("Facturas")
            Grilla.Refresh()
        Catch ex As System.Data.SqlClient.SqlException
            MsgBox(ex.Message)

        End Try



    End Sub

    Private Sub bBuscar_Click(sender As Object, e As EventArgs) Handles bBuscar.Click
        Buscar()
    End Sub
End Class

