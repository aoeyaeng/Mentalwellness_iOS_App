//
//  ViewController.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 6/12/2567 BE.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {

    @IBOutlet weak var GifImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            let gif = try UIImage(gifName: "mental.gif")
            GifImage.setGifImage(gif, loopCount: -1) // Loop forever
        } catch {
            print("Failed to load GIF: \(error.localizedDescription)")
        }
    }


}

