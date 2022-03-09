//
//  AppStyle.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation
import UIKit

class AppStyle:AppStyleProtocol{

        
    static func applyColors(type:AppViewStyleable){
        switch type {
        case .home(let controller):
            controller.viewSportsListButton.backgroundColor = ColorTypes.color(.colorPrimary)
        default : break
        }
    }
    
    static func styleForView(view:UIView, data:Any?=nil){
        
        AppStyling.defaultStyleForView(view: view, data: data)
    }
}
