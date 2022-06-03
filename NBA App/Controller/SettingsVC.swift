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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubviews()
        addConstraints()
    
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func addSubviews(){
        view.addSubview(navigationView)
    }
    
    func addConstraints(){
        navigationView.snp.makeConstraints {
            $0.height.equalTo(65)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }


}
