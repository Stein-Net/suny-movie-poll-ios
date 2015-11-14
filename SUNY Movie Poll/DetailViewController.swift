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
                let url = NSURL(string: (day.thumbs[0]))
                let data = NSData(contentsOfURL: url!)
                 m1.image = UIImage(data: data!)
            }
            if let m2 = self.movie2 {
                let url = NSURL(string: (day.thumbs[1]))
                let data = NSData(contentsOfURL: url!)
                m2.image = UIImage(data: data!)
            }
            if let m3 = self.movie1 {
                let url = NSURL(string: (day.thumbs[2]))
                let data = NSData(contentsOfURL: url!)
                m3.image = UIImage(data: data!)
            }
            if let m4 = self.movie1 {
                let url = NSURL(string: (day.thumbs[3]))
                let data = NSData(contentsOfURL: url!)
                m4.image = UIImage(data: data!)
            }
            if let m5 = self.movie1 {
                let url = NSURL(string: (day.thumbs[4]))
                let data = NSData(contentsOfURL: url!)
                m5.image = UIImage(data: data!)
            }
            if let m5 = self.movie1 {
                let url = NSURL(string: (day.thumbs[5]))
                let data = NSData(contentsOfURL: url!)
                m5.image = UIImage(data: data!)
            }
        }
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

