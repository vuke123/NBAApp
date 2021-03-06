//
//  PlayerTeamButton.swift
//  NBA App
//
//  Created by Luka Vukelić on 28.05.2022..
//

import Foundation
import UIKit
import SnapKit


class PlayerTeamButton: UIButton {
    private var title: String?
    private var color: UIColor?

    init(title1: String, color: UIColor) {
        super.init(frame: .zero)
        self.title = title1
        self.color = color
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViews()  {
        styleViews()
        addActions()
        addConstraints()
    }

    private func addActions() {
        addTarget(self, action: #selector(refreshTable), for: .touchUpInside)
    }

    private func styleViews() {
        setTitle(title, for: .normal)
        backgroundColor = color
        tintColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
    }

    private func addConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(100)
        }
    }

    @objc func refreshTable() {
        let label = "Player"
        let userDefaults = UserDefaults.standard
        if  label == userDefaults.value(forKey: "ExploreFragments") as! String {
            userDefaults.set("Teams", forKey: "ExploreFragments")
            
        }
        else {
            userDefaults.set("Player", forKey: "ExploreFragments")
        }
        let exploreVC = ExploreVC()
        exploreVC.fillWholeArray()
        exploreVC.pushController()
//        why i can not approach to navController?, i did some weird stuff here..
//    how many user defaults one swift file have
    }
}

