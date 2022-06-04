import AnimatedGradientView
import UIKit

final class TabBarView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let didTapActionButton: Closure<Int>
    }
    public var viewProperties: ViewProperties?
    // MARK: - Outlets
    @IBOutlet weak var commonStackView: UIStackView!
    // MARK: - Array outlets
    @IBOutlet var iconsImageViews  : [UIImageView]!
    @IBOutlet var iconsViews       : [UIView]!
    @IBOutlet var titleLabels      : [UILabel]!
    @IBOutlet var buttonLabels     : [UIButton]!
    @IBOutlet var sectionStackViews: [UIStackView]!
    // MARK: - Outlets Constraint
    @IBOutlet weak var topCommonStackViewConstant   : NSLayoutConstraint!
    @IBOutlet weak var bottomCommonStackViewConstant: NSLayoutConstraint!
    // MARK: - Outlets NSLayoutConstraint
    @IBOutlet var heightLabelsConstant: [NSLayoutConstraint]!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    
    @IBAction func actionButton(button: UIButton){
        self.viewProperties?.didTapActionButton(button.tag)
    }
    // MARK: - create view
    static func create() -> TabBarView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! TabBarView
        return view
    }
}

enum TabBarImage: String, CaseIterable {
    
    case menuTabBar
    case basketTabBar
    case profileTabBar
}


