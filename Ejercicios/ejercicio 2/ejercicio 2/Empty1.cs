/*
 * Created by SharpDevelop.
 * User: jose_
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApplication1
{

    public class Alumno
    {
        private int edad;
        private string nombre; 
        public Alumno() // Constructor por defecto
        {
            edad = 0;

        }
        public Alumno(string p_nombre, int p_edad )
        {
            edad = p_edad;
            nombre = p_nombre;
        }
        public int Edad
        {
            get
            {
                return edad;
            }
            set
            {
                edad = value;
            }
        }
        public string Nombre
        {
            get
            {
                return nombre != null ? nombre : "Sin nombre";
            }
        }

        public void Imprime()
        {
            Console.WriteLine("Alumno: "+ this.Nombre + " - Edad: " + this.Edad.ToString()+" años.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {   
            Alumno a = new Alumno("Emanuel",21);
            Alumno b = new Alumno("Pedro",33);

            a.Imprime();
            b.Imprime();
            Console.ReadLine();
        }
    }
}