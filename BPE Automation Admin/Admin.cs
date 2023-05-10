using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BPE_Automation_Admin
{
    public class Admin
    {
        public int ID { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public Admin(String e,String p) {
            Email = e;  
            Password = p;   
        } 
    }
}