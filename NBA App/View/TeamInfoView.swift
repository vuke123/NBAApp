//
//  TeamInfoView.swift
//  NBA App
//
//  Created by Luka Vukelić on 03.06.2022..
//

import Foundation
import UIKit

class TeamInfoView: UIView {
    
    let teamLogo = UIImageView()
    let teamLabel = UILabel()
    let teamLabel2 = UILabel()
    let positionImg = UIImageView()
    let position = UILabel()
    
    
    init(){
        super.init(frame: .zero)
    }
    
    init(player: Player){
        super.init(frame: .zero)
        teamLogo.image = UIImage(named: player.team.full_name)
        teamLogo.contentMode = .scaleAspectFit
        teamLogo.clipsToBounds = true
        teamLabel.text = "TEAM"
        teamLabel2.text = player.team.full_name
        position.text = player.position.uppercased()
//        need to set fonts
        positionImg.image = UIImage(systemName:"figure.walk")
        teamLogo.contentMode = .scaleAspectFit
        teamLogo.clipsToBounds = true
        positionImg.contentMode = .scaleAspectFit
        positionImg.clipsToBounds = true
        addSubviews()
        addConstraints()
    }
    init(team: Team){
        super.init(frame: .zero)
        teamLogo.image = UIImage(named: team.full_name)
        teamLogo.contentMode = .scaleAspectFit
        teamLogo.clipsToBounds = true
        teamLabel.text = team.abbreviation
        teamLabel2.text = team.full_name
        position.text = team.city.uppercased()
//        need to set fonts
        positionImg.image = UIImage(systemName:"location")
        teamLogo.contentMode = .scaleAspectFit
        teamLogo.clipsToBounds = true
        positionImg.contentMode = .scaleAspectFit
        positionImg.clipsToBounds = true
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews(){
        addSubview(teamLogo)
        addSubview(teamLabel)
        addSubview(teamLabel2)
        addSubview(positionImg)
        addSubview(position)
    }
    func addConstraints(){
        teamLogo.snp.makeConstraints{
            $0.width.equalTo(70)
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalToSuperview()
        }
        teamLabel.snp.makeConstraints{
            $0.width.equalTo(50)
            $0.leading.equalTo(teamLogo.snp.trailing).offset(10)
            $0.top.equalToSuperview()
        }
        teamLabel2.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.leading.equalTo(teamLogo.snp.trailing).offset(10)
            $0.top.equalTo(teamLabel.snp.bottom).offset(5)
        }
        positionImg.snp.makeConstraints{
        $0.width.equalTo(10)
        $0.leading.equalTo(teamLogo.snp.trailing).offset(10)
        $0.top.equalTo(teamLabel2.snp.trailing).offset(20)
        }
        position.snp.makeConstraints{
        $0.width.equalTo(40)
        $0.leading.equalTo(positionImg.snp.trailing).offset(5)
        $0.top.equalTo(teamLabel2.snp.trailing).offset(20)
        }
        
    }
}
