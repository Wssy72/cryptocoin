//
//  ViewController.swift
//  Cryptomoney
//
//  Created by apple on 08/02/2019.
//  Copyright © 2019 Sergey Yakovlev. All rights reserved.
//

import UIKit
import Alamofire

class MainScreenView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var tableViewMoney: UITableView!
    
    var currencies = [Cryptocurrency]()
    
//    var addCoinsInFavorites = item[]
    
    @IBAction func Update(_ sender: UIButton) {
        print("Update")
        loadData()
        //self.tableViewMoney.rowHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewMoney.dataSource = self
        //tableViewMoney.delegate = self
        
        print("This is viewDidLoad")
        view.backgroundColor = UIColor.lightGray // change color
        //coinsLabel.text = "Cryptomoney"
        
        loadData()
        
    }
    
    private func loadData() {
        print("loadData")
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
            
            print(arrayOfItems)
            for bustElements in arrayOfItems {
                let item = Cryptocurrency(symbol: bustElements["symbol"] as! String, name: bustElements["name"] as! String, priceUsdLabel: bustElements["price_usd"] as! String, favoriteState: false)
                // add new element cryptocurrency
                self.currencies.append(item)
            }
            self.tableViewMoney.reloadData()
        }
    }
    //bustElements["bool"] as!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
        // display count string in array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.draw(currency: currencies[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
