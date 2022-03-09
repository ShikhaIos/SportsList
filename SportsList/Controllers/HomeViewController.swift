//
//  HomeViewController.swift
//  SportsList
//
//  Created by shikha on 08/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var viewSportsListButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        styleUI()
        viewSportsListButton.accessibilityIdentifier = "viewSportsListButton"

        // Do any additional setup after loading the view.
    }
    /// For styling UI
    /// Call method of appstyle
    func styleUI(){
        AppStyling.applyStyling(.home(view: self))
    }
    
    ///Button Action methods
   ///For Sports lists

   @IBAction func btn_view_sports_list_action(_ sender: Any) {
       let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SportsListViewController") as? SportsListViewController
       self.navigationController?.pushViewController(vc!, animated: true)
   }
    

}
