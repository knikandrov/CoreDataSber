//
//  API.swift
//  CoreDataSber
//
//  Created by Konstantin Nikandrov on 29.11.2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//

import Foundation

class API: NSObject {
    
    
    lazy var endPoint: String = {
        return "https://dog.ceo/api/breed/hound/images/random/100"
    }()
    
    func getDataWith(completion: @escaping (Result<[String]>) -> Void) {
        guard let url = URL(string: endPoint) else { return completion(.Error("Invalid URL")) }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            return completion(.Error(error!.localizedDescription)) }
        guard let data = data else {
            return completion(.Error(error?.localizedDescription ?? "No items to show"))}
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                guard let message = json["message"] else {
                    return completion(.Error(error?.localizedDescription ?? "No new Items to show"))
                }
                DispatchQueue.main.async {
                    completion(.Success(message as! [String]))
                }
            }
        } catch let error {
            return completion(.Error(error.localizedDescription))
        }
        }.resume()
    }
}

enum Result <T> {
    case Success(T)
    case Error(String)
}

