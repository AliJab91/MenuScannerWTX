//
//  AboutUsViewController.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/17/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var aboutUsLabel: UILabel!
    
    @IBOutlet weak var contactUsEmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsLabel.text = "WTX Hub is the blockchain eco-system of the Food & Beverage and Retail Industries.\nIncluding Peer to Peer Product Exchange, Trade Database and game changing blockchain distribution and retail technology. The eco-system is completed by a comprehensive social and community functionality along with tailor-made blockchain provenance authenticity and smart contract technology. Access WTX Hub and see into the window to the future of the Food & Beverage and Retail industries."
        contactUsEmailLabel.text = "Contact us : contact@wtxhub.com "
        // Do any additional setup after loading the view.
    }
    /*
 WTX Hub is the blockchain eco-system of the Food & Beverage and Retail Industries.  Including Peer to Peer Product Exchange, Trade Database and game changing blockchain distribution and retail technology. The eco-system is completed by a comprehensive social and community functionality along with tailor-made blockchain provenance authenticity and smart contract technology. Access WTX Hub and see into the window to the future of the Food & Beverage and Retail industries.
 */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
