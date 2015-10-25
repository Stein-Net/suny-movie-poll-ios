//
//  Weekday.swift
//  SUNY Movie Poll
//
//  Created by Gregory Rudolph-Alverson on 10/24/15.
//  Copyright © 2015 STEiN-Net. All rights reserved.
//

import Foundation
class Weekday {
    var day = ""
    // In data movie1 = movies[0]
    var movies: [String] = [ "movie1", "movie2", "movie3", "movie4", "movie5", "movie6" ]
    var votes: [Int] = [0,0,0,0,0,0]
    
    
    init(day1: String) {
        day = day1;
        let url = NSURL(string: "https://suny-movie-poll.firebaseio.com/movie-list/\(day).json")
        let request = NSURLRequest(URL: url!)

       // var data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil)
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            //print(data)
            
            var jsonData = JSON(data: data!)
            for (var i = 0; i < 6; i++) {
                self.movies[i] = jsonData["movie\(i+1)"].string!
                self.votes[i] = jsonData["votes"]["movie\(i+1)"].int!
            }
            print(self.movies)
            print("Initial Votes Array: \(self.votes)")

            
        }).resume()
        
        
        }
    func getMovie(index: Int) -> String {
        return movies[index]
    }
    func getVotes(index: Int) -> Int {
        return votes[index]
    }
    func upVote(index: Int) {
        let request = NSMutableURLRequest(URL: NSURL(string: "https://suny-movie-poll.firebaseio.com/movie-list/\(day)/votes.json")!)
        request.HTTPMethod = "PUT"
        let postString = votePostString(index)
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
            print("request = \(request)")
            print(postString)
        }
        task.resume()
    }
    func votePostString(index: Int) -> String {
        print("Vote array = \(self.votes)")
        var ret = "{"
        for (var i = 0; i < 6; i++) {
            if (i + 1 == index) {
                if (i == 5) {
                     ret += "\"movie\(index)\":\(votes[i] + 1) } "
                    break;
                }
                ret += "\"movie\(index)\":\(votes[i] + 1), "
            } else if (i == 5 && i != index) {
                ret += "\"movie\(i+1)\":\(votes[i]) } "
            } else if (i <= 5){
                ret += "\"movie\(i+1)\":\(votes[i]), "
            }
            
        }
        return ret
    }
}

