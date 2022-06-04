//
//  DefaultAddressCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 01.05.2022.
//
import UIKit

final class DefaultAddressCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let didAction: ClosureEmpty
        var isDefault: Bool
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var actionButton   : UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setCheckmark()
    }
    func setCheckmark() {
        guard let viewProperties = self.viewProperties else { return }
        let square    = UIImage.setSystem(.checkmark)
        let checkmark = UIImage.setSystem(.square)
        let image     = viewProperties.isDefault ? square : checkmark
        print(viewProperties.isDefault)
        self.checkmarkButton.setImage(image, for: .normal)
    }
    @IBAction func didActionButton(button: UIButton){
        self.viewProperties?.didAction()
    }
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> DefaultAddressCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! DefaultAddressCollectionCell
        return cell
    }
}
