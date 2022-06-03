//
//  SettingsVC.swift
//  NBA App
//
//  Created by Luka Vukelić on 24.05.2022..
//

import SnapKit
import Foundation
import UIKit

class SettingsVC: UIViewController {

    
    private let navigationView = NavigationView(title1:"Settings")

    private var deleteFavs = UILabel(frame: CGRect(x: 11, y: 455, width: 300, height: 30))
    private var aboutView = AboutView(titleText: "About Luka Vukelić") //constraints in function bellow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        addSubviews()
        addConstraints()
        self.setupDeleteTap()
        self.navigationController?.isNavigationBarHidden = true
        self.aboutView.paragraph.numberOfLines = 0
    }
    
    @objc func deleteFavorites(_ sender:
            UITapGestureRecognizer) {
        print("delete Favorites")
//        delete favorites from user defaults
    }
    
    func setupDeleteTap(){
        let deleteTap = UITapGestureRecognizer(target: self, action: #selector(self.deleteFavorites(_:)))
        self.deleteFavs.isUserInteractionEnabled = true
        self.deleteFavs.addGestureRecognizer(deleteTap)
    }
    
    
    func style(){
        deleteFavs.layer.borderColor = UIColor.red.cgColor
        deleteFavs.layer.borderWidth = 3.0
        deleteFavs.text = "CLEAR MY FAVORITES LIST"
        deleteFavs.textAlignment = .center
        deleteFavs.textColor = .red
        deleteFavs.layer.cornerRadius = 10
        aboutView.layer.borderColor = UIColor.gray.cgColor
        aboutView.backgroundColor = .systemGray4
        aboutView.layer.borderWidth = 0.0
        aboutView.layer.masksToBounds = true
        aboutView.layer.cornerRadius = 10

    }
    func addSubviews(){
        view.addSubview(navigationView)
        view.addSubview(deleteFavs)
        view.addSubview(aboutView)
    }
    
    func addConstraints(){
        navigationView.snp.makeConstraints {
            $0.height.equalTo(65)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
        aboutView.snp.makeConstraints{
            $0.height.equalTo(140)
            $0.width.equalTo(300)
            $0.bottom.equalTo(deleteFavs.snp.top).offset(-10)
            $0.centerX.equalToSuperview()
        }
        
//        deleteFavs.snp.makeConstraints{
//            $0.height.equalTo(20)
//            $0.width.equalTo(100)
//            $0.bottom.equalToSuperview().offset(15)
//            $0.centerX.equalToSuperview()
//        }  CGRect(x:11, y:345, width:300, height: 100))
    }


}
