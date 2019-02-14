//
//  ViewController.swift
//  Cryptomoney
//
//  Created by apple on 08/02/2019.
//  Copyright © 2019 Sergey Yakovlev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    // ok, google123
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://sandbox.coinmarketcap.com"
        
        request(url).responseJSON { response in
            
            print(response)
        }
        print("viewDidLoad ended")
    }
}
    //class CryptoMoney {
    //var id = 0
    //var name : String = ""
    //var price : Float = 0.0
    //}



