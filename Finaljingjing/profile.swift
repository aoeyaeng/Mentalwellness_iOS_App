//
//  profile.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 8/12/2567 BE.
//

import UIKit
import FirebaseAuth

class profile: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    // IBOutlet สำหรับ UIImageView และ UILabel
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var helloLabel: UILabel!  // เชื่อม IBOutlet กับ UILabel ใน Storyboard

    override func viewDidLoad() {
        super.viewDidLoad()
        // ดึงข้อมูลผู้ใช้ที่ล็อกอินอยู่
        if let user = Auth.auth().currentUser {
            let email = user.email ?? "User"
            helloLabel.text = "\(email)"
        } else {
            helloLabel.text = "Hello, Guest"
        }
        
        // กำหนดให้รูปภาพเป็นวงกลม
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        // กำหนด Gesture Recognizer สำหรับการแตะที่รูปภาพเพื่อเปลี่ยนรูป
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeProfileImage))
        profileImageView.addGestureRecognizer(tapGesture)
        profileImageView.isUserInteractionEnabled = true
    }
    
    // ฟังก์ชันสำหรับเลือกเปลี่ยนรูปภาพ
    @objc func changeProfileImage() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    // Delegate ฟังก์ชันเมื่อผู้ใช้เลือกรูปภาพเสร็จ
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            profileImageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Delegate ฟังก์ชันเมื่อผู้ใช้ยกเลิกการเลือก
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
