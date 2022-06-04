//
//  NetworkManager.swift
//  NBA App
//
//  Created by Luka Vukelić on 30.05.2022..
//

import Foundation
import UIKit

public class NetworkManager {

    static let shared = NetworkManager()

    private init () {}

    func getAllPlayers(completed: @escaping (Result<[Player], CustomError>) -> Void ) {

        let endpoint = "https://www.balldontlie.io/api/v1/players"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.error))
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completed(.failure(.error))
                return
            }

            guard let data = data else {
                completed(.failure(.error))
                return
            }

            do {
                let decoder = JSONDecoder()
                let allPlayersData = try decoder.decode(PlayerData.self, from: data)
                let allPlayers = allPlayersData.data
                completed(.success(allPlayers))
            } catch {
                completed(.failure(.error))
            }
        }
        task.resume()
    }
    func getAllTeams(completed: @escaping (Result<[Team], CustomError>) -> Void ) {
        
        let endpoint = "https://www.balldontlie.io/api/v1/teams"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.error))
                return
            }

            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completed(.failure(.error))
                return
            }

            guard let data = data else {
                completed(.failure(.error))
                return
            }

            do {
                let decoder = JSONDecoder()
                let allTeamsData = try decoder.decode(TeamData.self, from: data)
                let allTeams = allTeamsData.data
                completed(.success(allTeams))
            } catch {
                completed(.failure(.error))
            }
        }
        task.resume()
    }
}


