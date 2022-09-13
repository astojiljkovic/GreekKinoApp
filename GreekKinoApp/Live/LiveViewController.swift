//
//  LiveViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit
import WebKit

class LiveViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    // TODO: Fix size of the window 
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: Constants.live) else { return }
        webView.load(URLRequest(url: url))
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        webView.frame = view.bounds
//    }
    
}
