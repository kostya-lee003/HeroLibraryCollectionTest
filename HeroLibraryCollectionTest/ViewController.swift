//
//  ViewController.swift
//  HeroLibraryCollectionTest
//
//  Created by Kostya Lee on 24/02/23.
//

import UIKit
import Hero

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        23
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.imageView?.heroID = "\(indexPath.row)"
        cell.imageView?.image = UIImage(named: "AppleLogo")
        cell.textLabel?.text = "Text \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = VC2(indexPath.row)
        showHero(controller)
    }
    
    lazy var tableView = UITableView(frame: self.view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enableHero()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
}

extension UIViewController {
    public func enableHero() {
        hero.isEnabled = true
        navigationController?.isHeroEnabled = true
    }
    
    public func disableHero() {
        navigationController?.isHeroEnabled = false
    }
    
    public func showHero(_ viewController: UIViewController, animationType: HeroDefaultAnimationType = .autoReverse(presenting: .slide(direction: .leading))) {
        navigationController?.hero.isEnabled = true
        navigationController?.heroNavigationAnimationType = animationType
        navigationController?.pushViewController(viewController, animated: true)
    }
}
