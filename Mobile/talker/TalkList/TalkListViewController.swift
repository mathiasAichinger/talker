//
//  TalkListViewController.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit

class TalkListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let networkManager: NetworkManager = NetworkManager()
    
    var viewModel: TalkListViewModel {
        didSet {
            if isViewLoaded {
                self.tableView.reloadData()
            }
        }
    }
    
    let tableView: UITableView = UITableView()
    
    init(viewModel: TalkListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        layoutUI()
        styleUI()
        
        networkManager.talksDidChange.add { [weak self] (talks) in
            self?.viewModel = TalkListViewModel(talks: talks)
        }
        
        networkManager.requestTalks()
    }

    
    private func initializeUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TalkTableViewCell.self, forCellReuseIdentifier: String(describing: TalkTableViewCell.self))
        title = "Talks"
        
        
        tabBarItem = UITabBarItem(title: title, image: #imageLiteral(resourceName: "talks"), selectedImage: #imageLiteral(resourceName: "talks"))
    }
    
    private func layoutUI() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
    }
    
    private func styleUI() {
        tableView.rowHeight = 100.0
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableViewCell: TalkTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TalkTableViewCell.self), for: indexPath) as? TalkTableViewCell {
            tableViewCell.configure(talk: viewModel.talks[indexPath.row])
            return tableViewCell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.talks.count
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let detailViewController = TalkDetailViewController(viewModel: TalkDetaiViewModel(talk: viewModel.talks[indexPath.row]))
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }

}
