//
//  ExploreVC.swift
//  NBA App
//
//  Created by Luka Vukelić on 24.05.2022..
//

import Foundation
import UIKit
import SnapKit

class ExploreVC: UIViewController, UITableViewDelegate {
 
    var titleSection = "All players"
    private let tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let navigationView = NavigationTop(title1: "Players  ▼")
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(navigationView)
        addConstraints()
        self.navigationController?.isNavigationBarHidden = true

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func addConstraints(){
        navigationView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(50)
            $0.width.equalToSuperview()
        }
    }
 
}

extension ExploreVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}




