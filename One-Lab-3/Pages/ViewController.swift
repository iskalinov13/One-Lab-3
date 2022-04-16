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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
       
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.backgroundColor = .white
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
       // tableView.register(ImageViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        if indexPath.row == 0 {
            cell.accessoryType = .detailButton
        }
            
        item.configure(cell: cell)
        
        return cell
    }
    
    
}

