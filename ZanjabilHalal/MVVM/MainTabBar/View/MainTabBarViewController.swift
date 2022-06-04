//
//  MainTabBarViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 12.03.2022.
//
import UIKit

final class MainTabBarViewController: UITabBarController, MVVMViewProtocol {
    
    struct ViewProperties {
        let viewDidLayoutSubviews: ClosureEmpty
        let viewWillAppear       : ClosureEmpty
        let viewDidAppear        : ClosureEmpty
    }
    public var viewProperties: ViewProperties?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewProperties?.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewProperties?.viewDidAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.viewProperties?.viewDidLayoutSubviews()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
