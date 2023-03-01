//
//  MovieCell.swift
//  TableViewProject
//
//  Created by peppermint100 on 2023/03/01.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
