//
//  ViewController.swift
//  ZoomIMG
//
//  Created by vietanh on 1/16/18.
//  Copyright © 2018 vietanh. All rights reserved.
//

import UIKit

class ViewControllerPinch: UIViewController {

    @IBOutlet weak var imageViewAbove: UIImageView!
    @IBOutlet weak var imageViewBelow: UIImageView!
    
    var imageView: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load image cách 1
        get_image("https://www.wallpaperup.com/uploads/wallpapers/2014/11/17/519385/82b58deee6b45bfbcf86c42837e8e812.jpg", imageViewAbove)
        get_image("https://www.wallpaperup.com/uploads/wallpapers/2013/06/17/103939/aacab500845f96df64496793afdb2f89.jpg", imageViewBelow)
    }
    // Hiển thị ảnh bằng việc tải ảnh từ wed 
    func get_image(_ url_str:String, _ imageView:UIImageView) {
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if data != nil {
                let image = UIImage(data: data!)
                if(image != nil) {
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
                        imageView.alpha = 0
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                    })
                }
            }
        })
        task.resume()
    }
    // zoom ảnh bằng pinch
    @IBAction func pinchView(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        // Để việc zoom ảnh ổn định hơn
        sender.scale = 1
    }    
}

