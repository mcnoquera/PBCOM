//
//  NetworkService.swift
//  PBCOM Mobile
//
//  Created by Mark Angelo Noquera on 6/16/16.
//  Copyright © 2016 Mark Angelo Noquera. All rights reserved.
//

import UIKit

class NetworkService: NSObject {
    
    typealias ResultBlock = (response: AnyObject?, isSucceed: Bool?) -> Void
    let defaultErrorMessage = "Something went wrong!"
    
    enum HTTPMethod {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    //MARK: Request Services
    func requestService(url: String, params parameters: [String: AnyObject]?, withBlock block: ResultBlock) {
        
    }
    
    //MARK: Network Utils
    func showNetworActivityIndicator(bool: Bool) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = bool
    }
    
    

}
