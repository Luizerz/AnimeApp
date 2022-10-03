//
//  Api.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import Foundation

class API {

    static func getAnimes(animeName: String) async -> AnimeModel {
        let url = URL(string: "https://api.jikan.moe/v4/anime?q=\(animeName))")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let animeDecoded = try JSONDecoder().decode(AnimeModel.self, from: data)
//            print("response: ", response)
//            print("decodado: ", animeDecoded) printar o decoded
            return animeDecoded
        } catch {
            print(error)
        }

        return AnimeModel(data: [AnimeData(mal_id: 0, title: "erro", episodes: 0, score: 0.0, synopsis: "asdaasd")])
    }
}



