//
//  PopoverViewController.swift
//  CompactController
//
//  Created by Admin on 14.07.2023.
//

import UIKit

class PopoverViewController: UIViewController {
    
    lazy var segmentedControl: UISegmentedControl = {
        let items = ["280pt", "150pt"]
        let sc = UISegmentedControl(items: items)
        sc.layer.cornerRadius = 5.0
        sc.backgroundColor = .systemGray6
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    lazy var closeButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .medium
        configuration.baseBackgroundColor = .systemGray4
        configuration.image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = .systemGray
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
        let button = UIButton(configuration: configuration)
        button.addAction((UIAction(handler: { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        })), for: .touchDown)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(segmentedControl)
        setupSegmentedControlView(segmentedControl: segmentedControl)
        let segmentedControl = self.segmentedControl
        segmentedControl.addAction((UIAction(handler: { [weak self] _ in
            self?.segmentControlHandler(segmentedControl)
        })), for: .valueChanged)
        
        view.addSubview(closeButton)
        setupCloseButtonView(button: closeButton)
    }
    
    func setupCloseButtonView(button: UIButton){
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 29),
        ])
    }
    
    private func segmentControlHandler(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.preferredContentSize = CGSize(width: 300, height: 280)
        default:
            self.preferredContentSize = CGSize(width: 300, height: 150)
        }
    }
    
    private func setupSegmentedControlView(segmentedControl: UISegmentedControl){
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
        ])
    }
}

