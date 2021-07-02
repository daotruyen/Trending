//
//  MainTrending.swift
//  TrendingApp
//
//  Created by Tuyen on 28/06/2021.
//

import UIKit

class MainTrending: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate {
    @IBOutlet weak var TableViewMain: UITableView!
    
    var trend : NSArray = []
    //var trendImg = String?
    var url : URL!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trend.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let url = NSURL(string: ((trend.object(at: indexPath.row) as AnyObject).object(forKey: "ht:picture") as? String)!)
        
        let data = NSData(contentsOf:url! as URL)
        let image = UIImage(data:data! as Data)

        cell.ImageCell?.image = image
        cell.ContentCell.text = (trend.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String
        cell.NumberCell.text = (trend.object(at: indexPath.row) as AnyObject).object(forKey: "ht:approx_traffic") as? String
        cell.Description.text = (trend.object(at: indexPath.row) as AnyObject).object(forKey: "description") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        let listView = List()
        listView.titleVideo = cell.ContentCell.text!
        
        self.navigationController?.pushViewController(listView, animated : true)
//        performSegue(withIdentifier: "cell", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? List {
//            destination.title =
//
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trending"
        TableViewMain.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        TableViewMain.estimatedRowHeight = 140
        TableViewMain.rowHeight = UITableView.automaticDimension
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData(){
        url = URL(string: "https://trends.google.com/trends/trendingsearches/daily/rss?geo=VN")!
        let myParser : XmlParserManager = XmlParserManager().initWithURL(url) as! XmlParserManager
        //trend = myParser.image
        trend = myParser.trend 
        TableViewMain.reloadData()
        //print(trend)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
