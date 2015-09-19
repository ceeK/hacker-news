//
//  File.swift
//  Hacker News
//
//  Created by Chris Howell on 18/09/2015.
//  Copyright © 2015 Chris Howell. All rights reserved.
//

import Foundation
import ObjectMapper

protocol Fetchable {
    var identifier: Int! { get set }
    func fetch()
}

struct Faultable<T: Fetchable> : Fetchable, CustomStringConvertible {
    var identifier: Int!
    var obj: T? = nil {
        didSet {
            needsFetch = false
        }
    }

    var needsFetch: Bool = true
    
    // MARK: Public methods
    init(identifier: Int) {
        self.identifier = identifier
    }
    
    // MARK: Fetchable
    
    internal func fetch() {
        obj?.fetch()
    }
    
    // MARK: CustomStringConvertible
    
    internal var description: String = {
        return "<temp>"
    }()
}

class FaultableTransformer<T: Fetchable> : TransformType {
    typealias Object = Faultable<T>
    typealias JSON = Int
    
    func transformFromJSON(value: AnyObject?) -> Object? {
        guard let value = value as? Int else {
            return nil
        }
        
        let faultable = Faultable<T>(identifier: value)
        return faultable
    }
    
    func transformToJSON(value: Object?) -> JSON? {
        return value?.identifier
    }
}