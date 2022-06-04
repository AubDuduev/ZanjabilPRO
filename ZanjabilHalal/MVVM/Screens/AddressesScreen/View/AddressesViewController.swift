//
//  AddressesViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

private typealias R = TextResources.AddressesViewController

final class AddressesViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        let addressesCollectionView: Closure<UIView>
        let addAddressButtonView   : Closure<UIView>
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var addressesCollectionView: UIView!
    @IBOutlet weak var addAddressContainerView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.addressesCollectionView(self.addressesCollectionView)
        self.viewProperties?.addAddressButtonView(self.addAddressContainerView)
        self.setTitle()
    }
    
    private func setTitle(){
        self.title = R.title
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
