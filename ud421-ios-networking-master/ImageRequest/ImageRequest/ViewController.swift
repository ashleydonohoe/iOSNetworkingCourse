//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Add all the networking code here!
        let imageURL = NSURL(string: "http://kathyharrisbooks.com/wp-content/uploads/2013/05/Misty-Edwards.jpg")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(imageURL) { (data, response, error) in
            if error == nil {
                let downloadedImage = UIImage(data: data!)
                performUIUpdatesOnMain {
                    self.imageView.image = downloadedImage
                }
            }
        }
        
        task.resume()
    }
}
