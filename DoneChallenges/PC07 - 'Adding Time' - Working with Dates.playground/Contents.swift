//  🏔️ MTECH Code Challenge PC07: "Adding Time"
//  Concept: Practice working with unique math related to time; practice reading

//  Instructions:
    //  In this challenge, your task is to add a variable number of hours, minutes, and seconds to a given time, resulting in a new adjusted time.

    //  You will be given a string, "now", which represents a timestamp in the format "hh:mm:ss", and three integers "hrs", "min", and "sec" representing the hours, minutes, and seconds to add. Implement a function that returns a string with the newly adjusted timestamp in the same format.

//  Examples:
    //  Input: (now: "01:00:00", hrs: 1, min: 30, sec: 10)
    //  Output: "02:30:10"

    //  Input: (now: "18:22:30", hrs: 4, min: 60, sec: 30)
    //  Output: "23:23:00"

    //  Input: (now: "04:00:00", hrs: 72, min: 0, sec: 0)
    //  Output: "04:00:00"

//  Notes:
    //  The values of hrs, min, and sec can be any positive integers. You must correctly add them to their respective units, carrying over when necessary. In the second example above, 60 minutes equals one hour, and 60 seconds (30 + 30) equals one minute.

    //  If the total time exceeds 23:59:59 (i.e. 11:59 pm) the time will reset from "00:00:00" (i.e. midnight). In the third example above, 72 hours is equivalent to exactly 3 full days, so the output string winds up being the same as the input.

//  ⌺ Black Diamond Challenge:
    //  Make it so that additional units of time gets inserted at the beginning of the output string as needed up to representing years. For example, if the user called timeAdjust(now: "1:00:00", hrs: 0, min: 525623, sec: 45) (i.e. added one year, 23 minutes, and 45 seconds), the output would be "01:00:00:01:23:45", representing 1 year, 0 months, 0 days, 1 hour, 23 minutes, and 45 seconds.

import Foundation

func timeAdjust(now: String, hrs: Int, min: Int, sec: Int) -> String {
    var timestring = now.split(separator: ":")
    
    var seconds = Int(timestring[2])
    var minutes = Int(timestring[1])
    var hours = Int(timestring[0])
    
    seconds! += sec
    print(seconds!)
    if seconds! >= 60 {
        minutes! += 
        seconds! -= 60
    }
    
    minutes! += min
    print(minutes!)
    if minutes! >= 60 {
        hours! += (minutes! - 60)
        minutes! -= 60
    }
    
    hours! += hrs
    print(hours!)
    if hours! >= 24 {
        hours = hours! % 24
    }
    
    var secString = String(seconds!)
    var minString = String(minutes!)
    var hrsString = String(hours!)
    
    if secString.count == 1 {
        secString = "0" + secString
    }
    if minString.count == 1 {
        minString = "0" + minString
    }
    if hrsString.count == 1 {
        hrsString = "0" + hrsString
    }
    
    return "\(hrsString):\(minString):\(secString)"
}

//print(timeAdjust(now: "01:00:00", hrs: 1, min: 30, sec: 10))
print(timeAdjust(now: "18:22:30", hrs: 4, min: 60, sec: 30))
