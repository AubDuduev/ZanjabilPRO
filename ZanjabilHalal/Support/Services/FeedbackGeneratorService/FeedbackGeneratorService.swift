//
//  GDFeedbackGenerator.swift
//  wallet
//
//  Created by Senior Developer on 24.05.2021.
//  Copyright © 2021 zamzam. All rights reserved.
//
import AudioToolbox
import UIKit

final class FeedbackGeneratorService {

   public func vibration(intensity: CGFloat = 1, style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
      let generator = UIImpactFeedbackGenerator(style: style)
      generator.impactOccurred(intensity: intensity)
   }

   public func vibrationCustom() {
      AudioServicesPlaySystemSound(1519)
   }

   public func vibrationLong() {
      let result = SystemSoundID(kSystemSoundID_Vibrate)
      AudioServicesPlayAlertSound(result)
   }
    
}
