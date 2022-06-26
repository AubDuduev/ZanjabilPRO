//
//  PayInfoView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

final class PayInfoView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        var payInfoCellTypes: PayInfoCellTypes
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var titleLabel  : UILabel!
    @IBOutlet weak private var infoLabel   : UILabel!
    @IBOutlet weak private var infoButton  : UIButton!
	@IBOutlet weak private var activityView: UIActivityIndicatorView!
    
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setData()
		self.setupActivityView()
	}
    func update(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
		self.setData()
		self.setupActivityView()
    }
    private func setData(){
        guard let viewProperties = self.viewProperties else { return }
        self.titleLabel.text     = viewProperties.payInfoCellTypes.title()
        self.infoLabel.text      = viewProperties.payInfoCellTypes.info()
        self.titleLabel.font     = viewProperties.payInfoCellTypes.titleFont()
        self.infoLabel.font      = viewProperties.payInfoCellTypes.infoFont()
        self.infoButton.isHidden = viewProperties.payInfoCellTypes.infoButtonHidden()
		
    }
	private func setupActivityView(){
		guard let viewProperties = self.viewProperties else { return }
		if viewProperties.payInfoCellTypes.info() == nil {
			self.activityView.startAnimating()
			self.activityView.isHidden = false
		} else {
			self.activityView.stopAnimating()
			self.activityView.isHidden = true
		}
	}
    // MARK: - create view
    static func create() -> PayInfoView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! PayInfoView
        return view
    }
}
