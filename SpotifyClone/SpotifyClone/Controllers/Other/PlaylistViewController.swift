//
//  PlaylistViewController.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import UIKit

class PlaylistViewController: UIViewController {

    private var playlist: Playlist
    
    init (playlist: Playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.backgroundColor = .systemBackground
        APICaller.shared.getPlaylistDetails(for: playlist) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
    }

}
