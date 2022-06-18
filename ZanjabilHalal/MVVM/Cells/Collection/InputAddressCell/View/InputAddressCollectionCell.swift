//
//  InputAddressCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import UIKit

private typealias R = TextResources.InputAddressCollectionCell.Text

final class InputAddressCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let inputAddressType: InputAddressTypes
        let typedText       : String?
        let delegate        : UITextFieldDelegate
        let isHiddenAction  : Bool
        let didTapAction    : Closure<InputAddressTypes>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet private weak var mainView          : UIView!
    @IBOutlet private weak var titleLabel        : UILabel!
    @IBOutlet private weak var inputDataTextField: UITextField!
    @IBOutlet private weak var actionButton      : UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupMainView()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setTitle()
        self.setupInputDataTextField()
        self.setInputDataTextField()
        self.setupActionButton()
    }
    
    private func setupActionButton(){
        guard let viewProperties = self.viewProperties else { return }
        self.actionButton.isHidden = viewProperties.isHiddenAction
    }
    
    private func setupInputDataTextField(){
        guard let viewProperties = self.viewProperties else { return }
        self.inputDataTextField.delegate     = viewProperties.delegate
        self.inputDataTextField.keyboardType = viewProperties.inputAddressType.keyboardType()
        let foregroundColor: [NSAttributedString.Key : Any] = [.foregroundColor: UIColor.set(.greenFive)]
        let font           : [NSAttributedString.Key : Any] = [.font: UIFont.systemFont(ofSize: 11, weight: .light)]
        let attributedPlaceholder = NSMutableAttributedString(string: R.attributedPlaceholder.localizedString())
        let range = NSRange(location: 0, length: R.attributedPlaceholder.localizedString().count)
        attributedPlaceholder.setAttributes(foregroundColor, range: range)
        attributedPlaceholder.setAttributes(font, range: range)
        self.inputDataTextField.attributedPlaceholder = attributedPlaceholder
    }
    
    private func setInputDataTextField(){
		guard let viewProperties = self.viewProperties else { return }
        self.inputDataTextField.text = viewProperties.inputAddressType.name()
		self.inputDataTextField.isUserInteractionEnabled = viewProperties.inputAddressType.isUserInteraction()
    }
    
    private func setTitle(){
        self.titleLabel.text = self.viewProperties?.inputAddressType.title()
    }
    
    private func setupMainView(){
        self.mainView.cornerRadius(8, true)
    }
    
    //MARK: -
    @IBAction func actionButton(button: UIButton){
        guard let viewProperties = self.viewProperties else { return }
        self.viewProperties?.didTapAction(viewProperties.inputAddressType)
    }
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> InputAddressCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! InputAddressCollectionCell
        return cell
    }
}
