//
//  DetailViewController.swift
//  TableViewProject
//
//  Created by peppermint100 on 2023/03/01.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = movie?.movieImage
        movieNameLabel.text = movie?.movieName
        descriptionLabel.text = movie?.movieDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
