//
//  beginQuestion.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 8/12/2567 BE.
//

import UIKit

class beginQuestion: UIViewController {

    @IBOutlet weak var startButton: UIButton!
           
           override func viewDidLoad() {
               super.viewDidLoad()
           }
           @IBAction func startTestTapped(_ sender: UIButton) {
               let storyboard = UIStoryboard(name: "homeInApp", bundle: nil)
               if let questionVC = storyboard.instantiateViewController(withIdentifier: "questionViewController1") as? questionViewController1 {
                   // ถ้าอยู่ใน Navigation Controller
                   self.navigationController?.pushViewController(questionVC, animated: true)
                   
               }
           }
    
}
