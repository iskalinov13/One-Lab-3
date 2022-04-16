//
//  ConfigurableCell.swift
//  One-Lab-3
//
//  Created by Farukh on 16.04.2022.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}
