using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        private static List<User> ListaCliente = new List<User>();

        static _Default()
        {
            ListaCliente.Add(new User
            {
                Id = 1,
                Nome = "Joao da Silva",
                Email = "joao@nsi.com.br"
            });

            ListaCliente.Add(new User
            {
                Id = 2,
                Nome = "Maria da Silva",
                Email = "maria@nsi.com.br"
            });

            ListaCliente.Add(new User
            {
                Id = 3,
                Nome = "Jose da Silva",
                Email = "jose@nsi.com.br"
            });
        }



        [WebMethod(EnableSession=false)]
        [ScriptMethod(ResponseFormat=ResponseFormat.Json)]
        public static List<User> GetUsers()
        {
            return ListaCliente;
        }

        [WebMethod(EnableSession = false)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object DeleteUser(string id)
        {
            var cliente = ListaCliente.Where(x => x.Id == Convert.ToInt32(id)).FirstOrDefault();
            ListaCliente.Remove(cliente);

            return new
            {
                Message = "OK"
            };
        }


        public class User
        {
            public Int32 Id { get; set; }
            public String Nome { get; set; }
            public String Email { get; set; }
        }


        
    }
}