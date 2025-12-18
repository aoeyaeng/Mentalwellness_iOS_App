//
//  webviewcon.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 9/12/2567 BE.
//

import UIKit
import WebKit
import FirebaseFirestore
class webviewcon: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        db.collection("websites").document("doc1").getDocument { document, _ in
                   let urlString = document?.data()?["websiteUrl"] as? String ?? "https://example.com"
                   print("URL จาก Firestore: \(urlString)")  // Debug เพื่อดูว่าได้ URL อะไรมา
                   
                   if let url = URL(string: urlString) {
                       self.webView.load(URLRequest(url: url))
                   } else {
                       print("URL ไม่ถูกต้อง")
                   }
               }
        }
    }

