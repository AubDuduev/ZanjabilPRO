//
//  AddressCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

final class AddressCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
		let addressCollectionType: AddressCollectionType
        let address              : DECAddress
        let didTapEditAddress    : Closure<DECAddress>
        let didTapDeleteAddress  : Closure<DECAddress>
        let didTapCellAddress    : Closure<DECAddress>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var mainView    : UIView!
    @IBOutlet weak var deleteView  : UIView!
    @IBOutlet weak var editView    : UIView!
    @IBOutlet weak var streetLebel : UILabel!
    @IBOutlet weak var cityLebel   : UILabel!
    @IBOutlet weak var editButton  : UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupMainView()
        self.setupEditView()
        self.setupDeleteView()
    }
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setAddressData()
        self.setupColorIconView()
    }
	
    private func setupColorIconView(){
        guard let viewProperties = self.viewProperties else { return }
        let isDefault      = viewProperties.address.isDefault
        let color: UIColor = isDefault ? .set(.greenFore) : .clear
        self.mainView.borderColor(color, 1)
    }
	
    private func setAddressData(){
        guard let viewProperties = self.viewProperties else { return }
        let title    = "\(viewProperties.address.street) \(viewProperties.address.build), \(viewProperties.address.apartment)"
        let subtitle = viewProperties.address.city
        self.streetLebel.text = title
        self.cityLebel.text   = subtitle
    }
	
    private func setupEditView(){
		guard let viewProperties = self.viewProperties else { return }
		self.editView.isHidden = viewProperties.addressCollectionType.isHiddenButton()
        self.editView.cornerRadius(20, true)
    }
    
    private func setupDeleteView(){
		guard let viewProperties = self.viewProperties else { return }
		self.deleteView.isHidden = viewProperties.addressCollectionType.isHiddenButton()
        self.deleteView.cornerRadius(20, true)
    }
    
    private func setupMainView(){
        self.mainView.cornerRadius(8, true)
    }
    
    @IBAction func didTapEditButton(button: UIButton){
        guard let address = self.viewProperties?.address else { return }
        self.viewProperties?.didTapEditAddress(address)
    }
   
    @IBAction func didTapDeleteButton(button: UIButton){
        guard let address = self.viewProperties?.address else { return }
        self.viewProperties?.didTapDeleteAddress(address)
    }
   
    @IBAction func didTapCellButton(button: UIButton){
        guard let address = self.viewProperties?.address else { return }
        self.viewProperties?.didTapCellAddress(address)
    }
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AddressCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! AddressCollectionCell
        return cell
    }
}
