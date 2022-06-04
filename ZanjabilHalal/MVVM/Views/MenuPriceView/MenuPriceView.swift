//
//  MenuPriceView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 20.03.2022.
//
import UIKit

final class MenuPriceView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        var price: Decimal
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var priceLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setPrice()
    }
    
    private func setPrice(){
        guard let viewProperties = self.viewProperties else { return }
        self.priceLabel.text = AmountService.rub(with: viewProperties.price) 
    }
    
    static func create() -> MenuPriceView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! MenuPriceView
        return view
    }
}

