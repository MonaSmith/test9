//
//  ViewController.swift
//  ScrollView
//
//  Created by apple on 2018/11/27.
//  Copyright © 2018年 wanfengling. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var scrollView1: UIScrollView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //放大缩小
        let imageView = UIImageView(image: UIImage(named:"1"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return scrollView.subviews.first
        }
        
        //滚屏浏览
        for i in 1...7{
            let imageView1 = UIImageView(image: UIImage(named:"\(i)"))
            imageView1.contentMode = .scaleAspectFit
            imageView1.frame = CGRect(x: CGFloat(i-1)*scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
            scrollView1.addSubview(imageView1)
            scrollView1.isPagingEnabled = true
        }
        scrollView1.contentSize = CGSize(width: 7 * scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.delegate = self
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scrollView1.showsHorizontalScrollIndicator = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView1.contentOffset.x / scrollView1.bounds.width)
    }
    
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.scrollRectToVisible(rect, animated: true)
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

