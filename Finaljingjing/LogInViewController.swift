import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var togglePasswordButton: UIButton!

    var isPasswordVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // ตั้งค่าให้ช่อง Password เป็น Secure Text Entry เริ่มต้น
        passwordTextField.isSecureTextEntry = true
        updateToggleButtonImage()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter both email and password.")
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // แสดงแจ้งเตือนเมื่อเข้าสู่ระบบล้มเหลว
                self.showAlert(title: "Login Failed", message: error.localizedDescription)
                return
            }

            // แสดงแจ้งเตือนเมื่อเข้าสู่ระบบสำเร็จ
            self.showAlert(title: "Login Successful", message: "Welcome back!") { _ in
                // โหลด Storyboard "homeInApp.storyboard"
                let storyboard = UIStoryboard(name: "homeInApp", bundle: nil)

                // สร้าง View Controller ด้วย Storyboard ID "HomeViewController1"
                if let homePageViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController1") as? HomeViewController {
                    homePageViewController.modalPresentationStyle = .fullScreen
                    self.present(homePageViewController, animated: true, completion: nil)
                }
            }
        }
    }

    // ฟังก์ชันสำหรับแสดง Alert
    func showAlert(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: completion))
        self.present(alert, animated: true, completion: nil)
    }

    // ฟังก์ชันแสดง/ซ่อนรหัสผ่าน
    @IBAction func togglePasswordVisibility(_ sender: UIButton) {
        isPasswordVisible.toggle()
        passwordTextField.isSecureTextEntry = !isPasswordVisible
        updateToggleButtonImage()
    }

    // อัปเดตรูปปุ่มแสดง/ซ่อนรหัสผ่าน
    func updateToggleButtonImage() {
        let imageName = isPasswordVisible ? "eye.fill" : "eye.slash.fill"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
