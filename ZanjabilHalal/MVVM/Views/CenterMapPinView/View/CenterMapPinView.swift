//
//  CenterMapPinView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.06.2022.
//
import UIKit

final class CenterMapPinView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> CenterMapPinView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! CenterMapPinView
        return view
    }
}
