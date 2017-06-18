//
//  PostCell.swift
//  devslopes-social
//
//  Created by Marton Zeisler on 2017. 06. 18..
//  Copyright © 2017. scapp. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImg: CircleView!

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var caption: UITextView!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    var post: Post!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(post: Post, img: UIImage? = nil) {
        self.post = post
        self.caption.text = post.caption
        self.likesLabel.text = "\(post.likes)"
        
        if img != nil {
            self.postImg.image = img
        } else {
            let ref = Storage.storage().reference(forURL: post.imageUrl)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("Marton: Unable to download image from Firebase storage")
                } else {
                    print("Marton: Image downloaded from Firebase storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImg.image = img
                            FeedVC.imageCache.setObject(img, forKey: post.imageUrl as NSString)
                        }
                    }
                }
            })
        }
      
        
        

    } // end of configureCell

   
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
