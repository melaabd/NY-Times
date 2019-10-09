//
//  DetailsVC.swift
//  NY-Times
//
//  Created by Alfoah IOS on 09/10/2019.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {
    
    var detailsTxt:String = ""
    var imageURL:String = ""

    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var detailsImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }
    
    func fillData(){
        detailsLbl.text = detailsTxt
        detailsImg.sd_setImage(with: URL(string:imageURL),placeholderImage: UIImage(named: "placeHolder"))
    }

}
