//
//  OrderViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import UIKit

final class OrderViewController: UIViewController, MVVMViewProtocol  {
    
    struct ViewProperties {
        
    }
    
    //MARK: - Public variable
    public var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func update(with viewProperties: ViewProperties?) {
        
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
