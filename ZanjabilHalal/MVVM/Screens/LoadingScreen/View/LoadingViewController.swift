//
//  LoadingViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

final class LoadingViewController: UIViewController, MVVMViewProtocol {
    
    struct ViewProperties {
        let viewDidLoad  : ClosureEmpty
        let viewDidAppear: ClosureEmpty
        let addLogo      : Closure<UIView>
    }
    
    //MARK: - Public variable
    public var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var logoView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.viewDidLoad()
        self.viewProperties?.addLogo(self.logoView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewProperties?.viewDidAppear()
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
