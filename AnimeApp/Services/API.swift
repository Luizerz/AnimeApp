//
//  Api.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import Foundation

class API {

    static func getAnimes(animeName: String) async -> AnimeModel? {
        let url = URL(string: "https://api.jikan.moe/v4/anime")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let animeDecoded = try JSONDecoder().decode(AnimeModel.self, from: data)
            return animeDecoded
        } catch {
            print(error)
        }
        return nil
    }

    static func getTopAnimes() async -> AnimeModel? {
        let url = URL(string: "https://api.jikan.moe/v4/top/anime?type=tv")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let animeDecoded = try JSONDecoder().decode(AnimeModel.self, from: data)
            return animeDecoded
        } catch {
            print(error)
        }
        return nil
    }
}



