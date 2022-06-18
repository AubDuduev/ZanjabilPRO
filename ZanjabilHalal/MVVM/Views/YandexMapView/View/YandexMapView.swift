//
//  YandexMapView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import UIKit

final class YandexMapView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create view
    static func create() -> YandexMapView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! YandexMapView
        return view
    }
}
