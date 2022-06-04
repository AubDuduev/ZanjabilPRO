//
//  MenuViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import UIKit

final class MenuViewController: UIViewController, MVVMViewProtocol {
   
    //MARK: - ViewModel
    public var viewModel: MenuViewModel!
    
    struct ViewProperties {
        let addMenuCollectionContainerView: Closure<UIView>
        let addDishCategoriesView         : Closure<UIView>
        let addSwitchMenuView             : Closure<UIView>
        let addBlurHeaderView             : Closure<UIView>
        let viewDidLoad                   : ClosureEmpty
    }
    
    var viewProperties: ViewProperties?
    
    private var switchMenuView: SwitchMenuView!
    
    //MARK: - Outlets
    @IBOutlet private weak var switchMenuContainerView    : UIView!
    @IBOutlet private weak var menuCollectionContainerView: UIView!
    @IBOutlet private weak var dishCategoriesContainerView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewProperties?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    public func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addMenuCollectionContainerView(self.menuCollectionContainerView)
        self.viewProperties?.addBlurHeaderView(self.menuCollectionContainerView)
        self.viewProperties?.addDishCategoriesView(self.dishCategoriesContainerView)
        self.viewProperties?.addSwitchMenuView(self.switchMenuContainerView)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
