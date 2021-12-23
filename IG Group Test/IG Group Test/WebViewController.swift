//
//  WebViewController.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/23.
//

import UIKit
import WebKit
import AVKit
import AVFoundation

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var webUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = webUrl {
            let webUrl = URL(string: url)!
            webView.load(URLRequest(url: webUrl))
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    

}
    
