//
//  ErrorExtension.swift
//  POP Networking
//
//  Created by vinsol on 5/11/18.
//  Copyright © 2018 vinsol. All rights reserved.
//

import Foundation


extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
