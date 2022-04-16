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
//        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
//        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
//        UserCellConfigurator(item: User(imageName: "avatar", name: "Vasya")),
        TextCellConfigurator(item: "Bla bla")
        //ImageViewCellConfigurator(item: "avatar")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId)!
        item.configure(cell: cell)
        
        return cell
    }
    
    
}

