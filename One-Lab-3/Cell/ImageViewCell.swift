//
//  TableViewCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import UIKit

typealias ImageViewCellConfigurator = TableCellConfigurator<ImageViewCell, String>


class ImageViewCell: UITableViewCell, ConfigurableCell {
    typealias DataType = String
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: String) {
        avatarImageView.image = UIImage(named: data)
    }
    
    private func layoutUI() {
        selectionStyle = .none
        contentView.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
}
