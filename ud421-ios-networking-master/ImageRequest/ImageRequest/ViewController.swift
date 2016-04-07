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
        getImage()
    }
    
    func getImage() {
        // TODO: Add all the networking code here!
        let imageURL = NSURL(string: "http://g-ecx.images-amazon.com/images/G/01/img15/pet-products/small-tiles/23695_pets_vertical_store_dogs_small_tile_8._CB312176604_.jpg")!
        
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
