//
//  File.swift
//  NBA App
//
//  Created by Luka Vukelić on 04.06.2022..
//

import Foundation
import UIKit
class TeamActivity: UIViewController {
    
    let playerImg = UIImageView()
    let teamInfoView = TeamInfoView()
    let playerInfoView = PlayerInfoView()
    var team: Team?
    
    init(team: Team) {
        super.init(nibName: nil, bundle: nil)
        self.team = team
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        view.backgroundColor = .white

        
    }

    
}
