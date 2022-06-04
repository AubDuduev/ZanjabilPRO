//
//  InfoAlertView.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import UIKit

final class InfoAlertView: UIView, MVVMViewProtocol {
    
    struct ViewProperties {
        let infoAlertDescriptionType: InfoAlertDescriptionType
    }
    var viewProperties: ViewProperties?
    
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var mainView        : UIView!
    @IBOutlet weak private var actionButton    : UIButton!
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
        self.setDescription()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupMainView()
        self.setupActionButton()
    }
    
    private func setupMainView(){
        self.mainView.cornerRadius(radius: 32, direction: .top, clipsToBounds: true)
    }
    
    private func setupActionButton(){
        self.actionButton.cornerRadius(radius: 21, direction: .allCorners, clipsToBounds: true)
    }
    
    private func setDescription(){
        self.descriptionLabel.text = self.viewProperties?.infoAlertDescriptionType.text()
    }
    
    // MARK: - create view
    static func create() -> InfoAlertView {
        let view = Bundle.main.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first as! InfoAlertView
        return view
    }
}
