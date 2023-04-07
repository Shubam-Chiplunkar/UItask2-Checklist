//
//  MyTableViewCell.swift
//  UItask2 Checklist
//
//  Created by mayank ranka on 27/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var images: UIImageView!
    
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    
    @IBOutlet weak var pledgeButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var label100: UILabel!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelSubTitle: UILabel!
    
    @IBOutlet weak var labelFundedCost: UILabel!
    
    @IBOutlet weak var labelFunded: UILabel!
    
    @IBOutlet weak var labelTotalCost: UILabel!
    
    @IBOutlet weak var labelTotal: UILabel!
    
    @IBOutlet weak var labelTimeLeft: UILabel!
    
    @IBOutlet weak var labelTime: UILabel!
    
    
    
    
    
    func setConfiguration(){
        rightView.layer.cornerRadius = rightView.layer.bounds.width / 2
        rightView.clipsToBounds = true
        leftView.layer.cornerRadius = 10
        pledgeButton.layer.cornerRadius = 10

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setConfiguration()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
