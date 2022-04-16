//
//  TextCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import UIKit

typealias TextCellConfigurator = TableCellConfigurator<TextCell, String>

class TextCell: UITableViewCell, ConfigurableCell {

    typealias DataType = String
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: String) {
        commentLabel.text = data
    }
    
    private func layoutUI() {
        contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
    }
}

