//
//  BuilderChangeUserName.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
import Resolver
import UIKit

final class ChangeUserNameViewControllerBuilder: BuilderViewProtocol {
	
	public var view     : ChangeUserNameViewController
	public var viewModel: ChangeUserNameViewModel
	
	public static func create() -> ChangeUserNameViewControllerBuilder {
		let viewController = ChangeUserNameViewController()
		let viewModel      = ChangeUserNameViewModel(with: viewController)
		viewController.loadViewIfNeeded()
		viewModel.bindMainView(with: viewController)
		let selfBuilder = ChangeUserNameViewControllerBuilder(with: viewController,
															  with: viewModel)
		return selfBuilder
	}
	
	private init(with viewController: ChangeUserNameViewController, with viewModel: ChangeUserNameViewModel) {
		self.view      = viewController
		self.viewModel = viewModel
	}
}

