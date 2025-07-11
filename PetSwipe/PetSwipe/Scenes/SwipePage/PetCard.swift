//
//  PetCard.swift
//  PetSwipe
//
//  Created by Amelia Li on 5/27/25.
//

import Foundation
import UIKit

class PetCard: SwipeBaseView {
    let profileImageView = ImageViewFactory.standardImageView(
        image: UIImage(named: "placeholder_pet") ?? UIImage(),
        cornerRadius: 0,
        interactionEnabled: true,
        contentMode: .scaleAspectFill,
        sizeToFit: false
    ).new
    
    let containerView: SwipeBaseView = {
        let v = SwipeBaseView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 10.0
        v.layer.borderWidth = 0.5
        v.layer.borderColor = UIColor.gray.cgColor
        v.clipsToBounds = true
        return v
    }()
    
    let infoContainerView: SwipeBaseView = {
        let v = SwipeBaseView()
        return v
    }()
    
    let nameLabel = ElementStorage.standardLabel(text: "Loading pets ... 🐶", textColor: .gray, fontStyle: .headline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
    let workLabel = ElementStorage.standardLabel(text: "", textColor: .gray, fontStyle: .subheadline, textAlignment: .left, sizeToFit: true, adjustToFit: true).new
    
    override func setUpViews() {
        addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(infoContainerView)
        infoContainerView.addSubview(nameLabel)
        infoContainerView.addSubview(workLabel)
            
        let infoContainerViewMargins = infoContainerView.layoutMarginsGuide
            
        NSLayoutConstraint.activate([
                
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            profileImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            profileImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.85),
                
            infoContainerView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            infoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            infoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            infoContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
                
            nameLabel.leadingAnchor.constraint(equalTo: infoContainerViewMargins.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: infoContainerViewMargins.topAnchor),
            workLabel.leadingAnchor.constraint(equalTo: infoContainerViewMargins.leadingAnchor),
            workLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            workLabel.trailingAnchor.constraint(equalTo: infoContainerViewMargins.trailingAnchor)
            ])
    }
    
    func configure(with pet: matchesPet) {
        nameLabel.text = pet.name
        workLabel.text = "\(pet.breed), Age: \(pet.age)"
        profileImageView.image = pet.image
    }
    
    func configure(with pet: matchesPet, distance: String?) {
        nameLabel.text = pet.name
        if let distance = distance {
            workLabel.text = "\(pet.breed), Age: \(pet.age) • \(distance)"
        } else {
            workLabel.text = "\(pet.breed), Age: \(pet.age)"
        }
        profileImageView.image = pet.image
    }
}
