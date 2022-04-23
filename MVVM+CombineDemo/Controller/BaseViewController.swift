//
//  ViewController.swift
//  MVVM+CombineDemo
//
//  Created by Roro Solutions LLP on 23/04/22.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    
    private var viewModel: BaseViewModel?
    private var baseView: BaseView?
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        let viewModel = BaseViewModel()
        let baseView = BaseView(viewModel: viewModel)
        self.viewModel = viewModel 
        self.baseView = baseView
        self.view.addSubview(baseView)
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        setupViewListeners()
    }
    
    private func setupViewListeners() {
        viewModel?.$nameText.sink(receiveValue: { [weak self] text in
            self?.baseView?.nameLabel.text = text
        }).store(in: &cancellables)
        viewModel?.$followersCountText.sink(receiveValue: { [weak self] text in
            self?.baseView?.followersCountLabel.text = text
        }).store(in: &cancellables)
    }

}

