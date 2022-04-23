//
//  BaseView.swift
//  MVVM+CombineDemo
//
//  Created by Roro Solutions LLP on 23/04/22.
//

import UIKit

class BaseView: UIView {
    private let viewModel: BaseViewModel
    private var followersTableView = UITableView(frame: .zero)
    
    public var nameLabel = UILabel()
    public var followersCountLabel = UILabel()
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
        if let tableView = viewModel.tableView {
            self.followersTableView = tableView
        }
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        nameLabel.font = UIFont(name: "Avenir", size: 24.0)
        followersCountLabel.font = UIFont(name: "Avenir", size: 18.0)
        
        [nameLabel, followersCountLabel, followersTableView].forEach({ self.addSubview($0) })
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50.0).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        followersCountLabel.translatesAutoresizingMaskIntoConstraints = false
        followersCountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0).isActive = true
        followersCountLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0).isActive = true
        followersCountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16.0).isActive = true
        
        followersTableView.translatesAutoresizingMaskIntoConstraints = false
        followersTableView.topAnchor.constraint(equalTo: followersCountLabel.bottomAnchor, constant: 20.0).isActive = true
        followersTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12.0).isActive = true
        followersTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        followersTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
