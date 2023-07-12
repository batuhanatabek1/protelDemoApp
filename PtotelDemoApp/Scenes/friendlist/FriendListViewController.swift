//
//  FriendListViewController.swift
//  PtotelDemoApp
//
//  Created by Batuhan Atabek on 8.07.2023.
//

import UIKit
import RealmSwift

class FriendListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FriendListViewModelProtocol = FriendListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
        configureTableView()
        configureViewModel()
        fetchData()
    }
    
    private func initalize() {
        navigationController?.navigationBar.isHidden = false
    }
    
    private func configureTableView() {
        tableView.register(UserCell.nib(), forCellReuseIdentifier: UserCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func configureViewModel() {
        viewModel.delegate = self
    }
    
    private func fetchData() {
        viewModel.checkInternetConnection()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        let destinationVC = segue.destination as! DetailViewController
        viewModel.checkConnection ? destinationVC.setData(model: viewModel.userArray[safe: index ?? -1]) : destinationVC.setData(model: viewModel.getUserModel(realmUserModel: viewModel.realmUserArray[safe: index ?? -1]))
//        let item = viewModel.realmUserArray[safe: index ?? -1]
//        destinationVC.setData(model: viewModel.getUserModel(realmUserModel: item))
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension FriendListViewController: FriendListViewModelDelegate {
    func showList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FriendListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.checkConnection ? viewModel.userArray.count : viewModel.realmUserArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as! UserCell
        
        viewModel.checkConnection ? cell.setup(model: viewModel.userArray[indexPath.row]) : cell.setup(model: viewModel.getUserModel(realmUserModel: viewModel.realmUserArray[indexPath.row]) ?? UserModel())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.PerformSegues.detail, sender: indexPath.row)
    }
    
}
