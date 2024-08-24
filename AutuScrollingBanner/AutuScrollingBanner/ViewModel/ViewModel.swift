//
//  ViewModel.swift
//  AutuScrollingBanner
//
//  Created by peppermint100 on 8/23/24.
//

import Foundation
import Combine

final class ViewModel {
    
    private var cancelBag = Set<AnyCancellable>()
    private var timer: AnyCancellable?

    @Published var imageNames: [String] = []
    @Published var visibleImageNames: [String] = []
    @Published var bannerIndex = 0
    var bannerIndexPublisher: Published<Int>.Publisher { $bannerIndex }
    
    func fetchImageNames() {
        let fetchedImages = ["Image1", "Image2", "Image3"]
        if fetchedImages.count > 1 {
            imageNames = [fetchedImages.last!] + fetchedImages + [fetchedImages.first!]
        } else {
            imageNames = fetchedImages
        }
        visibleImageNames = fetchedImages
    }
}
