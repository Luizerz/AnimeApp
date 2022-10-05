//
//  ViewController.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import UIKit

class ViewController: UIViewController {

    var arrayAnime: AnimeModel? = nil
    let image = UIImageView()

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barStyle = .default
        return searchBar
    }()

    private let firstTableView: AnimeListViewController = {
        let tableview = AnimeListViewController(backgroundColor: .systemOrange)
        tableview.view.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    private let secondTableView: AnimeListViewController = {
        let tableview = AnimeListViewController(backgroundColor: .systemCyan)
        tableview.view.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.addChild(firstTableView)
            view.addSubview(firstTableView.view)
            NSLayoutConstraint.activate([
                firstTableView.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
                firstTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                firstTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                firstTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
        else if sender.selectedSegmentIndex == 1 {
            self.addChild(secondTableView)
            view.addSubview(secondTableView.view)
            NSLayoutConstraint.activate([
                secondTableView.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
                secondTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                secondTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                secondTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let awaitAnimes = await API.getTopAnimes()
            arrayAnime = awaitAnimes
            for i in 0...10 {
                print(arrayAnime?.data[i].images?.jpg?.image_url ?? "error")
            }
        }
        configurateSearchBar()
    }

    func configurateSearchBar() {
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: segmented.bottomAnchor, constant: 15),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
}
