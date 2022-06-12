//
//  PayOrderCollectionCellViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.04.2022.
//
import UIKit
import Resolver

final class PayOrderCollectionCellViewModel: NSObject, MVVMViewModelProtocol {
    
    public var model: PayOrderCollectionCellModel? {
        didSet { self.logicPayOrderCollectionCellModel() }
    }
    //MARK: - implementation protocol
    public var mainView: PayOrderCollectionCell?
    public var isUpdate: ClosureEmpty?
    //DI
    @Injected
    private var createAddressService      : CreateAddressService
    @Injected
    private var mainCollectionViewsBuilder: MainCollectionViewsBuilder
    @Injected
    private var mainViewsBuilder          : MainViewsBuilder
    @Injected
    private var localBasketService        : LocalBasketService
    
    // MARK: - Private
    private var inputAddressCollectionViewModel: InputAddressCollectionViewModel!
    private var payInfoViewModel               : PayInfoViewModel!
	private var mapViewModel                   : MapViewModel!
    
    private func logicPayOrderCollectionCellModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let payOrderCollectionCells):
                
                let addView: Closure<UIView> = { container in
                    switch payOrderCollectionCells {
						case .map:
							self.model = .createMapViewModel(container)
                        case .inputOfAddress(let defaultAddress):
                            self.model = .createInputAddressCollectionViewModel(container, defaultAddress)
                        case .actionOfBuy:
                            print("")
                        case .payInfoCost:
                            self.model = .createPayInfoCostViewModel(container)
                        case .payInfoDelivery:
                            self.model = .createPayInfoDeliveryViewModel(container)
                        case .totalPrice:
                            self.model = .createPayInfoTotalPriceViewModel(container)
                    }
                }
                let viewProperties = PayOrderCollectionCell.ViewProperties(addView               : addView,
                                                                           payOrderCollectionCell: payOrderCollectionCells)
                self.updateMainView(with: viewProperties)
            case .createInputAddressCollectionViewModel(let container, let defaultAddress):
                self.inputAddressCollectionViewModel       = self.createInputAddressCollectionViewModel(with: container)
                self.inputAddressCollectionViewModel.model = .createViewProperties(defaultAddress, false)
            case .createPayInfoCostViewModel(let container):
                let totalPrice = self.localBasketService.getTotalPrice()
                self.payInfoViewModel = self.createInfoViewModel(with: container, with: .cost("\(totalPrice) ₽"))
            case .createPayInfoDeliveryViewModel(let container):
                self.payInfoViewModel = self.createInfoViewModel(with: container, with: .delivery("500 ₽"))
            case .createPayInfoTotalPriceViewModel(let container):
                let totalPrice = self.localBasketService.getTotalPrice()
                self.payInfoViewModel = self.createInfoViewModel(with: container, with: .total("\(totalPrice) ₽"))
			case .createMapViewModel(let container):
				self.mapViewModel = self.createMapViewModel(with: container)
				self.mapViewModel.model = .createViewProperties
				self.mapViewModel.model = .setupGeoPositioningService
        }
    }
    
    public func createInputAddressCollectionViewModel(with containerView: UIView) -> InputAddressCollectionViewModel {
        let createInputAddressCollectionViewBuilder = self.mainCollectionViewsBuilder.createInputAddressCollectionViewBuilder()
        let createInputAddressCollectionView        = createInputAddressCollectionViewBuilder.view
        containerView.addSubview(createInputAddressCollectionView)
        createInputAddressCollectionView.snp.makeConstraints { createInputAddressCollectionView in
            createInputAddressCollectionView.edges.equalToSuperview()
        }
        return createInputAddressCollectionViewBuilder.viewModel
    }
    
    public func createInfoViewModel(with containerView: UIView, with payInfoType: PayInfoCellTypes) -> PayInfoViewModel {
        let payInfoViewBuilder = self.mainViewsBuilder.createPayInfoViewBuilder()
        let payInfoView        = payInfoViewBuilder.view
        payInfoViewBuilder.viewModel.model = .createViewProperties(payInfoType)
        containerView.addSubview(payInfoView)
        payInfoView.snp.makeConstraints { payInfoView in
            payInfoView.edges.equalToSuperview()
        }
        return payInfoViewBuilder.viewModel
    }
	
	public func createMapViewModel(with containerView: UIView) -> MapViewModel {
		let mapViewBuilder = self.mainViewsBuilder.createMapViewBuilder()
		let mapView = mapViewBuilder.view
		containerView.addSubview(mapView)
		mapView.snp.makeConstraints { mapView in
			mapView.top.equalTo(containerView)
			mapView.leading.equalTo(containerView)
			mapView.trailing.equalTo(containerView)
			mapView.bottom.equalTo(containerView).inset(8)
		}
		return mapViewBuilder.viewModel
	}
    
    init(with mainView: PayOrderCollectionCell) {
        self.mainView = mainView
    }
}
