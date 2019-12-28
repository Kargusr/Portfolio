using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_Page247.ViewModels;

namespace Project_Page247.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GetQuote (string FirstName, string LastName, string EmailAddress,
                                      DateTime DateOfBirth, string CarYear, string CarMake, string CarModel, 
                                      string DUIs, string SpeedingTickets, string Coverage)
        {
            if (string.IsNullOrEmpty(FirstName) || string.IsNullOrEmpty(LastName) || string.IsNullOrEmpty(EmailAddress) ||
                string.IsNullOrEmpty(CarYear) || string.IsNullOrEmpty(CarMake) || string.IsNullOrEmpty(CarModel) || string.IsNullOrEmpty(DUIs) ||
                string.IsNullOrEmpty(SpeedingTickets) || string.IsNullOrEmpty(Coverage))
            {
                return View("~/Views/Shared/Error.cshtml");
            }
            else
            {
                int baseTotal = 50;
                int ageTotal = 0;
                int carYearTotal = 0;
                int carMakeTotal = 0;
                int porscheCarreraTotal = 0;
                double DUITotal = 0;
                double coverageTotal = 0;
                bool total = false;
                
                int age = new DateTime(DateTime.Today.Subtract(DateOfBirth).Ticks).Year;
                
                if (total == false)
                {
                    if (age < 18)
                    {
                        ageTotal = 100;                        
                    }
                    else if (age > 18 && age < 25)
                    {
                        ageTotal = 25;
                    }
                    else if (age > 100)
                    {
                        ageTotal = 25;
                    }
                    else
                    {
                        ageTotal = 0;
                    }
                    if (Convert.ToInt32(CarYear) < 2000)
                    {
                        carYearTotal = 25;
                    }
                    else if (Convert.ToInt32(CarYear) > 2015)
                    {
                        carYearTotal = 25;
                    }
                    else
                    {
                        carYearTotal = 0;
                    }
                    if (CarMake == "Porsche" || CarMake == "porsche")
                    {
                        carMakeTotal = 25;
                    }
                    else
                    {
                        carMakeTotal = 0;
                    }
                    if (CarMake == "Porsche" && CarModel == "911 Carrera")
                    {
                        porscheCarreraTotal = 25;
                    }
                    else
                    {
                        porscheCarreraTotal = 0;
                    }
                    int speedingTicketTotal = Convert.ToInt32(SpeedingTickets) * 10;
                    var quoteSum = baseTotal + ageTotal + carYearTotal + carMakeTotal + porscheCarreraTotal + speedingTicketTotal;
                    if (DUIs == "yes" || DUIs == "yeah" || DUIs == "Yes" || DUIs == "Yeah" || DUIs == "YES" || DUIs == "YEAH")
                    {
                        DUITotal = Convert.ToDouble(quoteSum) * 1.25;
                    }
                    else
                    {
                        DUITotal = quoteSum;
                    }
                    if (Coverage == "Full Coverage" || Coverage == "Full" || Coverage == "full coverage")
                    {
                        coverageTotal = DUITotal * 1.5;
                    }
                    else
                    {
                        coverageTotal = DUITotal;
                    }
                }
                decimal quoteTotal = Convert.ToDecimal(coverageTotal);
                using (CarInsuranceEntities db = new CarInsuranceEntities())
                {
                    var quote = new Quote();
                    quote.FirstName = FirstName;
                    quote.LastName = LastName;
                    quote.EmailAddress = EmailAddress;
                    quote.DateOfBirth = Convert.ToDateTime(DateOfBirth);
                    quote.CarYear = Convert.ToInt32(CarYear);
                    quote.CarModel = CarModel;
                    quote.DUIs = DUIs;
                    quote.SpeedingTickets = Convert.ToInt32(SpeedingTickets);
                    quote.Coverage = Coverage;
                    quote.QuoteTotal = quoteTotal;

                    db.Quotes.Add(quote);
                    db.SaveChanges();
                }
                return View("Quote");
            }
        }

        public ActionResult Admin()
        {
            
            using (CarInsuranceEntities db = new CarInsuranceEntities())
            {
                var quotes = db.Quotes;
                var quoteVms = new List<QuoteVm>();
                foreach (var quote in quotes)
                {
                    var quoteVm = new QuoteVm();
                    quoteVm.FirstName = quote.FirstName;
                    quoteVm.LastName = quote.LastName;
                    quoteVm.EmailAddress = quote.EmailAddress;
                    quoteVms.Add(quoteVm);
                }
                return View(quoteVms);
            }
        }
    }
}