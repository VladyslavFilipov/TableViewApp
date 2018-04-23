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
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!
    
    var cellEntity = DataStructureModel(title: "", deskr: "", link: "")
    var buttomAnhcoreOfMoreLess: NSLayoutConstraint!
    var buttomAnhcoreOfWiki: NSLayoutConstraint!
    var wikiBottomConstraint: NSLayoutConstraint!
    var copyDescriptionViewBottomConstraintConstant: CGFloat!
    var isMoreButtonPressed = false
    
    override func viewDidLoad() {
        buttomAnhcoreOfMoreLess = moreLessButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20)
        buttomAnhcoreOfWiki = wikiLinkButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 70)
        wikiBottomConstraint = wikiLinkButton.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor, constant: -20)
        copyDescriptionViewBottomConstraintConstant = buttomConstraint.constant
        descriptionNavigationBar.title = cellEntity.getTitle()
        descriptionLabel.text = cellEntity.getDescr()
        fadingView.opacityGradient()
    }
   
    @IBAction func wikiLinkButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose browser", message: "What browser will open the link?", preferredStyle: .actionSheet)
        
        let UIWebView = presentController(named: "UIWebView", withId: "WebViewViewController")
        let WkWebKit = presentController(named: "WkWebKit", withId: "WKViewViewController")
        let SFSafary = presentController(named: "SFSafary", withId: "SFSafariViewController")
        let close = presentController(named: "Cancel")
        
        alertController.addAction(UIWebView)
        alertController.addAction(WkWebKit)
        alertController.addAction(SFSafary)
        alertController.addAction(close)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func presentController(named title: String, withId idController: String? = nil) -> UIAlertAction {
        guard let idController = idController else {
            return UIAlertAction(title: title, style: .cancel)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let alertAction = UIAlertAction(title: title, style: .default, handler: {
            _ in
            guard var controller = storyboard.instantiateViewController(withIdentifier: idController) as? BrowserProtocol else { return }
            controller.linkOnWiki = self.cellEntity.getLink()
            
            guard let viewController = controller as? UIViewController else {
                return
            }
            self.present(viewController, animated: true, completion: nil)
        })
        return alertAction
    }
    
    @IBAction func descriptionViewControllerMoreLessButtonTouched(_ sender: UIButton) {
        let high = UILayoutPriority(rawValue: 999)
        let small = UILayoutPriority(rawValue: 250)
        let moreTitle = "More"
        let lessTitle = "Less"
        
        if !isMoreButtonPressed {
            UIView.transition(with: descriptionScrollView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
                self.changeScrollViewState(lessTitle, small, 10, true)
            }, completion: nil)
        }
        else {
            UIView.transition(with: descriptionScrollView, duration: 0.5, options: .transitionFlipFromTop, animations: {
                self.changeScrollViewState(moreTitle, high, self.copyDescriptionViewBottomConstraintConstant, false)
            }, completion: nil)
        }
    }
    
    private func changeScrollViewState(_ title: String, _ priority: UILayoutPriority, _ constraintConstant: CGFloat, _ isTaped: Bool) {
        self.moreLessButton.setTitle(title)
        self.heightConstraint.priority = priority
        self.buttomConstraint.constant = constraintConstant
        self.inversion(isTaped)
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
