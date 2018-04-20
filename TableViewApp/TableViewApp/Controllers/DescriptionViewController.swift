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
    @IBOutlet weak var moreLessButton: UIButton!
    @IBOutlet weak var fadingView: UIView!
    @IBOutlet weak var wikiLinkButton: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionScrollView: UIScrollView!
    @IBOutlet weak var buttonHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!
    
    var cellEntity = DataStructureModel(title: "", deskr: "", link: "")
    var buttomAnhcoreOfMoreLess: NSLayoutConstraint!
    var buttomAnhcoreOfWiki: NSLayoutConstraint!
    var wikiBottomConstraint: NSLayoutConstraint!
    var copyDescriptionViewBottomConstraintConstant: CGFloat!
    var isMoreButtonPressed = false
    
    override func viewWillAppear(_ animated: Bool) {
        buttomAnhcoreOfMoreLess = moreLessButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20)
        buttomAnhcoreOfWiki = wikiLinkButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 70)
        wikiBottomConstraint = wikiLinkButton.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor, constant: -20)
        copyDescriptionViewBottomConstraintConstant = buttomConstraint.constant
        descriptionNavigationBar.title = cellEntity.getTitle()
        descriptionLabel.text = cellEntity.getDescr()
        fadingView.opacityGradient()
        fadingView.layoutIfNeeded()
        fadingView.updateConstraints()
    }
   
    @IBAction func wikiLinkButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose browser", message: "What browser will open the link?", preferredStyle: .actionSheet)
        
        let UIWebView = UIAlertAction(title: "UIWebView", style: .default, handler: {
            _ in self.presentController(identifierController: "WebViewViewController")
        })
        let WkWebKit = UIAlertAction(title: "WkWebKit", style: .default, handler: {
            _ in self.presentController(identifierController: "WKViewViewController")
        })
        let SFSafary = UIAlertAction(title: "SFSafary", style: .default, handler: {
            _ in self.presentController(identifierController: "SFSafariViewController")
        })
        let close = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(UIWebView)
        alertController.addAction(WkWebKit)
        alertController.addAction(SFSafary)
        alertController.addAction(close)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentController(identifierController: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch identifierController {
        case "WebViewViewController":
            guard let webViewController = storyboard.instantiateViewController(withIdentifier: identifierController) as? WebViewViewController else { return }
            webViewController.url = URL(string: cellEntity.link)
            webViewController.navigationTitle = cellEntity.title
            self.present(webViewController, animated: true, completion: nil)
        case "WKViewViewController":
            guard let wkViewViewController = storyboard.instantiateViewController(withIdentifier: identifierController) as? WKViewViewController else { return }
            wkViewViewController.url = URL(string: cellEntity.link)
            self.present(wkViewViewController, animated: true, completion: nil)
        case "SFSafariViewController":
            guard let sfSafariViewController = storyboard.instantiateViewController(withIdentifier: identifierController) as? SFSafariViewController else { return }
            sfSafariViewController.url = URL(string: cellEntity.link)
            self.present(sfSafariViewController, animated: true, completion: nil)
        default:
            print("fuck")
            return
        }
    }
    
    @IBAction func descriptionViewControllerMoreLessButtonTouched(_ sender: UIButton) {
        let high = UILayoutPriority(rawValue: 999)
        let small = UILayoutPriority(rawValue: 250)
        let moreTitle = "More"
        let lessTitle = "Less"
        
        if !isMoreButtonPressed {
            UIView.transition(with: descriptionScrollView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.moreLessButton.setTitle(lessTitle)
                self.heightConstraint.priority = small
                self.buttonHeightConstraint.priority = small
                self.inversion(true)
                self.buttomConstraint.constant = 10
            }, completion: nil)
        }
        else {
            UIView.transition(with: descriptionScrollView, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.moreLessButton.setTitle(moreTitle)
                self.heightConstraint.priority = high
                self.buttonHeightConstraint.priority = high
                self.buttomConstraint.constant = self.copyDescriptionViewBottomConstraintConstant
                self.inversion(false)
            }, completion: nil)
        }
    }
    
    private func inversion(_ isActive: Bool) {
        self.wikiBottomConstraint.isActive = isActive
        self.buttomAnhcoreOfMoreLess.isActive = isActive
        self.buttomAnhcoreOfWiki.isActive = isActive
        self.fadingView.isHidden = isActive
        self.wikiLinkButton.isHidden = !isActive
        self.isMoreButtonPressed = isActive
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

extension UIButton {
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .disabled)
        self.setTitle(title, for: .focused)
    }
}
