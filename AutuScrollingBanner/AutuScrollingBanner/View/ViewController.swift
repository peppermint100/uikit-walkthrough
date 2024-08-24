//
//  ViewController.swift
//  AutuScrollingBanner
//
//  Created by peppermint100 on 8/23/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let vm = ViewModel()
    private var cancelBag = Set<AnyCancellable>()

    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var bannerIndexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLabel()
        vm.fetchImageNames()
        bind()
        vm.bannerIndex = 1
    }
}

extension ViewController {
    
    private func setupCollectionView() {
        let nib = UINib(nibName: BannerCollectionViewCell.identifier, bundle: nil)
        bannerCollectionView.register(nib, forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.showsHorizontalScrollIndicator = false
        let layout = createLayout()
        bannerCollectionView.collectionViewLayout = layout
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: bannerCollectionView.frame.width, height: 150)
        return layout
    }
    
    private func setupLabel() {
        bannerIndexLabel.layer.cornerRadius = 10
        bannerIndexLabel.clipsToBounds = true
    }
    
    private func bind() {
        vm.bannerIndexPublisher.sink { [weak self] bannerIndex in
            guard let self = self else { return }
            var visibleBannerIndex = 0
            if bannerIndex == 0 {
                visibleBannerIndex = vm.visibleImageNames.count
            } else if bannerIndex == vm.imageNames.count - 1 {
                visibleBannerIndex = 1
            } else{
                visibleBannerIndex = bannerIndex
            }
            self.bannerIndexLabel.text = "\(visibleBannerIndex)/\(self.vm.visibleImageNames.count)"
            self.bannerCollectionView.scrollToItem(at: IndexPath(row: visibleBannerIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
        .store(in: &cancelBag)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard vm.imageNames.count > 2 else {
            vm.bannerIndex = 0
            return
        }
        let currentIndex = Int(scrollView.contentOffset.x / bannerCollectionView.frame.width)
        vm.bannerIndex = currentIndex
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifier, for: indexPath) as? BannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        let image = UIImage(named: vm.imageNames[indexPath.row])
        cell.configure(with: image)
        return cell
    }
}
