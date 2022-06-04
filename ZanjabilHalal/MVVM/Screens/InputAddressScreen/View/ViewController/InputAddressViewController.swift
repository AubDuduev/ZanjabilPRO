//
//  InputAddressViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class InputAddressViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addedInputAddressCollectionView: Closure<UIView>
        let address                        : DECAddress?
        let addActionButton                : Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var containerCollectionView  : UIView!
    @IBOutlet weak var containerActionButtonView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.addedInputAddressCollectionView(self.containerCollectionView)
        self.viewProperties?.addActionButton(self.containerActionButtonView)
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
