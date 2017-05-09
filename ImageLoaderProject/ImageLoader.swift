//
//  ImageLoader.swift
//  ImageLoaderProject
//
//  Created by Diego Enrique Velasquez Lopez on 5/9/17.
//  Copyright © 2017 Diego Enrique Velasquez Lopez. All rights reserved.
//
import UIKit
import Foundation

class ImageLoader {
    
    var imageview: UIImageView

    private init (imageView: UIImageView) {
        self.imageview = imageView
    }
    
    static func with(imageView: UIImageView) -> ImageLoader {
        let loader  = ImageLoader(imageView: imageView)
        return loader
    }
    
    func load(urlString:String){
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.imageview.image = image
            })
            
        }).resume()
    }
    
}
