//
//  LiveViewController.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 12.9.22..
//

import UIKit
import WebKit

class LiveViewController: UIViewController {

    let webView = WKWebView()
    // TODO: Fix size of the window 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = URL(string: Constats.live) else { return }
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
