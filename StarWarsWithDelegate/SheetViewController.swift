//
//  SheetViewController.swift
//  StarWarsWithDelegate
//
//  Created by Anne Victoria Batista Auzier on 27/09/23.
//

import UIKit

class SheetViewController: UIViewController {

    var delegate: SideSelectionDelegate?
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Choose your side"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    lazy var rebelButton: UIButton = {
        let image = UIImage(named: "rebel")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var imperialButton: UIButton = {
        let image = UIImage(named: "imperial")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        view.addSubview(titleView)
        view.addSubview(rebelButton)
        view.addSubview(imperialButton)

        constraintSettings()
        
        rebelButton.addTarget(self, action: #selector(rebelAction), for: .touchUpInside)
        imperialButton.addTarget(self, action: #selector(imperialAction), for: .touchUpInside)
    }

    func constraintSettings() {
        titleView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        rebelButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        rebelButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        rebelButton.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 70).isActive = true
        rebelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imperialButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imperialButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imperialButton.topAnchor.constraint(equalTo: rebelButton.bottomAnchor, constant: 70).isActive = true
        imperialButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc
    private func rebelAction() {
        delegate?.didTapChoice(image: UIImage(named: "luke")!, nameCharacter: "Luke Skywalker", color: .orange)
        dismiss(animated: true)
    }
    
    @objc
    private func imperialAction() {
        delegate?.didTapChoice(image: UIImage(named: "vader")!, nameCharacter: "Darth Vader", color: .red)
        dismiss(animated: true)
    }
}
