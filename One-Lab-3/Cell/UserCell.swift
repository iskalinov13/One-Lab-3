//
//  UserCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import UIKit


struct User {
    let imageName: String
    let name: String
}

typealias UserCellConfigurator = TableCellConfigurator<UserCell, User>

class UserCell: UITableViewCell, ConfigurableCell {
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private var stackView: UIStackView {
        let stackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
    
    func configure(data: User) {
        avatarImageView.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }
    
    private func layoutUI() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.size.equalTo(30)
        }
    }
}
