//
//  ViewController.swift
//  CompactController
//
//  Created by Admin on 14.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var presentButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        configuration.attributedTitle = AttributedString("Present", attributes: container)
        return UIButton(configuration: configuration)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(presentButton)
        setupButtonView(button: presentButton)
        
        let presentButton = presentButton
        presentButton.addAction((UIAction(handler: { [weak self] _ in
            self?.showPopoverController(presentButton)
        })), for: .touchUpInside)
    }
    
    private func setupButtonView(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        ])
    }
    
    private func showPopoverController(_ sender: UIButton){
        let popoverViewController = PopoverViewController()
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.view.backgroundColor = .systemGray6
        popoverViewController.popoverPresentationController?.delegate = self
        popoverViewController.preferredContentSize = CGSize(width: 300, height: 280)
        popoverViewController.popoverPresentationController?.sourceView = sender
        popoverViewController.popoverPresentationController?.sourceRect = sender.bounds
        popoverViewController.popoverPresentationController?.permittedArrowDirections = .up
        popoverViewController.view.superview?.layer.cornerRadius = 5.0
        present(popoverViewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.containerView?.backgroundColor = .systemGray4.withAlphaComponent(0.1)
    }
}
