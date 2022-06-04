//
//  AddDishView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 20.03.2022.
//
import UIKit

final class AddDishView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let dish         : DECDish
        let didTapAddDish: Closure<DECDish>
        let hiddenState  : HiddenState
    }
    var viewProperties: ViewProperties?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setState()
    }
    
    private func setState(){
        guard let viewProperties = self.viewProperties else { return }
        self.isHidden = viewProperties.hiddenState.state()
    }
    
    private func setup(){
        self.cornerRadius(17, true)
    }
    
    @IBAction func addDishButton(button: UIButton){
        guard let viewProperties = self.viewProperties else { return }
        self.viewProperties?.didTapAddDish(viewProperties.dish)
    }
    
    static func create() -> AddDishView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! AddDishView
        return view
    }
}
