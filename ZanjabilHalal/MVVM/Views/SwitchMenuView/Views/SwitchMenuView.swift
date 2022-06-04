//
//  SwitchMenuView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 20.03.2022.
//
import Combine
import UIKit

final class SwitchMenuView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        var menuState               : MenuState
        var didActionSwitchStateMenu: Closure<Int>
    }
    public var viewProperties: ViewProperties?
    
    @IBOutlet private var switchButtons: [UIButton]!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setSwitchButtons()
    }
    
    private func setSwitchButtons(){
        guard let viewProperties = self.viewProperties else { return }
        self.switchButtons[0].tintColor = viewProperties.menuState.buttonColorState().active
        self.switchButtons[1].tintColor = viewProperties.menuState.buttonColorState().noActive
    }
    
    private func setup(){
        self.cornerRadius(8, true)
    }
    
    @IBAction private func switchStateMenuButton(button: UIButton){
        guard let viewProperties = self.viewProperties else { return }
        viewProperties.didActionSwitchStateMenu(button.tag)
    }

    static func create() -> SwitchMenuView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! SwitchMenuView
        return view
    }
}
