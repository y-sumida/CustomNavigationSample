//
//  ViewController.swift
//  CustomNavigationSample
//
//  Created by Yuki Sumida on 2018/08/27.
//  Copyright © 2018年 Yuki Sumida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        customNavigationView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // スクロールするにつれてナビゲーションバーが見えたり消えたりする
        if scrollView.contentOffset.y < 0 {
            customNavigationView.alpha = 0
            return
        }

        if scrollView.contentOffset.y > 200 {
            customNavigationView.alpha = 1
            return
        }

        let alpha = scrollView.contentOffset.y / 200
        customNavigationView.alpha = alpha
    }
}
