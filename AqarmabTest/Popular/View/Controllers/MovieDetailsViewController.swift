//
//  MovieDetailsViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit
import Kingfisher
import RxSwift


class MovieDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    
    //MARK: - Propertise
    let movieDetailsViewModel = MovieDetailsViewModel()
    let disposeBag = DisposeBag()
    
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        observeOnSelectedMovie()
        configureDismissButtonTap()
    }
    
}


//MARK: - Private Functions
extension MovieDetailsViewController {
    
    //MARK: Observe On Selected Movie
    private func observeOnSelectedMovie() {
        movieDetailsViewModel.selectedMovieBehaviorRelay
            .subscribe(onNext: { [weak self] selectedMovie in
                guard let self = self, let selectedMovie = selectedMovie else { return }
                self.configureSelectedMovieData(selectedMovie: selectedMovie)
            }).disposed(by: disposeBag)
    }
    
    
    //MARK: Configure Selected Movie Data
    private func configureSelectedMovieData(selectedMovie: Movie) {
        moviePosterImage.kf.indicator?.startAnimatingView()
        moviePosterImage.kf.indicatorType = .activity
        let imagePath = URL(string: "\(Constants.imageURL)/\(selectedMovie.posterPath ?? " ")")
        moviePosterImage.kf.setImage(with: imagePath)

        movieNameLabel.text = selectedMovie.title
        movieRateLabel.text = String(selectedMovie.voteAgerage ?? 0)
        movieDateLabel.text = "Release Date : \(selectedMovie.releaseDate?.convertDate(fromDateFormat: "yyyy-MM-dd", toDateFormat: "dd-MM-yyyy") ?? "")"
        movieOverviewLabel.text = selectedMovie.overview
    }
    
    
    //MARK: Configure Dismiss Button Tap
    private func configureDismissButtonTap() {
        dismissButton.rx.tap.throttle(RxTimeInterval.milliseconds(300), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: true, completion: nil)
            }).disposed(by: disposeBag)
    }
    
}
