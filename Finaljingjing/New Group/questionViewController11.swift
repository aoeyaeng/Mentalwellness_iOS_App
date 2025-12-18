//
//  questionViewController11.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 8/12/2567 BE.
//

import UIKit

class questionViewController11: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    var sumscore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  @IBAction func answerSelected(_ sender: UIButton) {
        var selectedScore = 0

        switch sender {
        case button1:
            selectedScore = 1
        case button2:
            selectedScore = 2
        case button3:
            selectedScore = 3
        case button4:
            selectedScore = 4
        default:
            break
        }
      sumscore+=selectedScore
        // ส่งคะแนนไปยังคลาสถัดไป
        let storyboard = UIStoryboard(name: "homeInApp", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "questionViewController12") as! questionViewController12
      nextVC.sumscore = sumscore
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
