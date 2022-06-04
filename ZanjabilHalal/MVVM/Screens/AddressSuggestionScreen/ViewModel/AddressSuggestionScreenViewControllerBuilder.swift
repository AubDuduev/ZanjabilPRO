//
//  AddressSuggestionScreenViewControllerBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 31.05.2022.
//
import Resolver
import UIKit

final class AddressSuggestionScreenViewControllerBuilder: BuilderViewProtocol {
	
	public var view     : AddressSuggestionScreenViewController
	public var viewModel: AddressSuggestionScreenViewModel
	
	public static func create() -> AddressSuggestionScreenViewControllerBuilder {
		let viewController = AddressSuggestionScreenViewController()
		let viewModel      = AddressSuggestionScreenViewModel(with: viewController)
		viewController.loadViewIfNeeded()
		viewModel.bindMainView(with: viewController)
		let selfBuilder = AddressSuggestionScreenViewControllerBuilder(with: viewController,
																	   with: viewModel)
		return selfBuilder
	}
	
	private init(with viewController: AddressSuggestionScreenViewController, with viewModel: AddressSuggestionScreenViewModel) {
		self.view      = viewController
		self.viewModel = viewModel
	}
}

