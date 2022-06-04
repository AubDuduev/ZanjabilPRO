//
//  PayOrderViewController.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

private typealias R = TextResources.PayOrderViewController

final class PayOrderViewController: UIViewController, MVVMViewProtocol, KeyBoardProtocol {
    
    struct ViewProperties {
        let addPayOrderCollectionView  : Closure<UIView>
        let addActionButton            : Closure<UIView>
    }
    //MARK: - Public variable
    public var viewProperties: ViewProperties?
    //MARK: - Outlets
    @IBOutlet weak var payOrderContainerOfCollectionView: UIView!
    @IBOutlet weak var containerActionButtonView        : UIView!
    //MARK: - Outlets NSLayoutConstraint
    @IBOutlet weak var mainStackViewBottomConstant: NSLayoutConstraint!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNotification()
        self.setTitle()
    }
    
    private func setTitle(){
        self.title = R.title
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.viewProperties?.addPayOrderCollectionView(payOrderContainerOfCollectionView)
        self.viewProperties?.addActionButton(containerActionButtonView)
    }
    
    func showKeyboard(with heightAnimation: CGFloat) {
        self.mainStackViewBottomConstant.constant = heightAnimation
    }
    
    func dismissKeyboard(with heightAnimation: CGFloat) {
        self.mainStackViewBottomConstant.constant = 0
    }
    
    @IBAction func tapGesture(gesture: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
