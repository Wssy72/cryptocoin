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
  
    var dataDecode = [Cryptocurrency]()
    
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var tableViewMoney: UITableView!
    
    //var currencies = [Cryptocurrency]()
    
//    var addCoinsInFavorites = item[]
    
    @IBAction func Update(_ sender: UIButton) {
        print("Update")
        loadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewMoney.dataSource = self
        //tableViewMoney.delegate = self
        //self.tableViewMoney.rowHeight
        print("This is viewDidLoad")
        view.backgroundColor = UIColor.systemGray // change color
        //coinsLabel.text = "Cryptomoney"
        
        loadData()
        self.tableViewMoney.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDecode.count
        // display count string in array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let moneyNumber = indexPath.row
        let moneyData = dataDecode[moneyNumber]
        
        cell.nameLabel.text = moneyData.name //draw(currency: dataDecode[indexPath.row])
        //cell.symbolLabel.text = "t"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    private func loadData() {
        print("loadData")
        //?CMC_PRO_API_KEY=0a5b109a-5a84-4700-89f6-97b14d373aaf
        request ("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=0a5b109a-5a84-4700-89f6-97b14d373aaf").responseJSON { response in
            guard response.result.isSuccess
                else {
                    print("Ошибка при запросе данных с сайта \(String(describing: response.result.error))")
                    print(response)
                    return
            }
            print(response, "печатает запрос")
            if let data = response.data {
                print(data)
                do {
                    let answer: ServerAnswer = try! JSONDecoder().decode(ServerAnswer.self, from: data)
                    let answerData = answer.data
                    self.dataDecode.append(contentsOf: answerData)
                    
                    print(answer)
                } catch {
                    print(error)
                }
            }
        }
    }
   
}

struct ServerAnswer: Decodable {
   let data: [Cryptocurrency]
   }

