//
//  DishCategoryCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class DishCategoryCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let category      : DECCategory?
		let didTapCategory: ClosureTwo<DECCategory, IndexPath>?
		let indexPath     : IndexPath
		var categoryState : CategoryState
    }
    var viewProperties: ViewProperties?
    
    // MARK: - Outlets
    @IBOutlet weak private var imageImageView: UIImageView!
    @IBOutlet weak private var nameButton    : UIButton!
	@IBOutlet weak private var nameLabel     : UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.cornerRadius(8, true)
        self.setupImage()
    }
	override func prepareForReuse() {
		super.prepareForReuse()
		self.setPrepareForReuse()
	}
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
		self.setTitle()
		self.setImage()
		self.setupImage()
		self.setChoiceCategory()
    }
    private func setupImage(){
        let renderingImage            = self.imageImageView.image?.withRenderingMode(.alwaysTemplate)
        self.imageImageView.image     = renderingImage
        self.imageImageView.tintColor = .set(.greenFore)
    }
	private func setTitle(){
		let name = viewProperties?.category?.name ?? ""
		self.nameLabel.text = name
	}
    private func setTitleButton(){
        let name = viewProperties?.category?.name ?? ""
        self.nameButton.setTitle(name, for: .normal)
    }
	private func setChoiceCategory(){
		guard let viewProperties = self.viewProperties else { return }
		self.imageImageView.tintColor = viewProperties.categoryState.color()
		self.nameLabel.textColor      = viewProperties.categoryState.color()
	}
	private func setPrepareForReuse(){
		self.imageImageView.tintColor = .white
		self.nameLabel.textColor      = .white
	}
    private func setImage(){
        guard let viewProperties = self.viewProperties else { return }
        let imageURL = viewProperties.category?.image ?? ""
        let url = URL(string: imageURL)
        self.imageImageView.sd_setImage(with: url)
    }
	//MARK: -
	@IBAction func didTapCategoryButton(button: UIButton){
		guard let category  = self.viewProperties?.category else { return }
		guard let indexPath = self.viewProperties?.indexPath else { return }
		self.viewProperties?.didTapCategory?(category, indexPath)
	}
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> DishCategoryCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! DishCategoryCollectionCell
        return cell
    }
}


