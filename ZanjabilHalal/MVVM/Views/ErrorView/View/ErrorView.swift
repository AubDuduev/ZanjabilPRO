//
//  ErrorView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit

final class ErrorView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> ErrorView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! ErrorView
        return view
    }
}
