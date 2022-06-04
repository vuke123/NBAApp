//
//  AboutLabel.swift
//  NBA App
//
//  Created by Luka Vukelić on 03.06.2022..
//

import Foundation
import UIKit

class AboutView : UIView {
    
    let title = UILabel()
    let paragraph = UILabel()
    let moreInfo = UILabel()
    
    private var titleText: String?
    
    init(titleText: String){
        super.init(frame: .zero)
        self.titleText = titleText
        style()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   func style(){
        title.text = titleText
        title.textColor = .black
        title.font = .boldSystemFont(ofSize: 20)
       paragraph.text = "Computing student developing skills in iOS. Born in Rijeka, lives in Zagreb, in free time love being in nature."
       paragraph.textColor = .black
       paragraph.font = paragraph.font.withSize(15)
       moreInfo.text = "MORE INFO"
       moreInfo.textColor = .blue
    }
   func addSubviews(){
       addSubview(title)
       addSubview(paragraph)
       addSubview(moreInfo)
    }
   func addConstraints(){
       title.snp.makeConstraints{
           $0.top.equalToSuperview().offset(10)
           $0.leading.equalToSuperview().offset(15)
           $0.width.equalTo(190)
           $0.height.equalTo(20)
       }
       paragraph.snp.makeConstraints{
           $0.top.equalTo(title.snp.bottom).offset(-5)
           $0.leading.equalToSuperview().offset(15)
           $0.height.equalTo(80)
           $0.width.equalTo(280)
       }
       moreInfo.snp.makeConstraints{
           $0.top.equalTo(paragraph.snp.bottom)
           $0.height.equalTo(30)
           $0.width.equalTo(280)
           $0.leading.equalToSuperview().offset(15)
       }
       
       
   }
    
}

