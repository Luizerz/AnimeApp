//
//  ViewController.swift
//  AnimeApp
//
//  Created by Luiz Sena on 03/10/22.
//

import UIKit

class ViewController: UIViewController {

    var arrayAnime: AnimeModel = AnimeModel(data: [AnimeData(mal_id: 0, title: "", episodes: 0, score: 120, synopsis: "")])

    private let firstTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    private let secondTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .systemOrange
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            arrayAnime = await API.getAnimes(animeName: "one/piece")
        }
    }

    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            firstTableView.backgroundColor = .systemPink
            setTableView(tableview: firstTableView)
        }
        else if sender.selectedSegmentIndex == 1 {
            secondTableView.backgroundColor = .systemOrange
            setTableView(tableview: secondTableView)
        }
    }

    func setTableView(tableview: UITableView){
        view.addSubview(tableview)
        NSLayoutConstraint.activate([
            tableview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableview.heightAnchor.constraint(equalToConstant: 150),
            tableview.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
}
