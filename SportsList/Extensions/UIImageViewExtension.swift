//
//  UIImageViewExtension.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    func downloadImage(url:String){
        //remove space if a url contains.
        let stringWithoutWhitespace = url.replacingOccurrences(of: " ", with: "%20", options: .regularExpression)
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: URL(string: stringWithoutWhitespace), placeholderImage: UIImage())
    }
    
}
