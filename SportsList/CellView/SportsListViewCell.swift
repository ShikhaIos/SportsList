//
//  SportsListViewCell.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import UIKit
import SDWebImage

class SportsListViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var cellViewdataProviderModel: SportsCellViewModel? {
        didSet {
            nameLabel.text = "Name : " + (cellViewdataProviderModel?.attributes?.name ?? "")
            descriptionLabel.text = cellViewdataProviderModel?.attributes?.description
            if let count = cellViewdataProviderModel?.relationShips?.images?.data.count {
                if count > 0 {
                    iconView.downloadImage(url: cellViewdataProviderModel?.relationShips?.images?.data[0].url ?? "")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initalise()
        StyleUI()
    }
    func StyleUI() {
        AppStyle.styleForView(view: self, data: cellViewdataProviderModel)
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initalise() {
        // Cell view customization
        backgroundColor = .clear

        // Line separator full width
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        descriptionLabel.text = nil
        iconView.image = nil
        
    }
    

}

