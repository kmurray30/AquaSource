//
//  Singelton.swift
//  Camera Fun
//
//  Created by Kyle Murray on 10/23/16.
//  Copyright © 2016 Kyle Murray. All rights reserved.
//

import Foundation

class Singleton {
    var bluePercent : Float = 0
    var greenPercent : Float = 0
    var spectrumList : [Any] = []
    
//    fileprivate static var instance : Singleton? = nil
//    
//    static func getInstance() -> Singleton {
//        if instance == nil {
//            instance = Singleton()
//        }
//        return instance!
//    }
//    
//    fileprivate init() {
//        
//    }
    
    static let getInstance : Singleton = {
        let instance = Singleton()
        return instance
    }()
    
    init() {
        
    }
}
