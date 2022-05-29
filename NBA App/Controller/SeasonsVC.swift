//
//  SeasonsVC.swift
//  NBA App
//
//  Created by Luka Vukelić on 24.05.2022..
//

import Foundation
import UIKit

class SeasonsVC: UIViewController {

    private let navigationView = NavigationTop(title1:"Seasons")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(navigationView)
        addConstraints()
        self.navigationController?.isNavigationBarHidden = true

        
    }
    func addConstraints(){
        navigationView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalToSuperview()
            $0.top.equalToSuperview()
        }
    }


}
