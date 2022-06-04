//
//  BasketViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

final class BasketViewController: UIViewController, MVVMViewProtocol  {
    
    struct ViewProperties {
        let addedBasketCollectionView: Closure<UIView>
        let addBuyView               : Closure<UIView>
        let addBasketTotalSumView    : Closure<UIView>
        let addBlurHeaderView        : Closure<UIView>
        let viewDidLoad              : ClosureEmpty
    }
    public var viewProperties: ViewProperties?
    
    //MARK: - Outlets
    @IBOutlet weak var menuContainerCollectionView: UIView!
    @IBOutlet weak var addBasketTotalSumView      : UIView!
    @IBOutlet weak var mainView                   : UIView!
    @IBOutlet weak var containerBuyView           : UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.viewDidLoad()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.viewProperties?.addedBasketCollectionView(self.menuContainerCollectionView)
		self.viewProperties?.addBlurHeaderView(self.menuContainerCollectionView)
		self.viewProperties?.addBuyView(self.containerBuyView)
		self.viewProperties?.addBasketTotalSumView(self.addBasketTotalSumView)
	}
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
