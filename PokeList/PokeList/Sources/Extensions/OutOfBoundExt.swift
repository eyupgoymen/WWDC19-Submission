//
//  OutOfBoundExt.swift
//  Book_Sources
//
//  Created by Eyüp Göymen on 15.03.2019.
//

import UIKit

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
