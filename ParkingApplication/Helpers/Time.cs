using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParkingApplication.Helpers
{
    public class Time
    {
        public static long ConvertToTimestamp(DateTime value)
        {
            long epoch = (value.Ticks - 621355968000000000) / 10000000;
            return epoch;
        }

        public static List<int> CalculateDisabledParkingNos(List<Dictionary<string, object>> transactions, int hoursDuration)
        {
            List<Dictionary<string, object>> output = new List<Dictionary<string, object>>();
            // https://stackoverflow.com/questions/325933/determine-whether-two-date-ranges-overlap
            List<int> disabledParkingNos = new List<int>();

            DateTime currentMinDate = DateTime.Now;
            DateTime currentMaxDate = DateTime.Now.AddDays(hoursDuration);

            foreach (var transaction in transactions)
            {
                DateTime minDate = (DateTime)transaction["minDate"];
                DateTime maxDate = minDate.AddHours((int)transaction["hoursDuration"]);

                if (currentMinDate <= maxDate && currentMaxDate >= minDate)
                {
                    if (!disabledParkingNos.Exists(v => v == (int)transaction["PARKING_NO"]))
                    {
                        disabledParkingNos.Add((int)transaction["PARKING_NO"]);
                    }
                }
            }

            return disabledParkingNos;
        }
    }
}