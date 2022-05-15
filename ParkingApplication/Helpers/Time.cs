using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParkingApplication.Helpers
{
    public class Time
    {
        
        public static long ConvertToUnixTimestamp(DateTime value)
        {
            long epoch = (value.Ticks - 621355968000000000) / 10000000;
            return epoch;
        }

        public static DateTime UnixTimeStampToDateTime(double unixTime)
        {
            DateTime unixStart = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
            long unixTimeStampInTicks = (long)(unixTime * TimeSpan.TicksPerSecond);
            return new DateTime(unixStart.Ticks + unixTimeStampInTicks, System.DateTimeKind.Utc);
        }

        public static string ToHumanTimeString(TimeSpan span, int significantDigits = 3)
        {
            var format = "G" + significantDigits;
            return span.TotalMilliseconds < 1000 ? span.TotalMilliseconds.ToString(format) + " milliseconds"
                : (span.TotalSeconds < 60 ? span.TotalSeconds.ToString(format) + " seconds"
                    : (span.TotalMinutes < 60 ? span.TotalMinutes.ToString(format) + " minutes"
                        : (span.TotalHours < 24 ? span.TotalHours.ToString(format) + " hours"
                                                : span.TotalDays.ToString(format) + " days")));
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