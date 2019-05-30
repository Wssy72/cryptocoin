//
//  CustomTableViewCell.swift
//  Cryptomoney
//
//  Created by Sergey on 14/04/2019.
//  Copyright © 2019 Sergey Yakovlev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceUsdLabel: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    private var currency: Cryptocurrency?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func draw(currency: Cryptocurrency) {
        self.currency = currency
        symbolLabel.text = currency.symbol
        nameLabel.text = currency.name
        priceUsdLabel.text = currency.priceUsdLabel
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favoriteTap(_ sender: Any) {
        print("Tap \(currency?.symbol ?? "UNKNOWN")")
    }
}
