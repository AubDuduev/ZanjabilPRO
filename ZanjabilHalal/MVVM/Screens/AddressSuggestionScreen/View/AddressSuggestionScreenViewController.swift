//
//  AddressSuggestionScreenViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 31.05.2022.
//
import UIKit

final class AddressSuggestionScreenViewController: UIViewController, MVVMViewProtocol {
    
    //MARK: - Main ViewProperties
    struct ViewProperties {
        
    }
    var viewProperties: ViewProperties?
    
    //MARK: - Outlets
	@IBOutlet weak private var containerSearchView: UIView!
	@IBOutlet weak private var containerAddressSuggestionsCollectionView: UIView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
