//
//  PayInfoView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class PayInfoView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let payInfoCellTypes: PayInfoCellTypes
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel : UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setData()
    }
    private func setData(){
        guard let viewProperties = self.viewProperties else { return }
        self.titleLabel.text     = viewProperties.payInfoCellTypes.title()
        self.infoLabel.text      = viewProperties.payInfoCellTypes.info()
        self.titleLabel.font     = viewProperties.payInfoCellTypes.titleFont()
        self.infoLabel.font      = viewProperties.payInfoCellTypes.infoFont()
        self.infoButton.isHidden = viewProperties.payInfoCellTypes.infoButtonHidden()
    }
    // MARK: - create view
    static func create() -> PayInfoView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! PayInfoView
        return view
    }
}
