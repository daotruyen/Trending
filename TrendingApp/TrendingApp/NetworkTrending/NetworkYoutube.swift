//
//  NetworkYoutube.swift
//  TrendingApp
//
//  Created by Tuyen on 29/06/2021.
//

//import Foundation
//
//let keyApi = "AIzaSyDH6rqjdCddM-wuRZpEU2d1hpHvrDNeSk"
//private var dataTask: URLSessionDataTask?
//
//class NetWorkk(completion: @escaping(Youtube)-> ()) {
//    let URL_API = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&key=\(keyApi)"
//    //https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&key=[your_key]&q=iosappswift
//    guard let url = URL(string: URL_API) else {return}
//    dataTask = URLSession.shared.dataTask(with: url){
//        (data, response, error) in
//
//        guard let safeData = data, error == nil else {
//            print(error)
//            return
//        }
//
//        do {
//            let jsonData = try JSONDecoder().decode(Youtube.self, from: safeData)
//
//            DispatchQueue.main.async {
//                completion(.success(jsonData))
//            }
//        } catch let error {
//            completion(.failure(error))
//        }
//        dataTask?.resume()
//
//    }
//
//
//}
import Foundation

import Foundation

class NetworkYoutube {
    let keyApi = "AIzaSyDH6rqjdCddM-wuRZpEU2d1hpHvrDN-eSk"
    //private var dataTask: URLSessionDataTask?
    var value: String = ""
    func getPopularMoviesData(value: String,completion: @escaping (Youtube) -> ()) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host   = "www.googleapis.com"
        urlComponent.path   = "/youtube/v3/search"
        urlComponent.queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "key", value: keyApi),
            URLQueryItem(name: "q", value: value),
            URLQueryItem(name:"maxResults", value: "25")
        ]
        print(urlComponent)
        guard let url = urlComponent.url else {fatalError()}
        
        // Create URL Session - work on the background
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            guard let response = response as? HTTPURLResponse else {
                // Handle Empty Response
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            //print(data)
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Youtube.self, from: data)
                    completion(jsonData)
                    //print(jsonData)
            } catch {
                print(error)
            }
        }.resume()
    }
}
