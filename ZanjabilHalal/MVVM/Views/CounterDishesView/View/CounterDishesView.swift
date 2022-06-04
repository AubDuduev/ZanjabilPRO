//
//  CounterDishesView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 20.03.2022.
//
import UIKit

final class CounterDishesView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        var dish                  : DECDish
        var counter               : Int
        var counterString         : String
        let hiddenState           : HiddenState
        let didActionCounterDishes: ClosureTwo<ActionAddRemove, Int>
    }
    var viewProperties: ViewProperties?
    
    // MARK: - Outlets
    @IBOutlet weak var counterLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setState()
        self.setCounter()
    }
    
    private func setState(){
        guard let viewProperties = self.viewProperties else { return }
        self.isHidden = viewProperties.hiddenState.state()
    }
    
    private func setCounter(){
        guard let viewProperties = self.viewProperties else { return }
        self.counterLabel.text = viewProperties.counterString
    }
    
    private func setup(){
        self.counterLabel.cornerRadius(17, true)
    }
    
    @IBAction private func increaseCounterButton(button: UIButton){
        guard let viewProperties = self.viewProperties else { return }
        let action = ActionAddRemove(rawValue: button.tag) ?? .remove
        viewProperties.didActionCounterDishes(action, viewProperties.counter)
    }
    // MARK: - create view
    static func create() -> CounterDishesView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! CounterDishesView
        return view
    }
}

typealias CounterDishesChangeCounter = (action: ActionAddRemove, counter: Int)
