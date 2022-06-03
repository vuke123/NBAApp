//
//  PlayerTableCell.swift
//  NBA App
//
//  Created by Luka Vukelić on 25.05.2022..
//

import Foundation
import UIKit

class PlayerTableViewCell: UITableViewCell {
    static let identifier = "PlayerTableViewCell"
    
    private let myImageView = UIImageView()
    private let myLabel = UILabel()
    
    func setRealImage(name: String, data: Data) {
        myLabel.text = name
        myLabel.font = .systemFont(ofSize: 20, weight: .bold)
        myImageView.image = UIImage(data: data)
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true

    }
    func setZeplinImage(name: String, imageName: String){
        myLabel.text = name
        myLabel.font = .systemFont(ofSize: 20, weight: .bold)
        myImageView.image = UIImage(named: imageName)
        myImageView.contentMode = .scaleAspectFit
        myImageView.clipsToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.layer.cornerRadius = 10
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 5, width: 100, height: contentView.frame.size.height-10)
        myLabel.frame = CGRect(x: 150, y: 20, width: 200, height: 30)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 2, right: 10))
    }
    
}
