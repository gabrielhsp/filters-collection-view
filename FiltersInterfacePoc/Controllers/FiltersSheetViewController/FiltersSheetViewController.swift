//
//  FiltersSheetViewController.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 26/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class FiltersSheetViewController: UIViewController {
    // MARK: - Properties
    private let animationDurationTime: TimeInterval = 0.5
    private let animationDelayTime: TimeInterval = 0
    private let animationSpringDamping: CGFloat = 1.0
    private let animationSpringVelocity: CGFloat = 1.0
    
    private lazy var filtersContainerHeightConstraint: NSLayoutConstraint = {
        return filtersContainerController.view.heightAnchor.constraint(equalToConstant: 0)
    }()
    
    // MARK: - UI Components
    private lazy var filtersContainerController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: FiltersViewController())
        
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationController
    }()
    
    private lazy var viewBlurryEffect: UIVisualEffectView = {
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissFiltersSheetContainer))
        
        blurredEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurredEffectView.addGestureRecognizer(tapGesture)
        
        return blurredEffectView
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewBlurryEffect()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupFiltersContainerController()
    }
    
    // MARK: - Private Methods
    private func setupViewBlurryEffect() {
        view.addSubview(viewBlurryEffect)
        setupViewBlurryEffectConstraints()
    }
    
    private func setupFiltersContainerController() {
        view.addSubview(filtersContainerController.view)
        setupFiltersContainerViewConstraints()
        self.addChildSubview(filtersContainerController)
        animateFiltersContainerExibithion()
    }
    
    private func animateFiltersContainerExibithion() {
        let blurryEffectScreenHeight: CGFloat = 1.15
        let deviceScreenSize: CGSize = UIScreen.main.bounds.size
        let filtersContainerHeight: CGFloat = deviceScreenSize.height / blurryEffectScreenHeight
        
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: animationDurationTime, delay: animationDelayTime, usingSpringWithDamping: animationSpringDamping, initialSpringVelocity: animationSpringVelocity, options: .curveEaseIn, animations: {
            self.filtersContainerHeightConstraint.constant = filtersContainerHeight
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func animateHideEventOnFiltersContainer() {
        UIView.animate(withDuration: animationDurationTime, delay: animationDelayTime, usingSpringWithDamping: animationSpringDamping, initialSpringVelocity: animationSpringVelocity, options: .curveEaseOut, animations: {
            self.filtersContainerHeightConstraint.constant = .zero
            self.view.layoutIfNeeded()
        }) { [weak self] _ in
            guard let self = self else {
                return
            }
            
            self.filtersContainerHeightConstraint.isActive = false
            self.view.alpha = 1
            UIView.transition(with: self.view, duration: self.animationDurationTime/2, options: [.transitionCrossDissolve], animations: {
            self.view.alpha = 0
            }, completion: { (_) in
                self.view.removeFromSuperview()
                self.view.alpha = 1
            })
        }
    }
    
    // MARK: - Selector Methods
    @objc private func dismissFiltersSheetContainer() {
        animateHideEventOnFiltersContainer()
    }
}

// MARK: - Setup Components Constraints
extension FiltersSheetViewController {
    private func setupViewBlurryEffectConstraints() {
        NSLayoutConstraint.activate([
            viewBlurryEffect.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewBlurryEffect.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            viewBlurryEffect.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            viewBlurryEffect.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }
    
    private func setupFiltersContainerViewConstraints() {
        NSLayoutConstraint.activate([
            filtersContainerController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            filtersContainerController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            filtersContainerController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            filtersContainerHeightConstraint
        ])
    }
}
