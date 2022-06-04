//
//  ProfileCollection.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import UIKit
import Resolver

final class ProfileCollection: NSObject {

    @Injected
    private var mainCellsBuilder  : MainCellsBuilder

    var viewProperties: ProfileCollectionView.ViewProperties?

    func update(with viewProperties: ProfileCollectionView.ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
//MARK: - Delegate CollectionView
extension ProfileCollection: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
//MARK: - DataSource CollectionView
extension ProfileCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewProperties?.profileCollectionCells.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let profileCollectionCells = viewProperties!.profileCollectionCells[indexPath.row]
        switch profileCollectionCells {
            case .avatar:
                let collectionCellBuilder = self.mainCellsBuilder.createAvatarCollectionCellBuilder(with: collectionView, with: indexPath)
                collectionCellBuilder.viewModel.model = .createViewProperties(profileCollectionCells)
                return collectionCellBuilder.view
            default:
                let collectionCellBuilder = self.mainCellsBuilder.createProfileCollectionCellBuilder(with: collectionView, with: indexPath)
                collectionCellBuilder.viewModel.model = .createViewProperties(profileCollectionCells)
                return collectionCellBuilder.view
        }
    }
}
//MARK: - DelegateFlowLayout  CollectionView
extension ProfileCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let profileCollectionCell = self.viewProperties!.profileCollectionCells[indexPath.row]
        switch profileCollectionCell {
            case .avatar:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 60
                return .init(width: width, height: height)
            default:
                let width : CGFloat = collectionView.bounds.width
                let height: CGFloat = 55
                return .init(width: width, height: height)
        }
    }
}
