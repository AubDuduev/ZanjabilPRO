//
//  MainNavigationViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

final class MainNavigationViewController: UINavigationController, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    
    //MARK: - Public variable
    public var viewProperties: ViewProperties?
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    
    public func update(with viewProperties: ViewProperties?) {
        
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
