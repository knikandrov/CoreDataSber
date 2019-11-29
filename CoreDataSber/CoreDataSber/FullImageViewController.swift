//
//  FullImageViewController.swift
//  CoreDataSber
//
//  Created by Konstantin Nikandrov on 30.11.2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//

import Foundation
import UIKit

class FullImageViewController: UIViewController {
    
    let MyImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.masksToBounds = true
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyImageView.frame = view.frame
        
        setupUI()
    }
    
    
    func setPhotoCellWith(photo: Photo) {
        DispatchQueue.main.async {
            if let url = photo.mediaURL {
                self.MyImageView.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
            }
        }
    }
    
    
    func setupUI() {
        view.addSubview(MyImageView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            MyImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            MyImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            MyImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            MyImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),
            MyImageView.topAnchor.constraint(equalTo: safeArea.topAnchor)
            ])
    }
}
