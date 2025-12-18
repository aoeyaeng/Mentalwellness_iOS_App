//
//  sumaryQuestioviewcon.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 8/12/2567 BE.
//

import UIKit

class sumaryQuestioviewcon: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel! // เชื่อมกับ UILabel ใน Storyboard
    @IBOutlet weak var resultDescription1: UILabel!
    
    @IBAction func finishformtapped(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var resultDescription3: UILabel!
    @IBOutlet weak var resultDescription2: UILabel!
    var sumscore = 0 // รับคะแนนจากหน้าก่อนหน้า
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResult()
    }
    
    // ฟังก์ชันสำหรับแสดงผลการประเมินคะแนน
    func displayResult() {
        if sumscore >= 14 && sumscore <= 24 {
            resultLabel.text = "ต่ำกว่าปกติ"
            resultDescription1.text = "คุณมีระดับความเครียดต่ำกว่าปกติ"
            resultDescription2.text = "ถือว่าอยู่ในเกณฑ์ที่ดีเยี่ยม"
            resultDescription3.text = "รักษาสภาพนี้ไว้และดูแลสุขภาพให้ดี"
            
        } else if sumscore >= 25 && sumscore <= 38 {
            resultLabel.text = "ปกติ"
            resultDescription1.text = "ระดับความเครียดของคุณอยู่ในเกณฑ์ปกติ"
            resultDescription2.text = "แนะนำให้ทำกิจกรรมที่ผ่อนคลาย"
            resultDescription3.text = "เพื่อรักษาสมดุลในการใช้ชีวิต"
            
        } else if sumscore >= 39 && sumscore <= 47 {
            resultLabel.text = "สูงกว่าเกณฑ์ปกติ"
            resultDescription1.text = "คุณมีระดับความเครียดสูงกว่าเกณฑ์ปกติเล็กน้อย"
            resultDescription2.text = "ควรหากิจกรรมผ่อนคลาย เช่น ออกกำลังกาย"
            resultDescription3.text = "หรือพูดคุยกับคนใกล้ชิดเพื่อคลายความเครียด"
            
        } else if sumscore >= 48 && sumscore <= 56 {
            resultLabel.text = "สูงกว่าปกติมาก"
            resultDescription1.text = "ความเครียดของคุณสูงกว่าปกติมากและอาจ"
            resultDescription2.text = "ส่งผลกระทบต่อการใช้ชีวิตประจำวัน"
            resultDescription3.text = "แนะนำให้พบผู้เชี่ยวชาญเพื่อรับคำแนะนำ"
            
        } else {
            resultLabel.text = "คะแนนไม่ถูกต้อง"
 
        }
    }

}

