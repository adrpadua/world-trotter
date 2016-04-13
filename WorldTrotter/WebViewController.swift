//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Adrian Padua on 4/13/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string:"https://www.google.com/")
        let req = NSURLRequest(URL:url!)
        self.webView!.loadRequest(req)
        
        print("WebViewController loaded its view.")
    }

    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!

    }
}
