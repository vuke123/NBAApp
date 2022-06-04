//
//  ExploreVC.swift
//  NBA App
//
//  Created by Luka Vukelić on 24.05.2022..
//

import Foundation
import UIKit
import SnapKit

class ExploreVC: UIViewController, UITableViewDelegate, UITextFieldDelegate {
 
    
   static private let userDefaults = UserDefaults.standard
   private var titleSection : String = ""
   private var allPlayers: [Player] = []
   private var allTeams: [Team] = []
   private var sortedArray: [String] = []
    private var sortedPlayers:[Player] = []
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var tableView: UITableView!
    
    private let navigationView = NavigationView(title1: "Players  ▼")
    private let navigationView2 = NavigationView(title1: "Teams  ▼")

    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        exploreFragment()
        configureTableView()
//      combination with UserDefaults to changing titleSection
        tableView.backgroundColor = .white
        searchView.searchBar.delegate = self
        addSubviews()
        addConstraints()
        self.navigationController?.isNavigationBarHidden = true
    }
    func fillWholeArray() {
        activityIndicator.startAnimating()
        if(titleSection == "All teams"){
            
            NetworkManager.shared.getAllTeams() { [weak self] result in
                guard let self = self else { return }

                switch result {
                case .success(let allTeams):
                    self.allTeams  = allTeams
                    print(allTeams)
                    print("allTeams")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.activityIndicator.stopAnimating()
                    }
                case .failure(let error):
                    print(error)
                    print("dsaiua22d")

                }
            }
            var count = 0
            for team in allTeams {
                   sortedArray[count] = team.full_name
                   count+=1
                }
            
        } else {

            titleSection = "All players"
            NetworkManager.shared.getAllPlayers() {
                [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let allPlayers):
                    self.allPlayers  = allPlayers
                  
                    DispatchQueue.main.async {
                        self.funkcija(allPlayers: allPlayers)
                        self.tableView.reloadData()
                        self.activityIndicator.stopAnimating()
                    }
                case .failure(let error):
                    print(error)
                    print("dsaiuad")
                }
            }
    }
  }
    func funkcija(allPlayers: [Player]) {
      
           for player in allPlayers {
               let playerx = player.first_name + " " + player.last_name
               sortedArray.append(playerx)
               print(playerx)
               sortedPlayers.append(player)
            }
    }
    func exploreFragment(){
        
        guard  let explore = ExploreVC.userDefaults.value(forKey: "ExploreFragment") else {
            ExploreVC.userDefaults.set("Player", forKey: "ExploreFragment")
            titleSection = "All players"
            print("ihsaiodsaon")
            return
        }
        print("iodsnaoias")
        if explore as! String == "Player" {
            titleSection = "All players"
        }
        else {
            titleSection = "All teams"
        }
        fillWholeArray()
        return
    }
    func configureTableView(){
            tableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
            tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.identifier)
//        playerTableViewCell is table view cell that can be also and teamTableViewCell, depending on parameters
            tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        print("konfiguriro table view")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func addSubviews(){
        if ( titleSection == "All players") {

            view.addSubview(navigationView)

        } else {
            view.addSubview(navigationView2)

        }
        view.addSubview(tableView)
        view.addSubview(searchView)
    }
    func addConstraints(){
    
        if ( titleSection == "All players") {
            navigationView.snp.makeConstraints {
                $0.height.equalTo(65)
                $0.width.equalToSuperview()
                $0.top.equalToSuperview()
            }
        } else {
            navigationView2.snp.makeConstraints {
                
                $0.height.equalTo(65)
                $0.width.equalToSuperview()
                $0.top.equalToSuperview()
            }

        }
        if(titleSection == "All players") {
        searchView.snp.makeConstraints{
            $0.height.equalTo(30)
            $0.width.equalToSuperview()
            $0.top.equalTo(navigationView.snp.bottom)
        }
        } else {
            searchView.snp.makeConstraints{
                $0.height.equalTo(30)
                $0.width.equalToSuperview()
                $0.top.equalTo(navigationView2.snp.bottom)
            }
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchView.snp.bottom).offset(100)
            $0.width.equalToSuperview()
        }
    }
    
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(searchView.searchBar.text?.count)! != 0 {
            sortedArray.removeAll()
            sortedPlayers.removeAll()
            if (titleSection == "All players") {
                for player in allPlayers{
                    let range = (player.first_name + " " + player.last_name).lowercased().range(of: searchView.searchBar.text!, options :
                                                            .caseInsensitive, range:nil, locale:nil)
                    if range != nil {
                        self.sortedArray.append(player.first_name + player.last_name)
                        self.sortedPlayers.append(player)
            }
           }
        }
        else {
         for team in allTeams{
         let range = (team.full_name).lowercased().range(of: searchView.searchBar.text!, options :
                                                            .caseInsensitive, range:nil, locale:nil)
                    if range != nil {
                        self.sortedArray.append(team.full_name)
                     }
         }
        }
       }
        return true;
    }
  
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchView.searchBar.resignFirstResponder()
        searchView.searchBar.text = ""
        self.sortedArray.removeAll()
        fillWholeArray()
        tableView.reloadData()
        return true;
    }
    
    func pushController(){
        let exploreVC = ExploreVC()
        navigationController?.pushViewController(exploreVC, animated: true)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(titleSection=="All players"){
        let player = sortedPlayers[indexPath.row]
        navigationController?.present(
            UINavigationController(rootViewController: PlayerActivity(player: player)),
            animated: true)
        }
        else {
            let teamString = sortedArray[indexPath.row]
            if let team = allTeams.first(where: {$0.full_name == teamString}) {
                    navigationController?.present(
                        UINavigationController(rootViewController: TeamActivity(team: team)),
                        animated: true)
                } else {
                   print("No team in list")
                }
            }
    }
}


extension ExploreVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sortedArray = self.sortedArray
        return sortedArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier, for: indexPath) as! PlayerTableViewCell

        let sortedArray = self.sortedArray
        
        if(titleSection == "All players") {
        if let data = ExploreVC.userDefaults.value(forKey: sortedArray[indexPath.row]){
            cell.setRealImage(name: sortedArray[indexPath.row], data: data as! Data)
        }
        else
        {
            let urlString = "http://academy-2022.dev.sofascore.com/api/v1/academy/player-image/player/" + String(sortedPlayers[indexPath.row].id)
//        name of wholeArray(index) = name of allPlayers(index)
//
            guard let url = URL(string: urlString) else {
                let placeholderIndex = String(sortedPlayers[indexPath.row].id % 3)
                let placeholderName = "placeholder" + placeholderIndex
                cell.setZeplinImage(name: sortedArray[indexPath.row], imageName: placeholderName)
                return cell
            }
            if let data2 = try? Data(contentsOf: url) {
                cell.setRealImage(name: sortedArray[indexPath.row], data: data2)
                ExploreVC.userDefaults.set(data2, forKey: sortedArray[indexPath.row])
            }
        }
        }
        else {
            cell.setZeplinImage(name: sortedArray[indexPath.row], imageName: sortedArray[indexPath.row])
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleSection
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
        
}




