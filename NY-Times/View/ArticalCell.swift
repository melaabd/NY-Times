//
//  ArticalCell.swift
//  NY-Times
//
//  Created by Alfoah IOS on 06/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var dateIcon:UIImageView!
    @IBOutlet weak var articleIcon:UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateIcon.image = UIImage(named: "date_icon")
        // Initialization code
    }


}
