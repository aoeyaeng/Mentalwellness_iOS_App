//
//  questionViewController3.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 8/12/2567 BE.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class questionViewController14: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var finalScore = 0
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
        // บันทึกคะแนนเข้า Firebase
        saveScoreToFirestore(finalScore: sumscore)
    }
    
    // ฟังก์ชันบันทึกคะแนนเข้า Firestore
    func saveScoreToFirestore(finalScore: Int) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        
        db.collection("users").document(userID).setData([
            "totalScore": finalScore,
            "timestamp": Timestamp(date: Date())
        ], merge: true) //{ error in
            //if let error = error {
               // self.showAlert(title: "Error", message: "Failed to //save score: \(error.localizedDescription)")
            //} else {
            //    self.showAlert(title: "Success", message: "Your score: \(finalScore)")
           // }
       // }
    }
//
//    // ฟังก์ชันแสดง Alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
           
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func goSumarytapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "homeInApp", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "sumaryQuestioviewcon") as! sumaryQuestioviewcon
            nextVC.sumscore = sumscore

            let alert = UIAlertController(title: "Success", message: "Your score: \(sumscore)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.navigationController?.pushViewController(nextVC, animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }

//        let storyboard = UIStoryboard(name: "homeInApp", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "sumaryQuestioviewcon") as! sumaryQuestioviewcon
//        nextVC.sumscore = sumscore
//        self.showAlert(title: "Success", message: "Your score: \(sumscore)")
//        self.navigationController?.pushViewController(nextVC, animated: true)
//    }
}
