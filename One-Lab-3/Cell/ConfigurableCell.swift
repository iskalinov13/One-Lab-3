//
//  ConfigurableCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    static var reuseIdentifier: String { get }
    func configure(data: DataType)
}

extension ConfigurableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}

