//
//  AppStyleProtocol.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation
import UIKit

protocol AppStyleProtocol {

    static func applyColors(type:AppViewStyleable)

}

extension AppStyleProtocol{
    
    static func styleForView(view:UIView, data:Any?=nil){
        AppStyling.defaultStyleForView(view: view, data: data)
    }
}
