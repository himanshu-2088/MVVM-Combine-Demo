//
//  BaseViewModel.swift
//  MVVM+CombineDemo
//
//  Created by Roro Solutions LLP on 23/04/22.
//

import UIKit
import Combine

class BaseViewModel: NSObject {
    public var tableView: UITableView?
    @Published private(set) var nameText: String = ""
    @Published private(set) var followersCountText: String = ""
    private var followers: [String] = []
    
    override init() {
        super.init()
        setupTableView()
        getData()
    }
    
    private func setupTableView() {
        self.tableView = UITableView(frame: .zero)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func getData() {
        let apiService = APIService()
        //We are using this timer to mimic this as a real API call.
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.nameText = apiService.getUserName()
            self.followersCountText = "\(apiService.getFollowers().count) Followers"
        }
        self.followers = apiService.getFollowers()
        self.tableView?.reloadData()
    }
}

extension BaseViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.nameLabel.text = followers[indexPath.row]
        return cell
    }
    
}
