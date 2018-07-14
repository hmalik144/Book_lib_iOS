//
//  TableViewCell.swift
//  Books_App
//
//  Created by h_mal on 09/07/2018.
//  Copyright © 2018 h_mal. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var bookAuthors: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
