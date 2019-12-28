using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Page247.Models
{
    public class QuoteCalculation
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public Nullable<System.DateTime> DateOfBirth { get; set; }
        public Nullable<int> CarYear { get; set; }
        public string CarMake { get; set; }
        public string CarModel { get; set; }
        public string DUIs { get; set; }
        public Nullable<int> SpeedingTickets { get; set; }
        public string Coverage { get; set; }
        public Nullable<decimal> QuoteTotal { get; set; }
    }
}