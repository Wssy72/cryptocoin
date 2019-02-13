//
//  ViewController.swift
//  Cryptomoney
//
//  Created by apple on 08/02/2019.
//  Copyright © 2019 Sergey Yakovlev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    // ok, google123
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // request ("https://.response.JSON") { response in
// print(response)
        
    }

    class CryptoMoney {
    var id = 0
    var name : String = ""
    var price : Float = 0.0
    }
}

