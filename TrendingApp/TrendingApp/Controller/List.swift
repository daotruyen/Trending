//
//  List.swift
//  TrendingApp
//
//  Created by Tuyen on 29/06/2021.
//

import UIKit

class List: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //var value: String!
    var youtubes: [Item] = []
    let network = NetworkYoutube()
    var titleVideo: String = ""
    //var titleText: String =  ""
    @IBOutlet weak var ListYoutube: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(youtubes.count)
        return youtubes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListYoutube.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListCell
        let url = NSURL(string:(String(youtubes[indexPath.row].snippet.thumbnails.thumbnailsDefault.url)))
        let data = NSData(contentsOf: url! as URL)
        let image = UIImage(data: data! as Data)
        cell.ImageYoutube?.image = image
        cell.titleYoutube.text = (String(youtubes[indexPath.row].snippet.title))
        cell.descriptionTtb.text = (String(youtubes[indexPath.row].snippet.snippetDescription))
        cell.dateYtb.text = (String(youtubes[indexPath.row].snippet.publishedAt))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ListCell
        let videoIds = PlayYoutube()
        //listView.titleVideo = cell.ContentCell.text!
        videoIds.videoId = (String(youtubes[indexPath.row].id.videoID))
        
        self.navigationController?.pushViewController(videoIds, animated : true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "youtube"
        ListYoutube.register(UINib(nibName:"ListCell",bundle: nil), forCellReuseIdentifier: "cell")
        ListYoutube.delegate = self
        ListYoutube.dataSource = self
        ListYoutube.rowHeight = UITableView.automaticDimension
        loadData(titleVideo: titleVideo)
        print(titleVideo)
    }
    func loadData(titleVideo : String){
        network.getPopularMoviesData(value: titleVideo){ [self](youtube) in
            for id in 0..<youtube.items.count {
                self.youtubes.append(youtube.items[id])
            }
            DispatchQueue.main.async {
                ListYoutube.reloadData()
            }
            print(youtubes)
        }
    }
}

