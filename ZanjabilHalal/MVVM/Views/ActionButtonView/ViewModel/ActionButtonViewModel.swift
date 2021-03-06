//
//  ActionButtonViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 17.04.2022.
//
import Foundation
import Resolver
import Combine

final class ActionButtonViewModel: MVVMViewModelProtocol {
    
    public var model: ActionButtonModel? {
        didSet { self.stateActionButtonModel() }
    }
    // MARK: - DI
    @Injected
    private var createAddressService : CreateAddressService
    @Injected
    private var addressesService     : AddressesService
    @Injected
    private var testingAddressService: TestingAddressService
    @Injected
    private var warningService       : WarningService
    @Injected
    private var networkService       : NetworkService
    @Injected
    private var menuService          : MenuService
    @Injected
    private var ordersService        : OrdersService
	@Injected
	private var geoPositioningService: GeoPositioningService
	@Injected
	private var mainRouter           : MainRouter
    
    //MARK: - implementation protocol
    public var mainView: ActionButtonView?
    public var isUpdate: ClosureEmpty?
    // MARK: - Private
    private var listMenu        : [DECMenu] = []
    private var cancellable     : Set<AnyCancellable> = []
    private var actionButtonType: ActionButtonType!
    //MARK: - Main state view model
    private func stateActionButtonModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties(let actionButtonType):
                self.actionButtonType = actionButtonType
                self.subscriberMenu()
                let didAction: ClosureEmpty = { [weak self]  in
                    self?.model = .didTapButton
                }
                let viewProperties = ActionButtonView.ViewProperties(didAction       : didAction,
                                                                     actionButtonType: actionButtonType)
                self.mainView?.update(with: viewProperties)
            case .didTapButton:
                switch self.actionButtonType {
                    case .payOrder:
                        self.testingAddress() { [weak self] in
                            guard let self = self else { return }
                            self.ordersService.createOrder(with: self.listMenu)
                        }
                    case .saveAddress:
                        self.testingAddress() {
                            print("")
                        }
                    case .editAddress:
                        self.testingAddress() {
                            print("")
                        }
					case .addAddress:
						self.createAddressService.createForYandexAddressSuggestion()
						self.saveAddress { [weak self] in
							guard let self = self else { return }
							self.mainRouter.popMainNavigation(id: .payOrderVC, animated: true)
						}
                    default:
                        break
                }
        }
    }
    
    private func subscriberMenu(){
        self.menuService.subscribeUpdateMenu
            .sink { listMenu in
                self.listMenu = listMenu
            }
            .store(in: &cancellable)
    }
	
	private func saveAddress(executeSaving: @escaping ClosureEmpty){
		
		//???????????????????? ????????????
		self.addressesService.defaultAddress() {
			executeSaving()
		}
	}
    
    private func testingAddress(executeTesting: @escaping ClosureEmpty){
        let createAddressModel = self.createAddressService.createAddressModel
        //????????????????
        if let warningTextType = self.testingAddressService.testing(with: createAddressModel) {
            self.warningService.present(with: warningTextType, dismiss: true)
            return
        }
		
		self.saveAddress {
			executeTesting()
		}
    }

    init(with mainView: ActionButtonView) {
        self.mainView = mainView
    }
}
