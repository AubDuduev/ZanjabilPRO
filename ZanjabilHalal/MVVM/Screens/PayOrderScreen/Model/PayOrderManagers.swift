//
//  PayOrderManagers.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 27.03.2022.
//
import Foundation

final class PayOrderManagers {
   
   let configurator : ConfiguratorPayOrder!
 
   init(with viewModel: PayOrderViewModel) {
      
      self.configurator = ConfiguratorPayOrder(with: viewModel)
   }
}

