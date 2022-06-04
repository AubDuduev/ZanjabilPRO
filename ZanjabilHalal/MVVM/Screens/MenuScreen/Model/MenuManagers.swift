//
//  MenuManagers.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 06.03.2022.
//
import Foundation

final class MenuManagers {
    
    let configurator : ConfiguratorMenu!
    
    init(with viewModel: MenuViewModel) {
        self.configurator = ConfiguratorMenu(with: viewModel)
    }
}

