//
//  MovieCell.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit
import Kingfisher

class MovieCell: SeizingCollectionCell{
    
    //MARK: - Outlet
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var moviewNameLabel: UILabel!
    
    
    //MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    //MARK: - Configure Movie Cell
    func configureMovieCell(movie: Movie) {
        movieImage.kf.indicator?.startAnimatingView()
        movieImage.kf.indicatorType = .activity
        let imagePath = URL(string: "\(Constants.imageURL)/\(movie.backdropPath ?? " ")")
        movieImage.kf.setImage(with: imagePath)

        moviewNameLabel.text = movie.title
    }
    
}
