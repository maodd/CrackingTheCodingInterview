//
//  SwiftFile.swift
//  Interview
//
//  Created by Shawn Webster on 8/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

@objc class TestClass : NSObject {
    
    @objc let string : String = "something"
    
//    override class func new() -> TestClass {
//        return TestClass()
//    }
    
    func doSomething() {
        print("doing something")
    }
    
    @objc func returnSomething() -> String {
        return "returning something"
    }
    
}
