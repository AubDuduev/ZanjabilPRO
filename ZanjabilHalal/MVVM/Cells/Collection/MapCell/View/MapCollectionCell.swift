//
//  MapCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import UIKit

final class MapCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
       
    }
    var viewProperties: ViewProperties?
	
	//@IBOutlet weak private var mapView: YMKMapView!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> MapCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! MapCollectionCell
        return cell
    }
	// MARK: - create view
	static func create() -> MapCollectionCell {
		let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! MapCollectionCell
		return view
	}
}
