//
//  DetailedScrollViewController.swift
//  gallery
//
//  Created by Dieuson VIRGILE on 1/12/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class DetailedScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView?
    var image :UIImage?
    {
        didSet
        {
            if let i = self.image
            {
                self.imageView = UIImageView(image: i)
            }
        }
    }
    
    func setMnimumZoomScale(){
        if UIDevice.current.orientation.isLandscape {
            scrollView.minimumZoomScale = self.view.bounds.height / (imageView?.bounds.width)!
            if (scrollView.zoomScale <= scrollView.minimumZoomScale) {
                scrollView.zoomScale = scrollView.minimumZoomScale
            }
            print("Landscape")
        } else {
            scrollView.minimumZoomScale = self.view.bounds.width / (imageView?.bounds.width)!
            if (scrollView.zoomScale <= scrollView.minimumZoomScale) {
                scrollView.zoomScale = scrollView.minimumZoomScale
            }
            print("Portrait")
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        setMnimumZoomScale()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.addSubview(self.imageView!)
        scrollView.contentSize = (imageView?.frame.size)!
        setMnimumZoomScale()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
