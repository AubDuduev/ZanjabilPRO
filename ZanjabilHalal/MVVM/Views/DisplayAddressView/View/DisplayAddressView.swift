//
//  DisplayAddressView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.06.2022.
//
import UIKit

final class DisplayAddressView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> DisplayAddressView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! DisplayAddressView
        return view
    }
}
