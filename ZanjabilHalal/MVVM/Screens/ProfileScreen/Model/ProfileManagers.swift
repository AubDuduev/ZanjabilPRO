//
//  ProfileManagers.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import Foundation

final class ProfileManagers {
   
   let configurator : ConfiguratorProfile!
   
   init(with viewModel: ProfileViewModel) {
      
      self.configurator = ConfiguratorProfile(with: viewModel)
   }
}

