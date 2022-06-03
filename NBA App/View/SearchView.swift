//
//  SearchView.swift
//  NBA App
//
//  Created by Luka Vukelić on 28.05.2022..
//
import Foundation
import UIKit

class SearchView: UIView{
    
    let symbol = UIImageView()
    var searchBar = SearchField(color: .white)
    init() {
        super.init(frame: .zero)
        backgroundColor = .blue
        createViews()
        addSubviews()
        styleViews()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createViews()  {
        symbol.image = UIImage(systemName: "line.3.horizontal.decrease.circle.fill")
        symbol.tintColor = .white
    }

    private func addSubviews()  {
        addSubview(searchBar)
        addSubview(symbol)
    }

    private func styleViews()  {
        symbol.contentMode = .scaleAspectFill
        clipsToBounds = true
    }

    private func addConstraints()  {
        searchBar.snp.makeConstraints{
            $0.width.equalTo(240)
            $0.leading.equalToSuperview().offset(15)
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().inset(5)
        }
        symbol.snp.makeConstraints{
            $0.width.equalTo(10)
            $0.leading.equalTo(searchBar.snp.trailing).offset(10)
            $0.bottom.equalToSuperview().inset(5)
            $0.top.equalToSuperview()
            
        }
    }
    
    
    
    
}

