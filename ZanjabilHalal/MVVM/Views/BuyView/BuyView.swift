//
//  BuyView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

final class BuyView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let didTapBuy: ClosureEmpty
    }
    var viewProperties: ViewProperties?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    private func setup(){
        self.cornerRadius(32, false)
    }
    
    //MARK: -
    @IBAction func buyOrderButton(button: UIButton){
        self.viewProperties?.didTapBuy()
    }
    
    static func create() -> BuyView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! BuyView
        return view
    }
}

