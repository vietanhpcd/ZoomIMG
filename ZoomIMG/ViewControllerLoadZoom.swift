//
//  ViewControllerLoadZoom.swift
//  ZoomIMG
//
//  Created by vietanh on 1/16/18.
//  Copyright © 2018 vietanh. All rights reserved.
//

import UIKit

class ViewControllerLoadZoom: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1.0
            scrollView.maximumZoomScale = 7.0
        }
    }
    
    var imgView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageUrl = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2014/11/17/519385/82b58deee6b45bfbcf86c42837e8e812.jpg")!
        
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData = NSData(contentsOf: imageUrl)!
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
            
            DispatchQueue.main.async {
                imageView.image = UIImage(data: imageData as Data)
                imageView.contentMode = UIViewContentMode.scaleAspectFit
                self.view.addSubview(imageView)
                self.imgView = imageView
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
}
