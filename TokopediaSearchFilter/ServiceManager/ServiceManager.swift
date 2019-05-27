//
//  File.swift
//  TokopediaSearchFilter
//
//  Created by Hamzhya Tinnov on 2/6/18.
//  Copyright © 2019 Hamzhya Tinnov. All rights reserved.
//

import Foundation
import Alamofire

private enum Constants {
    static let Base_Url = "https://ace.tokopedia.com/search/v2.5/product"
}

typealias OnSuccess = ([String: Any]) -> Void
typealias OnFailure = (Error) -> Void

final class ServiceManager {
    
    static let shared = ServiceManager()
    fileprivate var params = [String: Any]()
    
    func requestProduct(withRequestProductModel model: RequestProductModel,
                        onSuccess: OnSuccess?,
                        onFailure: OnFailure?) {
        
        let params = model.toDictionary()
        let url = convertBaseUrl(withParams: params)
        
        debugPrint("url", url)
        
        Alamofire.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
                switch response.result {
                    
                case .failure(let error):
                    
                    onFailure?(error)
                    
                case .success:
                    
                    if let value = response.value {
                        onSuccess?(["data": value])
                    }
                    
                    
                }
                
        }
        
    }
    
    fileprivate func convertBaseUrl(withParams params: [String: Any]) -> String {
        var baseUrl = Constants.Base_Url
        
        for key in params.keys {
            if baseUrl.range(of: "?") == nil {
                baseUrl += "?"
            }
            
            var paramString = params[key] as? String
            
            if paramString == nil {
                paramString = (params[key] as? NSNumber)?.stringValue
            }
            
            if paramString == "" || paramString == "(null)" {
                continue
            }
            
            baseUrl += String(format: "%@=%@&", key, paramString!)
        }
        
        if baseUrl.last == "&" {
            baseUrl = String(baseUrl.dropLast())
        }
        
        return baseUrl
    }
    
}
