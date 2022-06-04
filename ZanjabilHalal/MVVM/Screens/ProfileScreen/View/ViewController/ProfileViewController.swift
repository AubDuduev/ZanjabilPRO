//
//  ProfileViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import UIKit

final class ProfileViewController: UIViewController, MVVMViewProtocol {
    
    struct ViewProperties {
        let addProfileCollection: Closure<UIView>
        let viewDidLoad         : ClosureEmpty
    }
    
    //MARK: - Public variable
    public var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var containerCollectionView: UIView!
    @IBOutlet weak var mainViewView           : UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.viewDidLoad()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addProfileCollection(self.containerCollectionView)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
