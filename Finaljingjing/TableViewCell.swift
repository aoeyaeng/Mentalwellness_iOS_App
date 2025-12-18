//
//  TableViewCell.swift
//  Finaljingjing
//
//  Created by Siwakorn Phanitphichetvong on 9/12/2567 BE.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbIMG: UIImageView!
    @IBOutlet weak var lbTOP: UILabel!
    @IBOutlet weak var lbBOT: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
