//
//  PopularMoviesViewModel.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import Foundation
import RxSwift
import RxCocoa

class PopularMoviesViewModel {
    
    //MARK: - Propertise
    var pagsBehaviorRelay = BehaviorRelay<Int>(value: 1)
    var popularMoviesBehaviorRelay = BehaviorRelay<[Movie]>(value: [])
    var isPaginating = false
    
    let disposeBag = DisposeBag()
    
    
    //MARK: - Observe On Page Changing
    func observeOnPageChanging() {
        pagsBehaviorRelay
            .subscribe(onNext: { [weak self] page in
                guard let self = self else { return }
                self.getPopularMovies(page: page)
            }).disposed(by: disposeBag)
    }
    
    
    //MARK: - Increase Page Number
    func increasePageNumber() {
        if !isPaginating {
            pagsBehaviorRelay.accept(pagsBehaviorRelay.value + 1)
        }
    }
    
    
    //MARK: - Get Popular Movies
    func getPopularMovies(page: Int) {
        isPaginating = true
        
        APIClient.getPopularMovies(page: page)
            .subscribe { [weak self] results in
                guard let self = self else { return }
                self.appendMovies(newMovies: results.movies ?? [])
                self.isPaginating = false
                
            } onError: { error in
                print(error)
                
            }.disposed(by: disposeBag)
    }
    
    
    //MARK: - Append Movies
    private func appendMovies(newMovies: [Movie]) {
        let previousMovies = popularMoviesBehaviorRelay.value
        let allMovies = previousMovies + newMovies
        popularMoviesBehaviorRelay.accept(allMovies)
    }
    
}
