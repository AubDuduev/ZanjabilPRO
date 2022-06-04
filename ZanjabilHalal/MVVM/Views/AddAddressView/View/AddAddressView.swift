//
//  AddAddressView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import UIKit

final class AddAddressView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let addAddress: ClosureEmpty
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
    @IBAction func addAddressButton(button: UIButton){
        self.viewProperties?.addAddress()
    }
    
    // MARK: - create view
    static func create() -> AddAddressView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AddAddressView
        return view
    }
}
