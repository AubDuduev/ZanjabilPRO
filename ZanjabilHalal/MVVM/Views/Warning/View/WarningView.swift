//
//  WarningView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit

final class WarningView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let text: String
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet private weak var warningTextLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cornerRadius(8, true)
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.warningTextLabel.text = viewProperties?.text
    }
    // MARK: - create view
    static func create() -> WarningView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! WarningView
        return view
    }
}
