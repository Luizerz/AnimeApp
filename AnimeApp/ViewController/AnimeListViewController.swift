//
//  AnimeListViewController.swift
//  AnimeApp
//
//  Created by Luiz Sena on 04/10/22.
//

import UIKit

class AnimeListViewController: UIViewController {

    weak var tableBackgroundColor: UIColor?

    init(backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.tableBackgroundColor = backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = tableBackgroundColor
    }
}

