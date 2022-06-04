//
//  BuilderMap.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 22.05.2022.
//
import Resolver
import UIKit

final class MapScreenViewControllerBuilder: BuilderViewProtocol {
	
	public var view     : MapScreenViewController
	public var viewModel: MapScreenViewModel
	
	public static func create() -> MapScreenViewControllerBuilder {
		let viewController = MapScreenViewController()
		let viewModel      = MapScreenViewModel(with: viewController)
		viewController.loadViewIfNeeded()
		viewModel.bindMainView(with: viewController)
		let selfBuilder = MapScreenViewControllerBuilder(with: viewController,
														 with: viewModel)
		return selfBuilder
	}
	
	private init(with viewController: MapScreenViewController, with viewModel: MapScreenViewModel) {
		self.view      = viewController
		self.viewModel = viewModel
	}
}

