//
//  PopularViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit

class PopularViewController: CustomCollectionViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var popularMoviesCollectionView: UICollectionView!
    
    
    //MARK: - Propertise
    let popularMoviesViewModel = PopularMoviesViewModel()
    
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        observeOnPageChanging()
        configureCollectionViewRegisteration()
        configureCollectionViewCell()
        configureSelectingOnCollectionViewCell()
        configureCollectionViewPagination()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationLargeTitle(title: "Popular Movies")
    }
    
}


//MARK: - Private Functions For Collection View
extension PopularViewController: UICollectionViewDelegateFlowLayout {
    
    //MARK: Configure Collection View Registeration
    private func configureCollectionViewRegisteration() {
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        popularMoviesCollectionView.register(nib, forCellWithReuseIdentifier: "MovieCell")
        popularMoviesCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        guard let collectionFlowLayout = popularMoviesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let verticalSpacing = collectionFlowLayout.minimumInteritemSpacing
        let cellWidth = (popularMoviesCollectionView.frame.width - max(0, 2 - 1) * verticalSpacing) / 2
        collectionFlowLayout.estimatedItemSize = CGSize(width: cellWidth, height: 250)
    }
    
    
    //MARK: Configure Collection View Cell
    private func configureCollectionViewCell() {
        configureCollectionViewCell(items: popularMoviesViewModel.popularMoviesBehaviorRelay, collectionView: popularMoviesCollectionView, collectionCellIdentifier: "MovieCell") { row, movie, cell in
            guard let cell = cell as? MovieCell else { return }
            cell.configureMovieCell(movie: movie)
        }
    }
    
    
    //MARK: Configure Selecting On Collection View Cell
    private func configureSelectingOnCollectionViewCell() {
        configureSelectingOnCollectionViewCell(collectionView: popularMoviesCollectionView, selectedModule: Movie.self) { [weak self] movie, indexPath in
            guard let self = self else { return }
            self.navigateToMovieDetails(selectedMovie: movie)
        }
    }
    
    
    //MARK: Configure Collection View Pagination
    private func configureCollectionViewPagination() {
        configureCollectionViewPagination(collectionView: popularMoviesCollectionView) { [weak self] cell, indexPath in
            guard let self = self else { return }
            indexPath.row == self.popularMoviesViewModel.popularMoviesBehaviorRelay.value.count - 1 ? self.popularMoviesViewModel.increasePageNumber() : nil
        }
    }
    
}


//MARK: - Private Functions
extension PopularViewController {
    
    //MARK: Observe On Page Changing
    private func observeOnPageChanging() {
        popularMoviesViewModel.observeOnPageChanging()
    }
    
    
    //MARK: Navigate To Movie Details
    private func navigateToMovieDetails(selectedMovie: Movie) {
        let storyboard = UIStoryboard(name: "Popular", bundle: nil)
        if let movieDetailsVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController {
            movieDetailsVC.movieDetailsViewModel.selectedMovieBehaviorRelay.accept(selectedMovie)
            movieDetailsVC.modalPresentationStyle = .overCurrentContext
            present(movieDetailsVC, animated: true, completion: nil)
        }
    }
    
}

