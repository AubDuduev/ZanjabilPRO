//
//  BascketInfoView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import UIKit

final class BascketInfoView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> BascketInfoView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! BascketInfoView
        return view
    }
}
