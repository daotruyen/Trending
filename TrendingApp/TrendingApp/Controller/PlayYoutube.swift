//
//  PlayYoutube.swift
//  TrendingApp
//
//  Created by Tuyen on 30/06/2021.
//

import UIKit
import youtube_ios_player_helper
class PlayYoutube: UIViewController, YTPlayerViewDelegate {

    @IBOutlet weak var Play: YTPlayerView!
    var videoId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let overPlayer = YTPlayerView()
        view.addSubview(overPlayer)
        
        Play.delegate = self
        Play.load(withVideoId: videoId,playerVars: ["playsinline":1])
        // Do any additional setup after loading the view.
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        Play.playVideo()
    }

}
