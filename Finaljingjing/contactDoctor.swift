//
//  contactDoctor.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 9/12/2567 BE.
//

import UIKit
import WebKit

class contactDoctor: UIViewController {
    
    var Name:String=""
    var detail:String=""
    var web:String=""
    var vdo:String=""
    var row:Int=0
    
    
    @IBOutlet weak var lbShow: UILabel!
    
    @IBOutlet weak var detailshow: UILabel!
    
    @IBOutlet weak var webShow: WKWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        let myURL = URL(string: web)
        let myRequest =  URLRequest(url: myURL!)
        webShow.load(myRequest)
        lbShow.text=Name
        detailshow.text=detail
        
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
