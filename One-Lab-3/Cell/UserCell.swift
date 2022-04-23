//
//  UserCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import UIKit


struct User: Hashable {
    let imageName: String
    let name: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(imageName)
        hasher.combine(name)
    }
}

typealias UserCellConfigurator = TableCellConfigurator<UserCell, User>

class UserCell: UITableViewCell, ConfigurableCell {
    static let didTapButtonAction = "UserCellDidTapButtonAction"
    static let didTapFollowButtonAction = "UserCellDidTapFollowButtonAction"
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(didTapFollowButton), for: .touchUpInside)
        return button
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Click", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avatarImageView, nameLabel, button, followButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        followButton.layer.cornerRadius = 10
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
    }
    
    @objc private func didTapFollowButton() {
        CellAction.custom(type(of: self).didTapFollowButtonAction).invoke(cell: self)
    }
    
    @objc private func didTapButton() {
        CellAction.custom(type(of: self).didTapButtonAction).invoke(cell: self)
    }
    
    func configure(data: User) {
        avatarImageView.image = UIImage(named: data.imageName)
        nameLabel.text = data.name
    }
    
    private func layoutUI() {
        confgigureStackView()
        
        avatarImageView.snp.makeConstraints {
            $0.size.equalTo(50)
        }
    }
    
    private func confgigureStackView() {
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
//        button.snp.makeConstraints {
//            $0.width.equalTo(40)
//            $0.height.equalTo(20)
//        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
}
