//
//  DelayTaskService.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 05.06.2022.
//

import Foundation

final class DelayTaskService {
	
	private let queue = OperationQueue()
	public var execute: ClosureEmpty!
	
	public func deleteAfter(seconds: Double) {
		self.cancelDelete()
		let date = Date(timeIntervalSinceNow: seconds)
		self.queue.schedule(after: .init(date)) { [weak self] in
			guard let self = self else { return }
			DispatchQueue.main.async { [weak self] in
				guard let self = self else { return }
				self.execute()
			}
		}
	}
	
	private func cancelDelete() {
		queue.cancelAllOperations()
	}
}
