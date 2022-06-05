//
//  AddressSuggestionsTableViewModel.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//
import Resolver
import UIKit

final class AddressSuggestionsTableViewModel: MVVMViewModelProtocol {
    
    public var model: AddressSuggestionsTableModel? {
        didSet { self.stateModel() }
    }
    
    //MARK: - implementation protocol
    public var mainView: AddressSuggestionsTableView?
    //DI
    @Injected
    private var mainCellsBuilder: MainCellsBuilder
    
    //MARK: - Main state view model
    private func stateModel(){
        guard let model = self.model else { return }
        switch model {
            case .createViewProperties:
                print("")
        }
    }
    
    init(with mainView: AddressSuggestionsTableView) {
        self.mainView = mainView
    }
}
