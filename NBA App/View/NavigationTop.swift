//
//  NavigationTop.swift
//  NBA App
//
//  Created by Luka Vukelić on 28.05.2022..
//

import Foundation
import UIKit

//▼
class NavigationTop: UIView {
    
    private var title1: String?
    let nbaImg = UIImageView()
    let searchView = SearchView()
    init(title1: String) {
        super.init(frame: .zero)
        self.title1 = title1
        backgroundColor = .blue
        createViews()
        addSubviews()
        styleViews()
        addConstraints()
        let switchButton = PlayerTeamButton(title1: title1, color: .blue)
        addSubview(switchButton)
        switchButton.snp.makeConstraints{
            $0.height.equalTo(nbaImg)
            $0.leading.equalTo(nbaImg.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(24)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createViews()  {
        nbaImg.image = UIImage(named:"nba")

    }

    private func addSubviews()  {
        addSubview(nbaImg)
        addSubview(searchView)
    }

    private func styleViews()  {
        layer.cornerRadius = 0
        nbaImg.contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    private func addConstraints()  {
        
        nbaImg.snp.makeConstraints {
            $0.width.equalTo(10)
            $0.leading.equalToSuperview().offset(17)
            $0.top.equalToSuperview().offset(24)
        }
        searchView.snp.makeConstraints{
            $0.top.equalTo(nbaImg.snp.bottom).offset(5)
            $0.width.equalToSuperview()
        }
        
    }
}


