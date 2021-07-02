////
////  WebView.swift
////  TrendingApp
////
////  Created by Tuyen on 28/06/2021.
////
//
//import UIKit
//import WebKit
//class WebViews: UIViewController {
//
//    @IBOutlet weak var WebView: WKWebView!
//    var TrendURL : String?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        TrendURL = TrendURL?.replacingOccurrences(of: "", with: "")
//        TrendURL = TrendURL?.replacingOccurrences(of: "\n", with: "")
//        WebView.load(URLRequest(url: URL(string: TrendURL! as String)!))
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear( animated )
//    }
//}
