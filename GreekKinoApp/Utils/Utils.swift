//
//  Utils.swift
//  GreekKinoApp
//
//  Created by Aleksa Stojiljkovic on 10.9.22..
//

import UIKit


protocol XibTableCellInitializable {
    static var nib: UINib { get }
    static var id: String { get }
}

extension XibTableCellInitializable where Self: UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
    static var id: String {
        return String(describing: self)
    }
}

