//
//  CustomDashboardItem.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 03.02.24.
//

import UIKit

func customResultStackView(score: String, label: String) -> UIStackView {
    let stackview = UIStackView()
    stackview.axis = .vertical
    stackview.spacing = 4
    
    let scoreLabel = UILabel()
    scoreLabel.text = score
    scoreLabel.font = .ninoMkhedruliBold?.withSize(30)
    scoreLabel.textColor = .backgroundGray
    scoreLabel.textAlignment = .center
    
    let titleLabel = UILabel()
    titleLabel.text = label
    titleLabel.font = .ninoMtavruli?.withSize(12)
    titleLabel.textColor = .backgroundGray
    titleLabel.textAlignment = .center
    
    stackview.addArrangedSubview(scoreLabel)
    stackview.addArrangedSubview(titleLabel)
    return stackview
}
