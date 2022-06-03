//
//  CustomTextField.swift
//  NBA App
//
//  Created by Luka Vukelić on 27.05.2022..
//

import Foundation
import UIKit
import SnapKit

class SearchField: UITextField {
    private var color: UIColor?
    let iconView = UIImageView()
    let contentView = UIView()
    init(color: UIColor) {
        super.init(frame: .zero)
        self.color = color
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViews()  {
        guard let color = color else { return }
        backgroundColor = color
        self.placeholder = "Add a new item..."
        textColor = .black
        layer.cornerRadius = 7
        clipsToBounds = true
        iconView.image = UIImage(systemName: "magnifyingglass")
        contentView.addSubview(iconView)
        textAlignment = .center
        contentView.frame = CGRect(x: 0, y: 0, width: 10, height:  10)
        iconView.frame =  CGRect(x: 5, y: 0, width:10, height:  10)
        self.leftView = contentView
        self.leftViewMode = .always
        self.clearButtonMode = .whileEditing
    }
}
