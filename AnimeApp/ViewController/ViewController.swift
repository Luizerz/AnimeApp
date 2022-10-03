//
//  ViewController.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API.getAnimes()
//        Task {
//            try await classeApi.getAnimes(animeName: "one/piece")
//        }

    }

}
