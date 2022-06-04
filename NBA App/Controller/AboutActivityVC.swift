//
//  AboutActivityVC.swift
//  NBA App
//
//  Created by Luka Vukelić on 03.06.2022..
//

import Foundation
import UIKit
class AboutActivityVC: UIViewController {
        
    private let about = UILabel()
    private let title123 = UILabel()
    private let class20 = UILabel()
    private let sofa = SofaScoreLabel(text: "SofaScore")
    private let appName = UILabel()
    private let appName2 = UILabel()
    private let apiCredit = UILabel()
    private let apiCredit2 = UILabel()
    private let developer = UILabel()
    private let developer2 = UILabel()
    private let githubLink2 = UILabel()
    private let githubLink = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        about.text = "About"
        title123.text = "SofaScore Academy"
        class20.text = "Class 2022"
        appName.text = "APP NAME"
        appName2.text = "NBA App"
        apiCredit.text = "API CREDIT"
        apiCredit2.text = "balldontlie"
        developer.text = "DEVELOPER"
        developer2.text = "Luka Vukelić"
        githubLink2.text = "GITHUB ACC"
        githubLink.text = "https://github.com/vuke123"
        self.about.font = UIFont(name:"HelveticaNeue-Bold", size: 30.0)
        self.title123.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        self.appName.font = UIFont(name: "Arial", size: 10.0)
        self.apiCredit.font = UIFont(name: "Arial", size: 10.0)
        self.developer.font = UIFont(name: "Arial", size: 10.0)
        self.githubLink.font = UIFont(name: "Arial", size: 10.0)
        self.githubLink2.font = UIFont(name: "Arial", size: 10.0)
        self.githubLink.textColor = .blue
        self.appName.textColor = .gray
        self.apiCredit.textColor = .gray
        self.developer.textColor = .gray
        self.githubLink2.textColor = .gray


       
        goSurf()
        addSubviews()
        addConstraints()
        self.navigationController?.isNavigationBarHidden = true
    }
    @objc func goToGithub (_ sender:
            UITapGestureRecognizer) {
        print("go to Github")
        guard let profileUrl = self.githubLink.text else {return}
        print(profileUrl)
        if let url = URL(string: profileUrl) {
            UIApplication.shared.open(url)
        }
        
    }
    func goSurf  (){
        let goToGithub = UITapGestureRecognizer(target: self, action: #selector(self.goToGithub(_:)))
        self.githubLink.isUserInteractionEnabled = true
        self.githubLink.addGestureRecognizer(goToGithub)
    }
    
    func addSubviews(){
        view.addSubview(title123)
        view.addSubview(sofa)
        view.addSubview(class20)
        view.addSubview(about)
        view.addSubview(appName)
        view.addSubview(appName2)
        view.addSubview(apiCredit)
        view.addSubview(apiCredit2)
        view.addSubview(developer)
        view.addSubview(developer2)
        view.addSubview(githubLink)
        view.addSubview(githubLink2)

    }
    
    func addConstraints(){
        
        about.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalToSuperview().offset(70)
            $0.leading.equalToSuperview().offset(20)
        }
        title123.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(about.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
        }
        class20.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.top.equalTo(title123.snp.bottom).inset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        sofa.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(title123.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(20)
        }
        appName.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.top.equalTo(sofa.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
        appName2.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.top.equalTo(appName.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
        }
        apiCredit.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.top.equalTo(appName2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        apiCredit2.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.top.equalTo(apiCredit.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
        }
        developer.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.top.equalTo(apiCredit2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        developer2.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.top.equalTo(developer.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
        }
        githubLink2.snp.makeConstraints {
            $0.height.equalTo(8)
            $0.top.equalTo(developer2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        githubLink.snp.makeConstraints {
            $0.height.equalTo(15)
            $0.top.equalTo(githubLink2.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
        }
        
       
    }
    
    
}
