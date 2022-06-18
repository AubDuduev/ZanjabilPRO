//
//  OrderCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 24.04.2022.
//
import Resolver
import UIKit

final class OrderCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let orderDish: DECOrderDish
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var nameDishLabel : UILabel!
    @IBOutlet weak private var countDishLabel: UILabel!
    @IBOutlet weak private var priceDishLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setData()
    }
    private func setData(){
        guard let viewProperties = self.viewProperties else { return }
        self.nameDishLabel.text  = viewProperties.orderDish.name
        self.countDishLabel.text = "\(viewProperties.orderDish.count?.toString ?? "") X"
        self.priceDishLabel.text = AmountService.rub(with: viewProperties.orderDish.price ?? 0)
    }
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> OrderCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! OrderCollectionCell
        return cell
    }
}
