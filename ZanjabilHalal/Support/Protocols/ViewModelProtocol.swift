//
//  ViewModelProtocol.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Combine
import Foundation
import MapKit

protocol MVVMViewModelProtocol where Self: AnyObject {
    
    associatedtype MainView: MVVMViewProtocol
    
    // MARK: - Основное View
    var mainView: MainView? { get set }
    
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

protocol MVVMViewProtocol {
    
    associatedtype ViewProperties
    
    var viewProperties: ViewProperties? { get set }
    
    func update(with viewProperties: ViewProperties?)
}

extension MVVMViewProtocol {
	
	// MARK: - Обновление текущих ViewProperties
	func reloadProperties() {
		self.update(with: self.viewProperties)
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

protocol MVVMViewModel where Self: AnyObject {
	
	associatedtype MainView: MVVMView
	
	// MARK: - Основное View
	var viewProperties: MainView.ViewProperties? { get set }
	
	init(with mainView: MainView)
}

extension MVVMViewModel {
	
	// MARK: - Привязываем View с ViewModel
	func bindView(with mainView: MainView) {
		mainView.updateViewProperties = { viewProperties in
			mainView.update(with: viewProperties)
		}
		mainView.createViewProperties = { viewProperties in
			mainView.create(with: viewProperties)
		}
	}
}

protocol MVVMView where Self: AnyObject {
	
	associatedtype ViewProperties
	
	var viewProperties: ViewProperties? { get set }
	
	var updateViewProperties: Closure<ViewProperties> { get set }
	var createViewProperties: Closure<ViewProperties> { get set }
	
	func update(with viewProperties: ViewProperties?)
	
	func create(with viewProperties: ViewProperties?)
}
