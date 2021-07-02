////
////  NetworkTrending.swift
////  TrendingApp
////
////  Created by Tuyen on 28/06/2021.
////
//
//import Foundation
//
//class NetWork {
//    private var dataTask: URLSessionTask?
//    func getApi(completion: @escaping(Trend)-> ()) {
//        let URL_API = "https://trends.google.com/trends/trendingsearches/daily/rss?geo=VN"
//        guard let url = URL(string : URL_API) else {
//            fatalError()
//        }
//
//        let request = URLRequest(url : url)
//        URLSession.shared.dataTask(with: request){
//            (data, response, error) in
//            guard let data = data else {return}
//            do {
//                let decodeJson = try JSONDecoder().decode(Trend.self, from: data)
//                completion(decodeJson)
//            }
//            catch{
//                print(error)
//            }
//        }.resume()
//
//    }
//
//}
//
