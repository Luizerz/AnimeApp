//
//  ViewController.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmented: UISegmentedControl!

    var arrayAnime: AnimeModel? = nil

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


    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            let awaitAnimes = await API.getTopAnimes()
            arrayAnime = awaitAnimes
        }
    }

    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.addChild(firstTableView)
            view.addSubview(firstTableView.view)
            NSLayoutConstraint.activate([
                firstTableView.view.topAnchor.constraint(equalTo: segmented.bottomAnchor),
                firstTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                firstTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                firstTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
        else if sender.selectedSegmentIndex == 1 {
            self.addChild(secondTableView)
            view.addSubview(secondTableView.view)
            NSLayoutConstraint.activate([
                secondTableView.view.topAnchor.constraint(equalTo: segmented.bottomAnchor),
                secondTableView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                secondTableView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                secondTableView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        }
    }
}
