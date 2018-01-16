//
//  ViewControllerScroll.swift
//  ZoomIMG
//
//  Created by vietanh on 1/16/18.
//  Copyright © 2018 vietanh. All rights reserved.
//

import UIKit

class ViewControllerScroll: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // Tỉ lệ zoom image
            scrollView.minimumZoomScale = 1.0 // = 1.0 : zoom nhỏ về kích cỡ ảnh ban đầu
            scrollView.maximumZoomScale = 7.0
//            scrollView.zoomScale = 1 // Giúp việc zoom image ổn định
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load image cách 2
        do {
            let url = URL(string: "https://www.wallpaperup.com/uploads/wallpapers/2014/11/17/519385/82b58deee6b45bfbcf86c42837e8e812.jpg")
            let dulieu = try Data(contentsOf: url!)
            imageView.image = UIImage(data: dulieu)
        } catch {
            print("loi download internet")
        }
    }
    
    // Zoom image
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        updateConstraintsForSize(view.bounds.size)
//    }
//    // Căn hình ở chính giữa khi thu nhỏ lại
//    fileprivate func updateConstraintsForSize(_ size: CGSize) {
//
//        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
//        imageViewTopConstraint.constant = yOffset
//        imageViewBottomConstraint.constant = yOffset
//
//        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
//        imageViewLeadingConstraint.constant = xOffset
//        imageViewTrailingConstraint.constant = xOffset
//
//        view.layoutIfNeeded()
//    }
}
