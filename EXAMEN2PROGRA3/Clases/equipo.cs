using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

namespace EXAMEN2PROGRA3.Clases
{
    public class equipo
    {
        public static int id { get; set; }
        public static string tipo { get; set; }
        public static string modelo{ get; set; }

        public equipo(int Id, string Tipo, string Modelo)
        {
            id = Id;
            tipo = Tipo;
            modelo = Modelo;
        }
        public equipo(string Tipo, string Modelo)
        {
            tipo = Tipo;
            modelo = Modelo;
        }
        public equipo() { }

        public static int Agregar(string tipo, string modelo)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGAREQUIPO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@TIPOEQUIPO", tipo));
                    cmd.Parameters.Add(new SqlParameter("@MODELO", modelo));

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
                    SqlCommand cmd = new SqlCommand("BORRAREQUIPO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EQUIPOID", id));


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

        public static int Modificar(int id, string tipo, string modelo)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("MODIFICAREQUIPO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EQUIPOID", id));
                    cmd.Parameters.Add(new SqlParameter("@TIPOEQUIPO", tipo));
                    cmd.Parameters.Add(new SqlParameter("@MODELO", modelo));


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

        public static List<equipo> consultaFiltro(int id)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            List<equipo> equipos = new List<equipo>();
            try
            {

                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("CONSULTAREQUIPOSCONFILTRO", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                           equipo equipo = new equipo(reader.GetInt32(0), reader.GetString(1));  // instancia
                            equipos.Add(equipo);

                        }


                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return equipos;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return equipos;
        }



    }
}
