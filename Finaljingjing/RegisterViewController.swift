import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBAction func registerTapped(_ sender: UIButton) {
        // ตรวจสอบว่า email, password, และ confirmPassword มีค่าหรือไม่
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text else { return }
        
        // ตรวจสอบว่ารหัสผ่านตรงกันหรือไม่
        guard password == confirmPassword else {
            showAlert(title: "Error", message: "Passwords do not match. Please try again.")
            return
        }

        // สร้างบัญชีผู้ใช้ใหม่ด้วย Firebase
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // แสดงข้อความเตือนเมื่อการสมัครล้มเหลว
                self.showAlert(title: "Registration Failed", message: error.localizedDescription)
                return
            }

            // สมัครสำเร็จ
            self.showAlert(title: "Success", message: "User registered successfully.") { _ in
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    // ฟังก์ชันสำหรับแสดง Alert พร้อม Action
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }
}
