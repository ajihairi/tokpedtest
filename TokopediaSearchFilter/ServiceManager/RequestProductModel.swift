//
//  RequestProductModel.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation

struct RequestProductModel {
    var q = "samsung"
    var pmin = "10000"
    var pmax = "100000"
    var wholesale = "true"
    var official = "true"
    var fshop = "2"
    var start = "0"
    var rows = "10"
    
    func toDictionary() -> [String: Any] {
        
        let dictionary = ["q": q,
                          "pmin": pmin,
                          "pmax": pmax,
                          "wholesale": wholesale,
                          "official": official,
                          "fshop": fshop,
                          "start": start,
                          "rows": rows] as [String : Any]
        
        return dictionary
    }
    
    static func defaultRequest() -> RequestProductModel {
        
        let model = RequestProductModel(q: "samsung",
                                        pmin: "10000",
                                        pmax: "100000",
                                        wholesale: "true",
                                        official: "true",
                                        fshop: "2",
                                        start: "0",
                                        rows: "10")
        
        return model
    }
}
