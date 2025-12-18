import UIKit
import FirebaseAuth


class HomeViewController: UIViewController {

    @IBOutlet weak var uiimage: UIImageView!

        @IBOutlet weak var helloLabel: UILabel!  // เชื่อม IBOutlet กับ UILabel ใน Storyboard

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // ดึงข้อมูลผู้ใช้ที่ล็อกอินอยู่
            if let user = Auth.auth().currentUser {
                let email = user.email ?? "User"
                helloLabel.text = "Hello, \(email)"
            } else {
                helloLabel.text = "Hello, Guest"
            }
        }
    }


