//
//  PostCell.swift
//  devslopes-social
//
//  Created by Marton Zeisler on 2017. 06. 18..
//  Copyright © 2017. scapp. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImg: CircleView!

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var caption: UITextView!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

   
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
