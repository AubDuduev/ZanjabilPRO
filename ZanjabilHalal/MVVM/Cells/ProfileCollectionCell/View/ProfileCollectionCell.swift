//
//  ProfileCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import UIKit

final class ProfileCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let profileCollectionCell: ProfileCollectionCellType
        let didAction            : Closure<ProfileCollectionCellType>
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameButton: UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setTitle()
        self.setName()
    }
    
    private func setTitle(){
        self.titleLabel.text = self.viewProperties?.profileCollectionCell.title()
    }
    
    private func setName(){
        self.nameButton.setTitle(self.viewProperties?.profileCollectionCell.name(), for: .normal)
    }
    
    //MARK: -
    @IBAction func actionButton(button: UIButton){
        guard let viewProperties = self.viewProperties else { return }
        self.viewProperties?.didAction(viewProperties.profileCollectionCell)
    }
    
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> ProfileCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! ProfileCollectionCell
        return cell
    }
}
