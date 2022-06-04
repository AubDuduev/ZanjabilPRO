//
//  AvatarCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 23.04.2022.
//
import UIKit

final class AvatarCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let profileCollectionCell: ProfileCollectionCellType
    }
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setAvatar()
    }
    
    private func setAvatar(){
        
    }
    
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> AvatarCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! AvatarCollectionCell
        return cell
    }
}
