//
//  OrderCollectionHeader.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 30.04.2022.
//
import UIKit

final class OrderCollectionHeader: UICollectionReusableView, MVVMViewProtocol {
   
    struct ViewProperties {
        let order: DECOrder
    }
   
    public var viewProperties: ViewProperties?
    
    @IBOutlet weak var headerTitleLabel: UILabel!
   
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setTitle()
    }
    private func setTitle(){
        guard let viewProperties = self.viewProperties else { return }
        self.headerTitleLabel.text = viewProperties.order.createDate?.toStaring(format: .dayMonthTextYear)
    }
    
    // MARK: - create view
    static func create(_ collection: UICollectionView, ofKind: String, indexPath: IndexPath) -> OrderCollectionHeader {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: String(describing: Self.self), for: indexPath)
        return cell as! OrderCollectionHeader
    }
}
