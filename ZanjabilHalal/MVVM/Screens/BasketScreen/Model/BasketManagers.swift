//
//  BasketManagers.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Foundation

final class BasketManagers {
   
   let configurator : ConfiguratorBasket!
   
   init(with viewModel: BasketViewModel) {

      self.configurator = ConfiguratorBasket(with: viewModel)
   }
}

