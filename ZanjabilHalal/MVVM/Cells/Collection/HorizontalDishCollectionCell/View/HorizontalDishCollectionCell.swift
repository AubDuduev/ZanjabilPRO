//
//  HorizontalMenuCollectionCell.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 10.04.2022.
//
import UIKit

final class HorizontalDishCollectionCell: UICollectionViewCell, LoadNidoble, MVVMViewProtocol {
    
    struct ViewProperties {
        let dish                : DECDish
        let addCounterDishesView: ClosureTwo<UIView, DECDish>
        let addMenuPriceView    : ClosureTwo<UIView, DECDish>
        let addDishView         : ClosureTwo<UIView, DECDish>
    }
    public var viewProperties: ViewProperties?
    
    @IBOutlet private weak var previewImageView          : UIImageView!
    @IBOutlet private weak var nameLabel                 : UILabel!
    @IBOutlet private weak var descriptionLabel          : UILabel!
    @IBOutlet private weak var counterDishesContainerView: UIView!
    @IBOutlet private weak var addDishesContainerView    : UIView!
    @IBOutlet private weak var priceMenuContainerView    : UIView!
    @IBOutlet private weak var mainView                  : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.removeAddedView()
    }
    
    public func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.addedViews()
        self.setPreview()
        self.setName()
        self.setDescription()
    }
    
    private func removeAddedView(){
        self.counterDishesContainerView.subviews.forEach{ $0.removeFromSuperview() }
        self.addDishesContainerView.subviews.forEach    { $0.removeFromSuperview() }
        self.priceMenuContainerView.subviews.forEach    { $0.removeFromSuperview() }
    }
    
    private func setPreview(){
        guard let viewProperties = self.viewProperties else { return }
        let imageURL = viewProperties.dish.preview ?? ""
        let url = URL(string: imageURL)
        self.previewImageView.sd_setImage(with: url)
    }
    
    private func setName(){
        guard let viewProperties = self.viewProperties else { return }
        self.nameLabel.text = viewProperties.dish.name
    }
    
    private func setDescription(){
        guard let viewProperties = self.viewProperties else { return }
        self.descriptionLabel.text = viewProperties.dish.description
    }
    
    
    private func setup(){
        self.mainView.cornerRadius(32, true)
    }
    
    private func addedViews(){
        guard let viewProperties = self.viewProperties else { return }
        self.viewProperties?.addCounterDishesView(counterDishesContainerView, viewProperties.dish)
        self.viewProperties?.addMenuPriceView(priceMenuContainerView, viewProperties.dish)
        self.viewProperties?.addDishView(addDishesContainerView, viewProperties.dish)
    }
    
    // MARK: - create cell
    static func create(with collection: UICollectionView, with indexPath: IndexPath) -> HorizontalDishCollectionCell {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
        let cell = collection.dequeueReusableCell(withReuseIdentifier: String(describing: Self.self), for: indexPath) as! HorizontalDishCollectionCell
        return cell
    }
}
