
import Foundation
import FirebaseAuth
import FirebaseFirestore

//MARK:- RESULTS CLOSURE
public typealias ClosurePictureSession = ((PictureSessionResult) -> Void)
public typealias ClosureServerResult   = ((ServerResult) -> Void)
public typealias ClosureDecode         = ((DecodeResult) -> Void)
public typealias ClosureSession        = ((SessionResult) -> Void)
public typealias ClosureSessionData    = ((SessionDataResult) -> Void)
public typealias ClosureRequest        = ((RequestResult) -> Void)
public typealias ClosureResultFB       = ((FirebaseResult) -> Void)

//MARK: - CLOUSURES
public typealias ClosureReturn<T> = (() -> T)
public typealias Closure<T>       = ((T) -> Void)
public typealias ClosureEmpty     = (() -> Void)
public typealias ClosureTwo<T, G> = ((T, G) -> Void)
public typealias ClosureAny       = ((Any?) -> Void)


//MARK: - CUSTOM TYPE
public typealias Header            = [String: String]
public typealias ReturnURL         = (string: String?, URL: URL?)
public typealias ReturnFirebaseURL = (url: CollectionReference?, doc: DocumentReference?)


