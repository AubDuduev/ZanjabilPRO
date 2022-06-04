//
//  ChangeCurrentCategoryService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 09.05.2022.
//
import Foundation
import Combine

final class ChangeCurrentCategoryService: ServiceProtocol {
	
	private var menuList      : [DECMenu]    = []
	private var choiceCategory: DECCategory?
	
	public var didTapCategory       : Closure<DECCategory>?
	public var subscribeUpdateState = PassthroughSubject<IndexPath, Never>()
	
	public func set(with category: DECCategory, indexPath: IndexPath) {
		self.choiceCategory = category
		self.didTapCategory?(category)
		self.subscribeUpdateState.send(indexPath)
	}
	
	public func setFirst(with menuList: [DECMenu]) {
		guard self.menuList.isEmpty else { return }
		self.menuList = menuList
		if let choiceCategory = menuList.first?.category {
			self.choiceCategory = choiceCategory
			self.didTapCategory?(choiceCategory)
			let indexPath = IndexPath(item: 0, section: 0)
			self.subscribeUpdateState.send(indexPath)
		}
	}
	
	public func get(with category: DECCategory) -> CategoryState {
		guard let choiceCategory = choiceCategory else { return .none }
		if choiceCategory.name == category.name {
			return .choice
		} else {
			return .none
		}
	}
}
