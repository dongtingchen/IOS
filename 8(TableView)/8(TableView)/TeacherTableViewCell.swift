//
//  TeacherTableViewCell.swift
//  8(TableView)
//
//  Created by student on 2018/11/29.
//  Copyright © 2018年 xudongting. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
