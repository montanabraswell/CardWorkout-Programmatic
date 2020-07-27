//
//  CWButton.swift
//  CardWorkout-Programmatic
//
//  Created by Montana  on 7/9/20.
//  Copyright © 2020 Montana Braswell. All rights reserved.
//

import UIKit

class CWButton: UIButton {
     
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // choice to initialize an empty one or with background color and title 
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        //use auto layout
        translatesAutoresizingMaskIntoConstraints = false
    }

}
