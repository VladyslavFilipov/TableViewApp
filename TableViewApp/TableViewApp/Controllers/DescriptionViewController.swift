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
    @IBOutlet weak var hiddenButtonsStackView: UIStackView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionScrollView: UIScrollView!
    @IBOutlet weak var buttomConstraint: NSLayoutConstraint!
    @IBOutlet weak var allButtonsStackView: UIStackView!
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    var cellEntity = DataStructureModel(title: "", deskr: "", link: "", type: .stack)
    var buttomAnhcoreOfStackView: NSLayoutConstraint!
    var copyDescriptionViewBottomConstraintConstant: CGFloat!
    var isMoreButtonPressed = false
    
    override func viewDidLoad() {
        buttomAnhcoreOfStackView = allButtonsStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20)
        copyDescriptionViewBottomConstraintConstant = buttomConstraint.constant
        hiddenButtonsStackView.isHidden = true
        descriptionNavigationBar.title = cellEntity.title
        descriptionLabel.text = cellEntity.descr
        fadingView.createOpacityGradient()
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
            controller.linkOnWiki = self.cellEntity.url
            
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
        self.viewBottomConstraint.priority = priority
        self.inversion(isTaped)
    }
    
    @IBAction func vizualizationButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vizualizationController = storyboard.instantiateViewController(withIdentifier: "VizualizationViewController") as? VisualizationViewController else { return }
        vizualizationController.controlManager = ControlManagerFactory.getControlManager(byType: cellEntity.type)
        vizualizationController.title = self.title
        self.navigationController?.pushViewController(vizualizationController, animated: true)
    }
    
    private func inversion(_ isActive: Bool) {
        self.buttomAnhcoreOfStackView.isActive = isActive
        self.fadingView.isHidden = isActive
        self.hiddenButtonsStackView.isHidden = !isActive
        self.isMoreButtonPressed = isActive
    }
}
