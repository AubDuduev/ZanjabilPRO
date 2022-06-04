//
//  MapViewBuilder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.05.2022.
//
import Resolver
import UIKit

final class MapViewBuilder: BuilderViewProtocol {
	
	public var view     : MapView
	public var viewModel: MapViewModel
	
	public static func create() -> MapViewBuilder {
		let view      = MapView.create()
		let viewModel = MapViewModel(with: view)
		viewModel.bindMainView(with: view)
		let selfBuilder = MapViewBuilder(with: view,
										 with: viewModel)
		return selfBuilder
	}
	
	private init(with view: MapView, with viewModel: MapViewModel) {
		self.view      = view
		self.viewModel = viewModel
	}
}

