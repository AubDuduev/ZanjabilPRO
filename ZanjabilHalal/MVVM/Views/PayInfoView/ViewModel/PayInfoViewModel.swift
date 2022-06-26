//
//  PayInfoViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 16.04.2022.
//
import Resolver
import Foundation
import Combine

final class PayInfoViewModel: MVVMViewModelProtocol {
    
    public var model: PayInfoModel? {
        didSet { self.statePayInfoModel() }
    }
	@Injected
	private var yandexDeliveryService: YandexDeliveryService
    //MARK: - implementation protocol
    public var mainView   : PayInfoView?
    public var isUpdate   : ClosureEmpty?
	// MARK: - Private
	private var cancelable: Set<AnyCancellable> = []
    
    //MARK: - Main state view model
    private func statePayInfoModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let payInfoCellTypes):
				switch payInfoCellTypes {
					case .delivery:
						self.model = .getDeliveryPrice
					default:
						break
				}
                let viewProperties = PayInfoView.ViewProperties(payInfoCellTypes: payInfoCellTypes)
                self.updateMainView(with: viewProperties)
			case .getDeliveryPrice:
				self.yandexDeliveryService.getPrice()
				self.yandexDeliveryService.completionPrice.sink { [weak self] price in
					guard let self = self else { return }
					self.model = .updateViewProperties(price)
				}
				.store(in: &self.cancelable)
            case .updateViewProperties(let info):
				self.mainView?.viewProperties?.payInfoCellTypes = .delivery("\(info) ₽")
				self.reloadProperties()
        }
    }
    
    init(with mainView: PayInfoView) {
        self.mainView = mainView
    }
}
