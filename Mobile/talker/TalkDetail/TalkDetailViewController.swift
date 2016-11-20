//
//  TalkDetailViewController.swift
//  talker
//
//  Created by Mathias Aichinger on 20/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit

class TalkDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let networkManager: NetworkManager = NetworkManager()
    
    var viewModel: TalkDetaiViewModel {
        didSet {
            if isViewLoaded {
                self.tableView.reloadData()
            }
        }
    }
    
    let tableView: UITableView = UITableView()
    
    init(viewModel: TalkDetaiViewModel) {
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
    }
    
    
    private func initializeUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TalkDetailInfoTableViewCell.self, forCellReuseIdentifier: String(describing: TalkDetailInfoTableViewCell.self))
        tableView.register(TalkDetailDescriptionTableViewCell.self, forCellReuseIdentifier: String(describing: TalkDetailDescriptionTableViewCell.self))
    }
    
    private func layoutUI() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    private func styleUI() {
        title = viewModel.talk.title
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let tableViewCell: TalkDetailInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TalkDetailInfoTableViewCell.self), for: indexPath) as? TalkDetailInfoTableViewCell {
                tableViewCell.configure(talk: viewModel.talk)
                tableViewCell.selectionStyle = .none
                return tableViewCell
            }
        case 1:
            if let tableViewCell: TalkDetailDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TalkDetailDescriptionTableViewCell.self), for: indexPath) as? TalkDetailDescriptionTableViewCell {
                tableViewCell.configure(descriptionText: viewModel.descriptionText)
                tableViewCell.selectionStyle = .none
                return tableViewCell
            }
        case 2:
            var cell: UITableViewCell
            
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell") {
                cell = tableViewCell
            } else {
                cell = UITableViewCell(style: .default, reuseIdentifier: "feedbackCell")
            }
            cell.textLabel?.text = "Give Feedback"
            cell.accessoryType = .disclosureIndicator
            return cell
        case 3:
            var cell: UITableViewCell
            
            if let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "githubCell") {
                cell = tableViewCell
            } else {
                cell = UITableViewCell(style: .default, reuseIdentifier: "githubCell")
            }
            cell.textLabel?.text = "Github"
            cell.accessoryType = .disclosureIndicator
            return cell
        default: break
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 100.0
        case 1:
            return 200.0
        case 2...4:
            return 55.0
        default:
            return 0
        }
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 2:
            let feedbackViewController = FeedbackViewController()
            navigationController?.show(UINavigationController(rootViewController: feedbackViewController), sender: nil)
        case 3:
            if let githubUrl = viewModel.githubUrl {
                UIApplication.shared.open(githubUrl, options: [:], completionHandler: nil)
            }
        default: break
        }
    }
}
