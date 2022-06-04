//
//  BasketTotalSumView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import UIKit

final class BasketTotalSumView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let countsDishesText: String
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var countsDishesLabel: UILabel!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setCountsDishes()
    }
    
    private func setCountsDishes(){
        guard let viewProperties = viewProperties else { return }
        self.countsDishesLabel.text = viewProperties.countsDishesText
    }
    
    // MARK: - create view
    static func create() -> BasketTotalSumView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! BasketTotalSumView
        return view
    }
}
