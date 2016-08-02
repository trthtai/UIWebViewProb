//
//  PlayGameViewController.swift
//  WebViewProb
//
//  Created by WiFi Chua Team on 8/2/16.
//  Copyright © 2016 WiFiChua. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var urlString : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.webView.scrollView.bounces = false
        
        let url = NSURL(string: self.urlString)
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchCloseButton(sender: AnyObject) {
        
        self.webView.loadHTMLString("", baseURL: nil)
        self.webView.stopLoading()
        self.webView.delegate = nil
        
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
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
