//
//  GameMenuViewController.swift
//  WebViewProb
//
//  Created by WiFi Chua Team on 8/2/16.
//  Copyright © 2016 WiFiChua. All rights reserved.
//

import UIKit

class GameMenuViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var urlString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.scrollView.bounces = false
        
        // Do any additional setup after loading the view.
        self.loadWeb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWeb()
    {
        let urlString = "http://188.166.237.64/"
        let url = NSURL(string: urlString)
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("URL : \(request.URL?.absoluteString)")
        
        switch navigationType {
        case .LinkClicked:
            if let url = request.URL?.absoluteString
            {
                self.urlString = url
                self.performSegueWithIdentifier("ShowPlayGame", sender: self)
            }
            
            return false
        default:
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let playGameViewControll = segue.destinationViewController as? PlayGameViewController
        {
            playGameViewControll.urlString = self.urlString
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
