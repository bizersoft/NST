//
//  Reusable+Extension.swift
//  NST
//
//  Created by TIAN TONG on 10/6/20.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable where Self: UITableViewCell {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
}

extension UITableView {
    
    func registerCell<Cell: UITableViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseId)
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("Unknow cell at \(indexPath)")
        }
        return cell
    }
    
}

extension UICollectionReusableView: Reusable {}

extension Reusable where Self: UICollectionViewCell {

    static var reuseId: String {
        return String(describing: self)
    }

}

extension Reusable where Self: UICollectionReusableView {
    
    static var reuseId: String { return String(describing: self) }
    
}

extension UICollectionView {
    
    func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseId)
    }
    
    func registerHeaderView<View: UICollectionReusableView>(_ viewClass: View.Type) {
        register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: viewClass.reuseId)
    }
    
    func registerFooterView<View: UICollectionReusableView>(_ viewClass: View.Type) {
        register(viewClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: viewClass.reuseId)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reuseId, for: indexPath) as? Cell else { fatalError("Unknow cell at \(indexPath)")
        }
        return cell
    }
    
    func dequeueReusableHeader<View: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> View {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: View.reuseId, for: indexPath) as? View else {
            fatalError("Unknow header view at \(indexPath)")
        }
        return view
    }
    
    func dequeueReusableFooter<View: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> View {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: View.reuseId, for: indexPath) as? View else {
            fatalError("Unknow footer view at \(indexPath)")
        }
        return view
    }
    
}
