//
//  ViewControllerLoadZoom.swift
//  ZoomIMG
//
//  Created by vietanh on 1/16/18.
//  Copyright © 2018 vietanh. All rights reserved.
//

import UIKit

class ViewControllerLoadZoom: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
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
        fetchImage()
    }
    // Private: chỉ gọi dc ở trong class nội tại, các class khác không gọi  được
    private func fetchImage() {
        if let url = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2014/11/17/519385/82b58deee6b45bfbcf86c42837e8e812.jpg") {
            // Hiển thị Spinder khi load ảnh
            spinner.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
                if let imageData = NSData(contentsOf: url) {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: imageData as Data)
                        imageView.contentMode = UIViewContentMode.scaleAspectFit
                        self.view.addSubview(imageView)
                        self.imgView = imageView
                        // Tắt Spinder khi load xong
                        self.spinner.stopAnimating()
                    }
                }
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgView
    }
}
