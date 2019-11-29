//
//  TableViewCell.swift
//  CoreDataSber
//
//  Created by Konstantin Nikandrov on 29.11.2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let MyImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false

        img.layer.masksToBounds = true
        return img
    }()
    
    
    public static let reuseId = "MyReuseID"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        MyImageView.frame = self.contentView.frame
        MyImageView.center = self.contentView.center
        contentView.addSubview(MyImageView)
        MyImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        MyImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        MyImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -200).isActive = true
        MyImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    func setPhotoCellWith(photo: Photo) {
        DispatchQueue.main.async {
            if let url = photo.mediaURL {
                self.MyImageView.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
}
