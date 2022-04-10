using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services;

namespace CoriunderExamen
{
    /// <summary>
    /// Summary description for PaymentService
    /// </summary>
    //[WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    [WebService(Namespace = "http://microsoft.com/webservices/")]
    public class PaymentService : System.Web.Services.WebService
    {

        [WebMethod]
        public TransactionDetails SavePaymentDetails(PaymentDetails details)
        {
            TransactionDetails res = new TransactionDetails();

            if (IsValidData(details)) { 
            var request = (HttpWebRequest)WebRequest.Create("https://process.coriunder.cloud/member/remote_charge.asp");
            string CompanyNum = "6668084";
            string TransType = "1";
            string TypeCredit = "1";
            string Currency = "1";
            string RefTransID = "1234";
            string PersonalHashKey = "YHDOZ2H287";
            string signatureStr = CompanyNum + TransType + TypeCredit + details.Amount + Currency + details.CardNum + RefTransID + PersonalHashKey;
            System.Security.Cryptography.SHA256 sh = System.Security.Cryptography.SHA256.Create();
            byte[] hashValue = sh.ComputeHash(System.Text.Encoding.UTF8.GetBytes(signatureStr));
            string signature = System.Convert.ToBase64String(hashValue);
            var postData = "CompanyNum=" + Uri.EscapeDataString(CompanyNum);
            postData += "&CardNum=" + Uri.EscapeDataString(details.CardNum);
            postData += "&CVV2=" + Uri.EscapeDataString(details.CVV2);
            postData += "&ExpMonth=" + Uri.EscapeDataString(details.ExpMonth);
            postData += "&ExpYear=" + Uri.EscapeDataString(details.ExpYear);
            postData += "&Currency=" + Uri.EscapeDataString(Currency);
            postData += "&Amount=" + Uri.EscapeDataString(details.Amount);
            postData += "&TransType=" + Uri.EscapeDataString(TransType);
            postData += "&TypeCredit=" + Uri.EscapeDataString(TypeCredit);
            postData += "&Payments=" + Uri.EscapeDataString("1");
            //postData += "&RefTransID=" + Uri.EscapeDataString("1234");
            //postData += "&PersonalHashKey=" + Uri.EscapeDataString("AU7E468HNF");
            postData += "&BillingCity=" + Uri.EscapeDataString(details.BillingCity);
            postData += "&BillingCountry=" + Uri.EscapeDataString(details.BillingCountry);
            postData += "&BillingZipCode=" + Uri.EscapeDataString(details.BillingZipCode);
            postData += "&BillingAddress1=" + Uri.EscapeDataString(details.BillingAddress1);
            postData += "&Member=" + Uri.EscapeDataString(details.Member);
            postData += "&PhoneNumber=" + Uri.EscapeDataString(details.PhoneNumber);
            postData += "&Email=" + Uri.EscapeDataString(details.Email);
            postData += "&signature=" + Uri.EscapeDataString(signature);


            var data = Encoding.ASCII.GetBytes(postData);

            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded";
            request.ContentLength = data.Length;

            try
            {
                using (var stream = request.GetRequestStream())
                {
                    stream.Write(data, 0, data.Length);
                }

                var response = (HttpWebResponse)request.GetResponse();

                var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
                string[] arrResponce = responseString.Split('&');
                for (int i = 0; i < arrResponce.Length; i++)
                {
                    if (arrResponce[i].Contains("TransID")) {

                        string[] temp = arrResponce[i].Split('=');
                        res.TransactionID = temp[1];
                    }
                    if (arrResponce[i].Contains("Date"))
                    {

                        string[] temp = arrResponce[i].Split('=');
                        res.TransactionDate = temp[1];
                    }
                }
            }
            catch (Exception)
            {

                res.ErrorMessage = "There is a problem saving the data.";
            }

        }

            return res;

        }

        public bool IsValidData(PaymentDetails details)
        {
            string errorMessage = "";
            if(details.CardNum == null && details.CardNum == "")
            {
                errorMessage += "Card number is empty";
            }
            if (details.CVV2 == null && details.CVV2 == "")
            {
                errorMessage += "CVV2 is empty";
            }
            if (details.ExpMonth == null && details.ExpMonth == "")
            {
                errorMessage += "Expired year is empty";
            }
            if (details.ExpYear == null && details.ExpYear == "")
            {
                errorMessage += "Expired month is empty";
            }
            if (details.Member == null && details.Member == "")
            {
                errorMessage += "Member is empty";
            }
            if (details.PhoneNumber == null && details.PhoneNumber == "")
            {
                errorMessage += "Phone number is empty";
            }
            if (errorMessage == "")
                return true;
            else
                return false;
        }
    }
}
