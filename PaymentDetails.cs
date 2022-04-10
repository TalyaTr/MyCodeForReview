using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CoriunderExamen
{
    public class PaymentDetails
    {
        public string CardNum { get; set; }
        public string CVV2 { get; set; }
        public string ExpMonth { get; set; }
        public string ExpYear { get; set; }
        public string Member { get; set; }
        public string Amount { get; set; }
        public string BillingCity { get; set; }
        public string BillingCountry { get; set; }
        public string BillingZipCode { get; set; }
        public string BillingAddress1 { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
      
    }
}