//
//  ViewModelProtocol.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation
import MapKit

protocol MVVMViewModelProtocol where Self: AnyObject {
    
    associatedtype MainView: MVVMViewProtocol
    
    // MARK: - Основное View
    var mainView: MainView?     { get set }
    
    // MARK: - Обновление ViewProperties Views связанных с основной View привязаной к ViewModel
    func updateAnyView<ViewProperties>(with viewProperties: ViewProperties?)
    // MARK: - Обновление ViewProperties основного View привязаного к ViewModel
    func updateMainView(with viewProperties: MainView.ViewProperties?)
    
    init(with mainView: MainView) 
}

extension MVVMViewModelProtocol {
    // MARK: - Привязываем View с ViewModel
    func bindMainView(with mainView: MainView) {
        self.mainView = mainView
    }
    // MARK: - Обновление ViewProperties основного View привязаного к ViewModel
    func updateMainView(with viewProperties: MainView.ViewProperties?) {
        self.mainView?.update(with: viewProperties)
    }
    // MARK: - Обновление текущих ViewProperties
    func reloadProperties() {
        let viewProperties = mainView?.viewProperties
        self.updateMainView(with: viewProperties)
    }
    
    func updateAnyView<ViewProperties>(with viewProperties: ViewProperties?) {
        
    }
}

protocol MVVMViewProtocol where Self: AnyObject {
    
    associatedtype ViewProperties
    
    var viewProperties: ViewProperties? { get set }
    
    func update(with viewProperties: ViewProperties?)
	
	func create(with viewProperties: ViewProperties?)
}

extension MVVMViewProtocol {
	
	// MARK: - Обновление текущих ViewProperties
	func reloadProperties() {
		self.update(with: self.viewProperties)
	}
	
	func create(with viewProperties: ViewProperties?) {
		self.viewProperties = viewProperties
	}
}

protocol BuilderViewProtocol: AnyObject {
    
    associatedtype ViewModel: MVVMViewModelProtocol
    associatedtype View     : MVVMViewProtocol
    
    var viewModel: ViewModel { get set }
    var view     : View      { get set }
    
}

extension BuilderViewProtocol {
    
}
