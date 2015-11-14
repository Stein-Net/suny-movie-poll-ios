//
//  Week.swift
//  SUNY Movie Poll
//
//  Created by Gregory Rudolph-Alverson on 11/13/15.
//  Copyright © 2015 STEiN-Net. All rights reserved.
//

import Foundation
class Week {
    var day = ""
    // In data movie1 = movies[0]
    var movies: [String] = [ "movie1", "movie2", "movie3", "movie4", "movie5", "movie6" ]
    var votes: [Int] = [0,0,0,0,0,0]
    var thumbs: [String] = ["https://image.tmdb.org/t/p/w185/kCimAd6QNYTn28xfYBmqhLLyfIX.jpg","src","src","src","src","src"]
    var trails: [String] = ["t1", "t2", "t3", "t4", "t5", "t6"]
    var days: [String] = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
    var week = [Weekday]()
    
    
    init() {
        let url = NSURL(string: "https://suny-movie-poll.firebaseio.com/movie-list.json")
        let request = NSURLRequest(URL: url!)
        
        // var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            print(data)
            print(response)
            var jsonData = JSON(data: data!)
            for (var i = 0; i < 7; i++) {
                for (var x = 1; x < 6; x++) {
                    self.movies[x] = jsonData["\(self.days[i])"]["movie\(x)"]["title"].string!
                    self.thumbs[x] = jsonData["\(self.days[i])"]["movie\(x)"]["thumb"].string!
                    self.trails[x] = jsonData["\(self.days[i])"]["movie\(x)"]["trailer"].string!
                    self.votes[x] = jsonData["\(self.days[i])"]["votes"]["movie\(x)"].int!
                }
                 self.week.append(Weekday(mov: self.movies, vote: self.votes, thumb: self.thumbs, trail: self.trails))
                
            }
        }).resume()
        
        print(day)
    }
    func getWeekday(day: Int) -> Weekday {
        return week[day]
    }
}

