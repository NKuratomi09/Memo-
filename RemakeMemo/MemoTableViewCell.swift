//
//  MemoTableViewCell.swift
//  RemakeMemo
//
//  Created by 倉富直城 on 2017/11/04.
//  Copyright © 2017年 com.kuratomi. All rights reserved.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var memoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
