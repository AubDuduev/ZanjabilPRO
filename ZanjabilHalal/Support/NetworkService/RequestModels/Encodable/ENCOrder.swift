//
//  ENCOrder.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 03.04.2022.
//
import Foundation

struct ENCOrder: Encodable {
    
    let createDate: Date
    let dishes    : [ENCDish]
}
