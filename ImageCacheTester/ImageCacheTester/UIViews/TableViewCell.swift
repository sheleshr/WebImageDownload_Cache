//
//  TableViewCell.swift
//  ImageCacheTester
//
//  Created by Administrator on 23/06/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: SWebImageView!
    @IBOutlet weak var rightImageView: SWebImageView!
    
    @IBOutlet weak var leftLbl: UILabel!
    @IBOutlet weak var rightLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("********")
        leftImageView.layer.cornerRadius = 8.0
        leftImageView.layer.borderColor = UIColor.gray.cgColor
        leftImageView.layer.borderWidth = 1.0
        
        rightImageView.layer.cornerRadius = 8.0
        rightImageView.layer.borderColor = UIColor.gray.cgColor
        rightImageView.layer.borderWidth = 1.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
