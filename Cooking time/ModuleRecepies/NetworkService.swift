//
//  File.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 14.12.2022.
//

import Foundation

class NetworkService {
    
    class func getRandomRecepy(completion: @escaping (Recepy) -> Void) {
        let urlString = "https://api.spoonacular.com/recipes/random?apiKey=286e94bc02d443d5a5d4a1f7bc25cf6d"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let recipy = try? JSONDecoder().decode(Recepy.self, from: data) {
                completion(recipy)
            }
        }
        task.resume()
    }
}


