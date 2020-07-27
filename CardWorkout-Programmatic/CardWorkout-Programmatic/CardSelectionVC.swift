//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Montana  on 7/9/20.
//  Copyright © 2020 Montana Braswell. All rights reserved.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop!")
    let resetButton     = CWButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards           = CardDeck.allValues
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setting background color
         view.backgroundColor = .systemBackground
         configureUI()
         startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
       
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func resetTimer() {
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard() {
        cardImageView.image = cards.randomElement()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    }

    // adding subview to the view
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
    //programmatic constraints
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
    }
    // configuring stop button and add action for button press
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
            NSLayoutConstraint.activate([
                stopButton.widthAnchor.constraint(equalToConstant: 260),
                stopButton.heightAnchor.constraint(equalToConstant: 50),
                stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stopButton.centerYAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 50)
            ])
    }
     // configuring reset button and add action for button press
    func configureResetButton() {
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.topAnchor, constant: 70)
        ])
    }
     // configuring rules button and add action for button press
    func configureRulesButton() {
    view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
        rulesButton.widthAnchor.constraint(equalToConstant: 115),
        rulesButton.heightAnchor.constraint(equalToConstant: 50),
        rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
        rulesButton.topAnchor.constraint(equalTo: stopButton.topAnchor, constant: 70)
    ])
    
    }
    // using objc function to show presentRulesVC
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
}
