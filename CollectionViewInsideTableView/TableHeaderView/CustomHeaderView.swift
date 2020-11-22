//  CustomHeaderView.swift
//  EnActSystemTask
//  Created by Ranjeet Raushan on 18/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
class CustomHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var headerLabel: UILabel!
    class var customView : CustomHeaderView {
        let cell = Bundle.main.loadNibNamed("CustomHeaderView", owner: self, options: nil)?.last
        return cell as! CustomHeaderView
    }
    
   override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.clear
    }
}
