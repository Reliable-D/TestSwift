//
//  ViewController.swift
//  TestSwift
//
//  Created by 邓乐 on 2020/5/28.
//  Copyright © 2020 邓乐. All rights reserved.
//

import UIKit
import Alamofire
import Cupcake

class ViewController: UIViewController {

    var bgView = TestView(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
    
    let label = UILabel()
//     let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.addSubview(bgView)
//        bgView.backgroundColor = .red
//
//
////        bgView.snp.makeConstraints { (make) in
////            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 100, left: 30, bottom: 100, right: 30))
////        }
//        bgView.btn.addTarget(self, action: #selector(clickBtn(_:)), for: .touchUpInside)
//
//        view.addSubview(label)
//        let labelCons = [
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            label.heightAnchor.constraint(equalToConstant: 30),
//            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
//        ]
//        NSLayoutConstraint.activate(labelCons)
//
//        let msg = MKCDashboradMessageView()
//        view.addSubview(msg)
//        msg.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.size.equalTo(CGSize(width: 375, height: 40))
//        }
//
//        msg.reloadData(dataArray: ["hello world0","hello world1","hello world2","hello world3"])
////        observal.map {
////            print("当前索引数：\($0)")
////        }
////        observal
////               .map { "当前索引数：\($0 )"}
////               .bind { [weak self](text) in
////                   //收到发出的索引数后显示到label上
////                   self?.label.text = text
////               }
////               .disposed(by: disposeBag)
        
//        let trackUrl = "http://www.baidu.com"
//        AF.request(trackUrl, method: .get, parameters: <#T##Parameters?#>).responseJSON { (resp) in
//            print("resp:\(resp)")
//        }
        
        struct Role {
            var denyList: [String]?
        }

        struct Item {
            var role: Role?
        }

        let roles = ["role1","role2","role3"]
        let item:Item? = Item(role: Role(denyList: ["123","role34","444"]))
        let deny = item?.role?.denyList?.filter{roles.contains($0)}
        print("deny:\(deny ?? ["null"])")
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
    
    func liveShowTrack(eventId: Int,
                       eventName: String,
                       shareMethod:String,
                       shareSource: String)  {
//        let parms = ["AppId":"LiveShow_eShowCase",
//                     "DeviceId": MKCDeviceManager.shared.deviceId ?? "" ,
//                     "UserId": MKCTokenManager.shared.profile?.consultantId ?? "",
//                     "UnionId":"",
//                     "ShowId": eventId,
//                     "EventName":eventName,
//                     "ShareMethod": shareMethod,
//                     "ShareSource" : shareSource,
//                     "DeviceType" : "iphone",
//                     "UserType" : "",
//                     "ENV" : MKCSettings.shared.envIdentifier,
//                     "Project" : "eShowcase"] as [String : Any]
//
//        AF.request(URL(string: trackURL) as! URLConvertible, method: .get,parameters: parms ).responseData {_ in
//        }

    }
}

