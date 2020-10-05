//
//  TweetsTableViewCell.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 05/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTweetText: UILabel!
    @IBOutlet weak var labelSentiment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func create(model: Tweet, for tableView: UITableView) -> TweetsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.tableIdentifier) as? TweetsTableViewCell else {
            return TweetsTableViewCell()
        }
        
        cell.labelTweetText.text = model.text
        cell.labelSentiment.text = model.analyzing ?? false ? "..." : "?"

        if let hasSentiment = model.sentiment {
            cell.labelSentiment.text = hasSentiment.rawValue
        }

        return cell
    }        
}
