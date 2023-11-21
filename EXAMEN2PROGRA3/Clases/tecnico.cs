using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace EXAMEN2PROGRA3.Clases
{
    public class tecnico
    {
        public static int id { get; set; }
        public static string nombre { get; set; }
        public static string especialidad{ get; set; }

        public tecnico(int Id, string Nombre, string Especialidad)
        {
            id = Id;
            nombre = Nombre;
            especialidad = Especialidad;
        }
        public tecnico(string Nombre, string Especialidad)
        {
            nombre = Nombre;
            especialidad = Especialidad;
        }
        public tecnico() { }

        public static int Agregar(string nombre, string especialidad)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGARTECNICO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("NOMBRE", nombre));
                    cmd.Parameters.Add(new SqlParameter("@ESPECIALIDAD", especialidad));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static int Borrar(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BORRARTECNICO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TECNICOID", id));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;


        }

        public static int Modificar(int id,string nombre, string especialidad)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("MODIFICARTECNICO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TECNICOID", id));
                    cmd.Parameters.Add(new SqlParameter("NOMBRE", nombre));
                    cmd.Parameters.Add(new SqlParameter("@ESPECIALIDAD", especialidad));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static List<tecnico> consultaFiltro(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<tecnico> tecnicos = new List<tecnico>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("CONSULTARTECNICOCONFILTRO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            tecnico tecnico = new tecnico(reader.GetInt32(0), reader.GetString(1));  
                            tecnicos.Add(tecnico);

                        }


                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return tecnicos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return tecnicos;
        }



    }
}