//
//  AnimeModel.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import Foundation

struct AnimeModel: Codable {
    let data: [AnimeData]
}

struct AnimeData: Codable {
    let mal_id: Int?
    let title: String?
    let episodes: Int?
    let score: Float?
    let synopsis: String?
    let images: ImageFormat?
}

struct ImageFormat: Codable {
    let jpg: ImageURL?
}

struct ImageURL: Codable {
    let large_image_url: String?
    let small_image_url: String?
    let image_url: String?
}
