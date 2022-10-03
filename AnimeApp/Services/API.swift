//
//  Api.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import Foundation

class API {

    static func getAnimes() {
        let url = URL(string: "https://api.jikan.moe/v4/anime?q=naruto")!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in

            guard let responseData = data else { return }
            do{
                let animeModel = try JSONDecoder().decode([AnimeModel].self, from: responseData)
                print(animeModel)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}


let mockHandler = AnimeModel(data: [AnimeData(mal_id: 0, title: "deu erro camarada", episodes: 23, score: 10.0, synopsis: "ja disse que deu erro, vai olhar o codigo")])
