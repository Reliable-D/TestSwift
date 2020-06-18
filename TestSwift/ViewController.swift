//
//  ViewController.swift
//  TestSwift
//
//  Created by 邓乐 on 2020/5/28.
//  Copyright © 2020 邓乐. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class ViewController: UIViewController {

    var bgView = TestView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
    
    let label = UILabel()
//     let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(bgView)
        bgView.backgroundColor = .red
        bgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 100, left: 30, bottom: 100, right: 30))
        }
        bgView.btn.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
        
        view.addSubview(label)
        let labelCons = [
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ]
        NSLayoutConstraint.activate(labelCons)
        
        let msg = MKCDashboradMessageView()
        view.addSubview(msg)
        msg.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 375, height: 40))
        }
        
        msg.reloadData(dataArray: ["hello world0","hello world1","hello world2","hello world3"])
//        observal.map {
//            print("当前索引数：\($0)")
//        }
//        observal
//               .map { "当前索引数：\($0 )"}
//               .bind { [weak self](text) in
//                   //收到发出的索引数后显示到label上
//                   self?.label.text = text
//               }
//               .disposed(by: disposeBag)
        
    }

    @objc func clickBtn(_ sender: UIButton) {
        print("click me")
        showAlert(title: "test", message: "this is a test")
    }
    

    func showAlert(title:String?, message:String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true) {
            print("show alert")
        }
    }
}

