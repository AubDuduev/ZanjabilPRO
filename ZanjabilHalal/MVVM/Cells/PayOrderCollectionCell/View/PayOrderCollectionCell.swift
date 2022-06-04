//
//  PayOrderCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

final class PayOrderCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let addView               : Closure<UIView>
        let payOrderCollectionCell: PayOrderCollectionCells
    }
    public var viewProperties: ViewProperties?
    
    @IBOutlet weak var containerView: UIView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addView(self.containerView)
    }
    
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> PayOrderCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! PayOrderCollectionCell
        return cell
    }
}
