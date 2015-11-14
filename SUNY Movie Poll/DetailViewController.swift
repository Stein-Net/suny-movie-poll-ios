//
//  DetailViewController.swift
//  SUNY Movie Poll
//
//  Created by Gregory Rudolph-Alverson on 10/23/15.
//  Copyright © 2015 STEiN-Net. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var movie1: UIImageView!
    @IBOutlet weak var movie2: UIImageView!
    @IBOutlet weak var movie3: UIImageView!
    @IBOutlet weak var movie4: UIImageView!
    @IBOutlet weak var movie5: UIImageView!
    @IBOutlet weak var movie6: UIImageView!
    var day: Weekday!
    
    
    var detailItem: AnyObject?  {
        didSet {
            
            print("Opened.")
            self.configureView()
        }
    }

    func configureView() {
        
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let m1 = self.movie1 {
                m1.image = day.thumbnails[0]
            }
            if let m2 = self.movie2 {
                m2.image = day.thumbnails[1]
            }
            if let m3 = self.movie3 {
                m3.image = day.thumbnails[2]
            }
            if let m4 = self.movie4 {
                m4.image = day.thumbnails[3]
            }
            if let m5 = self.movie5 {
                m5.image = day.thumbnails[4]
            }
            if let m6 = self.movie6 {
                m6.image = day.thumbnails[5]
            }
        }
    }
    func getImageFromServer(imageURL: String, completion: ((image: UIImage?) -> Void)) {
        let url:String = imageURL
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: url)!) {(data, response, error) in
            completion(image: UIImage(data: data!))
        }
        
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

