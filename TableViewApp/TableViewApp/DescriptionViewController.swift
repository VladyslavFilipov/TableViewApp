//
//  ViewController.swift
//  TableViewApp
//
//  Created by Vladislav Filipov on 12.04.18.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionNavigationBar: UINavigationItem!
    @IBOutlet weak var descriptionMoreLessButton: UIButton!
    @IBOutlet weak var descriptionFadingView: UIView!
    @IBOutlet weak var descriptionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionView: UIView!
    
    var buttonTopAnchore: NSLayoutConstraint!
    var copyDescriptionViewBottomConstraintConstant: CGFloat!
    
    @IBOutlet weak var descriptionScrollView: UIScrollView!
    
    var cellEntity = DataStructureModel(title: "")
    
    override func viewWillAppear(_ animated: Bool) {
        descriptionNavigationBar.title = cellEntity.getTitle()
        descriptionLabel.text = cellEntity.getDescr()
        descriptionFadingView.opacityGradient()
        buttonTopAnchore = descriptionMoreLessButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor)
        descriptionFadingView.layoutIfNeeded()
        descriptionFadingView.updateConstraints()
        copyDescriptionViewBottomConstraintConstant = descriptionViewBottomConstraint.constant
    }
    
    @IBAction func descriptionViewControllerMoreLessButtonTouched(_ sender: UIButton) {
        let high = UILayoutPriority(rawValue: 999)
        let small = UILayoutPriority(rawValue: 250)
        
        if descriptionMoreLessButton.currentTitle! == "More" {
            descriptionMoreLessButton.setTitle("Less", for: .normal)
            descriptionViewHeightConstraint.priority = small
            descriptionLabelHeightConstraint.priority = small
            descriptionViewBottomConstraint.constant = 0
            buttonTopAnchore.isActive = true
            descriptionFadingView.isHidden = true
            descriptionFadingView.layoutIfNeeded()
        }
        else {
            descriptionMoreLessButton.setTitle("More", for: .normal)
            descriptionViewHeightConstraint.priority = high
            descriptionLabelHeightConstraint.priority = high
            descriptionViewBottomConstraint.constant = copyDescriptionViewBottomConstraintConstant
            buttonTopAnchore.isActive = false
            descriptionFadingView.isHidden = false
            descriptionFadingView.layoutIfNeeded()
        }
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewLayoutMarginsDidChange() {
        descriptionFadingView.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor)
        descriptionFadingView.updateConstraints()
    }
    
}

extension UIView {
    func opacityGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        self.layer.mask = gradient
    }
}
