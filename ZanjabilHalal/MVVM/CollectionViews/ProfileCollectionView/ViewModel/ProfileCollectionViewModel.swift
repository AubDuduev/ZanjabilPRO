//
//  ProfileCollectionViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.04.2022.
//
import Resolver
import UIKit
import Combine

final class ProfileCollectionViewModel: MVVMViewModelProtocol {
    
    public var model: ProfileCollectionModel? {
        didSet { self.stateProfileModel() }
    }
    //MARK: - implementation protocol
    public var mainView: ProfileCollectionView?
    public var isUpdate: ClosureEmpty?
    //DI
    @Injected
    private var mainCellsBuilder     : MainCollectionCellsBuilder
    @Injected
    private var addressesService     : AddressesService
	@Injected
	private var changeUserNameService: ChangeUserNameService
    // MARK: - Private
    private var cancelable    : Set<AnyCancellable> = []
    private var addresses     : [DECAddress]!
    private var defaultAddress: DECAddress?
	private var userFirstName : String = .init()
    //MARK: - Main state view model
    private func stateProfileModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
				self.userFirstName = self.changeUserNameService.getName() ?? "Введите Ваше имя"
				self.changeUserNameService.updateUserName.sink { [weak self] userName in
					guard let self = self else { return }
					self.userFirstName = userName
					self.model = .updateUserName
				}.store(in: &cancelable)
                let profileCollectionCells: [ProfileCollectionCellType] = [.avatar, .name(self.userFirstName), .orders("Мои заказы"), .addresses(self.defaultAddress)]
				let viewProperties = ProfileCollectionView.ViewProperties(profileCollectionCells: profileCollectionCells,
																		  updateRow: {_ in })
                self.mainView?.update(with: viewProperties)
			case .updateUserName:
				let indexPathUserName = IndexPath(row: 1, section: 0)
				let profileCollectionCells: [ProfileCollectionCellType] = [.avatar, .name(self.userFirstName), .orders("Мои заказы"), .addresses(self.defaultAddress)]
				let viewProperties = ProfileCollectionView.ViewProperties(profileCollectionCells: profileCollectionCells,
																		  updateRow: {_ in })
				self.mainView?.update(with: viewProperties)
				mainView?.viewProperties?.updateRow(indexPathUserName)
            case .getAddress:
                self.addressesService.subscribeUpdate.sink { addresses in
                    self.addresses = addresses
                    self.defaultAddress = addresses.first(where: { $0.isDefault })
                    self.model = .createViewProperties
                }
                .store(in: &cancelable)
                self.addressesService.getAddresses()
        }
    }
    
    init(with mainView: ProfileCollectionView) {
        self.mainView = mainView
    }
}
