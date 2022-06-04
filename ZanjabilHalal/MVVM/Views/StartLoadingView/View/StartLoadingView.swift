//
//  StartLoadingView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 02.05.2022.
//
import UIKit

final class StartLoadingView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let loadingCategoryItems: Closure<[UIView]>
        let loadingLoadingCells : Closure<[UIView]>
        let loadingTabItems     : Closure<[UIView]>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var bottomView: UIView!
    
    @IBOutlet private var loadingCategoryItems: [UIView]!
    @IBOutlet private var loadingCells        : [UIView]!
    @IBOutlet private var loadingTabItems     : [UIView]!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.loadingCategoryItems(self.loadingCategoryItems)
        self.viewProperties?.loadingLoadingCells(self.loadingCells)
        self.viewProperties?.loadingTabItems(self.loadingTabItems)
    }
    // MARK: - create view
    static func create() -> StartLoadingView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! StartLoadingView
        return view
    }
}
