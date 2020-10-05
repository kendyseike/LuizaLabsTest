//
//  TweetsViewController.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 01/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {

    @IBOutlet weak var stackTwitterUserInfo: UIStackView!
    @IBOutlet weak var labelTwitterUserName: UILabel!
    @IBOutlet weak var labelTwitterUserNickname: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TweetsPresenter!
    var tweets: [Tweet]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TweetsTableViewCell.self)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.loadModuleIO()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func allowSelectionOnTableView(allow: Bool) {
        tableView.allowsSelection = allow
    }

}

extension TweetsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter.presentLoadingToFetchUserInfo(userName: textField.text ?? "")
        return true
    }
}

extension TweetsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let tweet = tweets?[indexPath.row] {
            return TweetsTableViewCell.create(model: tweet, for: tableView)
        }
        
        return UITableViewCell()
    }
}

extension TweetsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let tweet = tweets?[indexPath.row], tweet.sentiment == nil {
            self.allowSelectionOnTableView(allow: false)
            presenter.analyzeTextSentiment(tweet: tweet, tweetIndex: indexPath.row)
        }
    }
}

extension TweetsViewController: TweetsViewProtocol {
    func showAlertAnalyzingTextWithError(errorMessage: String) {
        showAlert(title: AlertTexts.alert_error_generic_title.rawValue, message: errorMessage)
    }
    
    func showAlertWithError(errorMessage: String) {
        self.tweets = nil
        stackTwitterUserInfo.isHidden = true
        tableView.isHidden = true
        showAlert(title: AlertTexts.alert_error_generic_title.rawValue, message: errorMessage)
    }
    
    func analyzingTweet(tweet: Tweet, tweetIndex: Int) {
        self.tweets?[tweetIndex].analyzing = tweet.analyzing
    }
    
    func showTweetTextSentiment(tweet: Tweet, tweetIndex: Int) {
        self.allowSelectionOnTableView(allow: true)
        self.tweets?[tweetIndex].sentiment = tweet.sentiment
    }
    
    func loadViewWithUserInfo(user: User) {
        stackTwitterUserInfo.isHidden = false
        tableView.isHidden = false
        labelTwitterUserName.text = "\(LabelTexts.user_name.rawValue)\(user.name)"
        labelTwitterUserNickname.text = "\(LabelTexts.user_nickname.rawValue)\(user.username)"
        self.refreshTweets(tweets: user.tweets)
    }
    
    func refreshTweets(tweets: [Tweet]?) {
        self.tweets = tweets
    }
}
