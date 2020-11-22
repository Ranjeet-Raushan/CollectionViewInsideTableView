//  CustomCollectionViewCell.swift
//  EnActSystemTask
//  Created by Ranjeet Raushan on 18/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var lbl_cost: UILabel!
    @IBOutlet weak var lbl_bedsAndbathroom: UILabel!
    @IBOutlet weak var btn_location: UIButton!
    

    var cellImageName:String?
    class var CustomCell : CustomCollectionViewCell {
        let cell = Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)?.last
        return cell as! CustomCollectionViewCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clear
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        cellImageView.layer.cornerRadius = cellImageView.frame.height/9
        cellImageView.clipsToBounds = true

    }
    
    func updateCellWithImage(name:String) {
        self.cellImageName = name
        self.cellImageView.image = UIImage(named: name)
    }
}
