//
//  ViewController.swift
//  StarWarsWithDelegate
//
//  Created by Anne Victoria Batista Auzier on 27/09/23.
//

import UIKit

protocol SideSelectionDelegate {
    func didTapChoice(image: UIImage, nameCharacter: String, color: UIColor)
}

class ViewController: UIViewController, SideSelectionDelegate {
    
    private var titleText = String()
    private var characterImage: UIImage? = UIImage(named: "logo")

    lazy var starWarsImage: UIImageView = {
        let image = UIImageView()
        image.image = characterImage
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var nameCharacter: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 22
        button.setTitle("Choose a side", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(starWarsImage)
        view.addSubview(nameCharacter)
        view.addSubview(button)
        constraintSettings()
        
        button.addTarget(self, action: #selector(navigate), for: .touchUpInside)

    }

    func constraintSettings() {
        starWarsImage.widthAnchor.constraint(equalToConstant: 320).isActive = true
        starWarsImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        starWarsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        starWarsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        nameCharacter.topAnchor.constraint(equalTo: starWarsImage.bottomAnchor, constant: 80).isActive = true
        nameCharacter.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 195).isActive = true
        button.heightAnchor.constraint(equalToConstant: 65).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    @objc
    private func navigate(_ sender: UIButton) {
        let sheetVC = SheetViewController()
        
        sheetVC.delegate = self
        
        present(sheetVC, animated: true)
    }

    func didTapChoice(image: UIImage, nameCharacter: String, color: UIColor) {
        self.starWarsImage.image = image
        self.nameCharacter.text = nameCharacter
        view.backgroundColor = color
    }
}
