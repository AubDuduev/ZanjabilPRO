//
//  URLFirebaseRestaurants.swift
//  ZanjabilHalal
//
//  Created by Senior Developer on 13.03.2022.
//
import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore
import Foundation

final class URLFirebaseRestaurants: URLCreateFirebaseProtocol {
    
    private var firestore  = Firestore.firestore()
    private var urlPath    = URLPath()
    private var urls       = URLStaticString()
    private var host       = URLHostService()
    private var urlScheme  = URLSchemeService()
    private var custom     = URLCreateService()
    private var parameters = URLParameters()
    
    public func create(with data: Any? = nil) -> ReturnFirebaseURL? {
        let collectionReference = firestore.collection("Restaurants").document("galata").collection("menu")
        return (collectionReference, nil)
    }
}
