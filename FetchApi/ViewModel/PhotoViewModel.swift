//
//  PhotoViewModel.swift
//  FetchApi
//
//  Created by Pierric Marye on 03/01/2023.
//

import Foundation
import SwiftUI

class PhotoViewModel: ObservableObject {
    @Published var photos: [PhotoModel] = []
    
    func getPhotos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { fatalError("URL manquant") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedPhotos = try JSONDecoder().decode([PhotoModel].self, from: data)
                        self.photos = decodedPhotos
                    } catch let error {
                        print("Erreur de décodage: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
