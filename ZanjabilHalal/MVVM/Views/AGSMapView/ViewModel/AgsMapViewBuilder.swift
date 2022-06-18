//
//  AgsMapViewViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 18.06.2022.
//
import Resolver
import UIKit

final class AgsMapViewBuilder: BuilderViewProtocol {
	
	public var view     : AgsMapView
	public var viewModel: AgsMapViewViewModel
	
	public static func create() -> AgsMapViewBuilder {
		let view      = AgsMapView.create()
		let viewModel = AgsMapViewViewModel(with: view)
		viewModel.bindMainView(with: view)
		let selfBuilder = AgsMapViewBuilder(with: view,
												with: viewModel)
		return selfBuilder
	}
	
	private init(with view: AgsMapView, with viewModel: AgsMapViewViewModel) {
		self.view      = view
		self.viewModel = viewModel
	}
}

