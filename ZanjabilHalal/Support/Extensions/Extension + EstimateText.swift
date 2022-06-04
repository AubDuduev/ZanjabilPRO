import UIKit

extension String {
	
	public func heightText(plus: CGFloat = 0.0, font: UIFont = UIFont.systemFont(ofSize: 15)) -> CGFloat {
		let width : CGFloat = 200
		let height: CGFloat = 100
		let size = CGSize(width: width, height: height)
		let attributes = [NSAttributedString.Key.font: font]
		let options    = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
		let heightView = self.boundingRect(with: size,
										   options: options,
										   attributes: attributes,
										   context: nil).height
		return heightView + plus
	}
	public func widthText(plus: CGFloat = 0.0) -> CGFloat {
		let width : CGFloat = 200
		let height: CGFloat = 100
		let size = CGSize(width: width, height: height)
		let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
		let options    = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
		let widthView  = self.boundingRect(with: size,
										   options: options,
										   attributes: attributes,
										   context: nil).width
		return widthView + plus
	}
}

