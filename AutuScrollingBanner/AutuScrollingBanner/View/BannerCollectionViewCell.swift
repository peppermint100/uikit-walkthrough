//
//  BannerCollectionViewCell.swift
//  AutuScrollingBanner
//
//  Created by peppermint100 on 8/23/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: BannerCollectionViewCell.self)

    @IBOutlet var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension BannerCollectionViewCell {
    func configure(with image: UIImage?) {
        bannerImage.image = image
    }
}
