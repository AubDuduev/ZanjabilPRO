//
//  ActionButtonView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import UIKit

final class ActionButtonView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let didAction       : ClosureEmpty
        let actionButtonType: ActionButtonType
    }
    
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setTitle()
    }
    
    private func setTitle(){
        self.actionButton.setTitle(self.viewProperties?.actionButtonType.title(), for: .normal)
    }
    
    private func setup(){
        self.actionButton.cornerRadius(24, true)
    }
    
    @IBAction func actionButton(button: UIButton){
        self.viewProperties?.didAction()
    }
    
    static func create() -> ActionButtonView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! ActionButtonView
        return view
    }
}

