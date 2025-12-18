//
//  AiChat.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 9/12/2567 BE.
//

import UIKit
import WebKit

class AiChat: UIViewController{
//    , UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
        @IBOutlet weak var webView: WKWebView!

        override func viewDidLoad() {
            super.viewDidLoad()

            if let url = URL(string: "https://chat.openai.com") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
    //
    //    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var messageTextField: UITextField!
    //    @IBOutlet weak var sendButton: UIButton!
    //
    //    var messages: [(String, String)] = [] // (ข้อความ, ผู้ส่ง)
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        tableView.delegate = self
    //        tableView.dataSource = self
    //        messageTextField.delegate = self
    //    }
    //
    //    @IBAction func sendButtonTapped(_ sender: Any) {
    //        guard let message = messageTextField.text, !message.isEmpty else { return }
    //        sendMessage(text: message)
    //        messageTextField.text = ""
    //    }
    //
    //    func sendMessage(text: String) {
    //        // เพิ่มข้อความของผู้ใช้ใน tableView
    //        messages.append((text, "user"))
    //        tableView.reloadData()
    //
    //        // เรียก API ของ ChatGPT
    //        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else { return }
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.setValue(", forHTTPHeaderField: "Authorization")
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        let requestBody: [String: Any] = [
    //            "model": "gpt-3.5-turbo",
    //            "messages": [["role": "user", "content": text]]
    //        ]
    //        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
    //
    //        URLSession.shared.dataTask(with: request) { data, response, error in
    //            if let data = data {
    //                do {
    //                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
    //                       let choices = json["choices"] as? [[String: Any]],
    //                       let firstChoice = choices.first,
    //                       let message = firstChoice["message"] as? [String: Any],
    //                       let content = message["content"] as? String {
    //                        DispatchQueue.main.async {
    //                            // เพิ่มข้อความของ ChatGPT ใน tableView
    //                            self.messages.append((content, "ChatGPT"))
    //                            self.tableView.reloadData()
    //                        }
    //                    }
    //                } catch {
    //                    print("Error decoding JSON: \(error)")
    //                }
    //            }
    //        }.resume()
    //    }
    //
    //    // MARK: - UITableViewDataSource
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return messages.count
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
    //        let (message, sender) = messages[indexPath.row]
    //        cell.textLabel?.text = message
    //        cell.detailTextLabel?.text = sender
    //        return cell
    //    }
    //
    //    // MARK: - UITextFieldDelegate
    //
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        sendButtonTapped(sendButton)
    //        return true
    //    }
    //}

