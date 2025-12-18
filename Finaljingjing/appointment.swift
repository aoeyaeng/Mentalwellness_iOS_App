//
//  appointment.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 9/12/2567 BE.
//

import UIKit

class appointment: UITableViewController {

        var DoctorNames: [String] = [String]()
        var Details: [String] = [String]()
        var DoctorImages: [String] = [String]()
    var web:[String] = [String]()
        override func viewDidLoad() {
            super.viewDidLoad()

         web = ["https://www.instagram.com/bbn_soundup?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
                      "https://www.instagram.com/aoey_srk?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==",
                      "https://www.instagram.com/besttxat?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw=="]
   
            DoctorNames = ["jung jaehyun",
                               "kim taehyung",
                               "ryu sunjae"]
                        
                   
            Details = ["Psychologist 5.0",
                            "Psychologist 4.9",
                            "Psychologist 4.8"]
                            
                   
            DoctorImages = ["doctor1.jpg",
                                "doctor2.jpg",
                                "doctor3.jpg"]
                   
            tableView.rowHeight = 150
               }
        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DoctorNames.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath) as! TableViewCell
            cell.lbTOP.text = DoctorNames[indexPath.row]
            cell.lbBOT.text = Details[indexPath.row]
            cell.lbIMG.image = UIImage(named: DoctorImages[indexPath.row])
            return cell
        }


        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "passdata" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destinationController = segue.destination as! contactDoctor
                    destinationController.Name = DoctorNames[indexPath.row]
                    destinationController.detail = Details[indexPath.row]
                    destinationController.row = indexPath.row
                    destinationController.web = web[indexPath.row]
                }
            }
        }
            }



