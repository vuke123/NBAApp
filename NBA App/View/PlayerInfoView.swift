//
//  PlayerInfoView.swift
//  NBA App
//
//  Created by Luka Vukelić on 03.06.2022..
//

import Foundation
import UIKit

class PlayerInfoView: UIView {
    
    let heightNumber = UILabel()
    let height = UILabel()
    let weight = UILabel()
    let weightNumber = UILabel()
    
    
    init(){
        super.init(frame: .zero)
    }
    
    init(player: Player){
        super.init(frame: .zero)
        height.text = "HEIGHT"
        heightNumber.text = "visok"
//        heightNumber.text = String(player.height_feet!) + "\'"
//        + String(player.height_inches!) + "\""
//        weight.text = "WEIGHT"
//        weightNumber.text = String(player.weight_pounds!) + "lb"
//        //        need to set fonts
        weight.text = "WEIGHT"
        weightNumber.text = "debel"
        addSubviews()
        addConstraints()
    }
    init(team: Team){
        super.init(frame: .zero)
        height.text = "CONFERENCE"
        heightNumber.text = team.conference
        weight.text = "DIVISION"
        weightNumber.text = team.division
        //        need to set fonts
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews(){
        addSubview(heightNumber)
        addSubview(height)
        addSubview(weight)
        addSubview(weightNumber)
    }
    func addConstraints(){
        heightNumber.snp.makeConstraints{
            $0.width.equalTo(150)
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
        }
        height.snp.makeConstraints{
            $0.width.equalTo(150)
            $0.leading.equalToSuperview()
            $0.top.equalTo(heightNumber.snp.bottom)
        }
        weightNumber.snp.makeConstraints{
            $0.width.equalTo(150)
            $0.leading.equalTo(heightNumber)
            $0.top.equalToSuperview().offset(10)
        }
        weight.snp.makeConstraints{
            $0.width.equalTo(150)
            $0.leading.equalTo(heightNumber)
            $0.top.equalTo(weightNumber.snp.bottom)
        }
        
    }
}
