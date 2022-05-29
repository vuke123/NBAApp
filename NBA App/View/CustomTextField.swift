//
//  CustomTextField.swift
//  NBA App
//
//  Created by Luka Vukelić on 27.05.2022..
//

import Foundation
import UIKit
import SnapKit

class CustomTextField: UITextField {
    private var color: UIColor?

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
        textColor = color
        layer.cornerRadius = 0
        clipsToBounds = true
        textAlignment = .center
        
    }
}
