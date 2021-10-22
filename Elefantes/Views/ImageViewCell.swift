//
//  ImageViewCell.swift
//  Elefantes
//
//  Created by Rayana Prata Neves on 22/10/21.
//

import UIKit
import SnapKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    
    private var uiiv_Image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.uiiv_Image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(url: URL, rounded: Bool = false ) {
        
        if rounded {
            self.uiiv_Image.layer.cornerRadius = 20
//            self.uiiv_Image.layer.borderWidth = 1
//            self.uiiv_Image.layer.borderColor = UIColor.gray.cgColor
            self.uiiv_Image.layer.masksToBounds = true
            self.uiiv_Image.contentMode = .scaleAspectFill
        }
        
        self.uiiv_Image.kf.setImage(with: url,
                                    options: [
                                        .cacheOriginalImage
                                    ], completionHandler: { result in
                                        
                                    })
        
        self.uiiv_Image.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(250)
            make.height.equalTo(250)
        }
    }
}
