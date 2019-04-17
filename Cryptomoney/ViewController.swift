//
//  ViewController.swift
//  Cryptomoney
//
//  Created by apple on 08/02/2019.
//  Copyright © 2019 Sergey Yakovlev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items = [Cryptocurrency]()
    
    @IBAction func Update(_ sender: UIButton) {
    }
    
    @IBOutlet weak var tableViewMoney: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is viewDidLoad")
        view.backgroundColor = UIColor.lightGray // change color
        
        request ("https://api.coinmarketcap.com/v1/ticker").responseJSON { response in
            guard response.result.isSuccess
                else {
                    print("Ошибка при запросе данных с сайта \(String(describing: response.result.error))")
                    print(response)
                    return
            }
            guard let arrayOfItems = response.result.value as? [[String:AnyObject]]
                else {
                    print("Не могу перевести в массив")
                    return
            }
            //for bustElements in arrayOfItems {
              //  let item = Cryptocurrency(id: bustElements["id"] as! Int, name: bustElements["name"] as! String)
                //self.items.append(item)
            //}
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        //func configureCell(cell: CustomTableViewCell, for indexPath: IndexPath) {
        //let currency = items[indexPath.row]
        //}
        
        //let currency =  Cryptocurrency(id: 0, name: "test")
    
        //cell.NameMoney.text = "currency.name" // "(currency.NameMoney)"
        
        return cell
    
    }
    struct Cryptocurrency {
        let id: Int
        let name: String
    }
}



//var id: String = ""
//var nameCryptoMoney: String = ""
//var priceInDollars: Int = 0.0

// struct CryptoMoney : IUTableViewCell {


