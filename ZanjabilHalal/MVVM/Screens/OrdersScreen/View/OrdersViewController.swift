//
//  OrdersViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

private typealias R = TextResources.OrdersViewController

final class OrdersViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addedOrdersCollectionView: Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var ordersContainerCollectionView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle()
    }
    
    private func setTitle(){
        self.title = R.title
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addedOrdersCollectionView(ordersContainerCollectionView)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
