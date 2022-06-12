//
//  CenterMapPinView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.06.2022.
//
import UIKit

final class CenterMapPinView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
		
		var regionChange: RegionChange
    }
    var viewProperties: ViewProperties?
	
	@IBOutlet weak private var centerPinImageView: UIImageView!
	
//	override func awakeAfter(using coder: NSCoder) -> Any? {
//		guard subviews.isEmpty else { return self }
//		let nibName = String(describing: CenterMapPinView.self)
//		let bundle = Bundle(for: CenterMapPinView.self)
//		return bundle.loadNibNamed(nibName, owner: nil, options: nil)?.first
//	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		print("awakeFromNib")
	}

	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.animationCenterPinImageView()
    }
	
	private func animationCenterPinImageView(){
		guard let regionChange = self.viewProperties?.regionChange else { return }
		switch regionChange {
			case .start:
				UIView.animate(withDuration: 0.4) {
					self.centerPinImageView.transform = CGAffineTransform(translationX: 0, y: -15)
				}
			case .finish:
				UIView.animate(withDuration: 0.8) {
					self.centerPinImageView.transform = .identity
				}
		}
	}
	
    // MARK: - create view
    static func create() -> CenterMapPinView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! CenterMapPinView
        return view
    }
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}
}
