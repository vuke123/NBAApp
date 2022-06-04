//
//  File.swift
//  NBA App
//
//  Created by Luka Vukelić on 04.06.2022..
//
import Foundation
import UIKit
class TeamActivity: UIViewController {
    
    var teamInfoView = TeamInfoView()
    var playerInfoView = PlayerInfoView()
    var team: Team?
    
    init(team: Team) {
        super.init(nibName: nil, bundle: nil)
        self.team = team
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        guard let teamUnwrapped = self.team else {
            return
        }
        self.teamInfoView = TeamInfoView(team: teamUnwrapped)
    }
    
    func addSubviews(){
        view.addSubview(teamInfoView)
        view.addSubview(playerInfoView)
    }
    
    func addConstraints(){
        teamInfoView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
        }
        playerInfoView.snp.makeConstraints{
            $0.top.equalTo(teamInfoView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
        }
    }
    
}

