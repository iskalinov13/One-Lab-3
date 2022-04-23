//
//  ViewController.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let items: [CellConfigurator] = [
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        TextCellConfigurator(item: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing"),
        ImageViewCellConfigurator(item: "image"),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya"))
    ]
    
    private lazy var tableDirector: TableDirector = {
        let tableDirector = TableDirector(tableView: tableView, items: items)
        return tableDirector
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
       
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        cellActionHandlers()
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableDirector.tableView.reloadData()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .didSelect) { (config: UserCellConfigurator, cell) in
                
            }
            .on(action: .willDisplay) { (config: ImageViewCellConfigurator, cell) in
                cell.backgroundColor = .gray
            }.on(action: .custom(UserCell.didTapButtonAction)){ (config: UserCellConfigurator, cell) in
                print("button did tap")
            }.on(action: .custom(UserCell.didTapFollowButtonAction)){ (config: UserCellConfigurator, cell) in
                print("follow button did tap")
            }
    }
}


