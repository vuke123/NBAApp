//
//  SofaLabel.swift
//  NBA App
//
//  Created by Luka Vukelić on 04.06.2022..
//

import Foundation
import UIKit
class SofaScoreLabel: UIView {
    
    private var text = UILabel()
    private var icon = UIImageView()
    
    init(text: String){
        super.init(frame: .zero)
        self.text.text = text
        self.backgroundColor = .systemGray4
        self.layer.cornerRadius = 8
        self.text.font = UIFont(name: "Arial", size: 15.0)
        icon.image = UIImage(named: "appleLogo")
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubviews(){
        addSubview(text)
        addSubview(icon)
    }
    func addConstraints(){
        text.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(30)
        }
        icon.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            $0.leading.equalTo(text.snp.trailing).offset(70)
        }
        
    }
}
