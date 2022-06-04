//
//  PlayerActivity.swift
//  NBA App
//
//  Created by Luka Vukelić on 03.06.2022..
//

import Foundation
import UIKit
class PlayerActivity: UIViewController {
    
    let playerImg = UIImageView()
    var teamInfoView = TeamInfoView()
    var playerInfoView = PlayerInfoView()
    var player: Player?
    
    init(player: Player) {
        super.init(nibName: nil, bundle: nil)
        self.player = player
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        addSubviews()
        addConstraints()
        guard let playerUnwrapped = self.player else {
            return
        }
        self.teamInfoView = TeamInfoView(player: playerUnwrapped)
    }
    func style(){
        guard let playerUnwrapped = self.player else {
            return
        }
        if let data = UserDefaults.standard.value(forKey: (playerUnwrapped.first_name + " " + playerUnwrapped.last_name)){
            playerImg.image = UIImage(data: data as! Data)
        }
        else {
            let urlString = "http://academy-2022.dev.sofascore.com/api/v1/academy/player-image/player/" + String(playerUnwrapped.id)
            guard let url = URL(string: urlString) else {
                let placeholderIndex = String((playerUnwrapped.id) % 3)
                let placeholderName = "placeholder" + placeholderIndex
                playerImg.image = UIImage(named: placeholderName)
                return
            }
            if let data2 = try? Data(contentsOf: url) {
                playerImg.image = UIImage(data: data2)
            }
        }
        playerImg.contentMode = .scaleAspectFit
        playerImg.clipsToBounds = true
    }
    
    func addSubviews(){
        view.addSubview(playerImg)
        view.addSubview(teamInfoView)
        view.addSubview(playerInfoView)
    }
    
    func addConstraints(){
        playerImg.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
        }
        teamInfoView.snp.makeConstraints{
            $0.top.equalTo(playerImg.snp.bottom)
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
