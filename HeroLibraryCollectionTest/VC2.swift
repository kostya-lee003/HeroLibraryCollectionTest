//
//  VC2.swift
//  HeroLibraryCollectionTest
//
//  Created by Kostya Lee on 25/02/23.
//

import UIKit
import Hero

public class VC2: UIViewController {
    lazy var imageView = UIImageView(frame: view.bounds)
    var I: Int?
    
    init(_ row: Int) {
        super.init(nibName: nil, bundle: nil)
        self.I = row
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        imageView.heroID = "\(I ?? 0)"
        
        imageView.image = UIImage(named: "AppleLogo")!
        self.view.addSubview(imageView)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        imageView.heroID = nil
    }
}
