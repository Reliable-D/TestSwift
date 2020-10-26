//
//  TestView.swift
//  TestSwift
//
//  Created by 邓乐 on 2020/5/28.
//  Copyright © 2020 邓乐. All rights reserved.
//

import UIKit

class TestView: UIView {

    public var bgView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let a:Bool = false
    
    
    public var btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        btn.setTitle("Click Me", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.lightGray
        return btn
    }()
    
    lazy var breaklinView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    lazy var breaklinView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var breaklinView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
//        bgView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//        }
//        bgView.addSubview(btn)
//        btn.snp.makeConstraints { (make) in
//            make.height.equalTo(44)
//            make.left.equalTo(15)
//            make.right.equalTo(-15)
//            make.centerY.equalToSuperview()
//        }
        addSubview(breaklinView)
        addSubview(breaklinView1)
        addSubview(breaklinView2)
        
        btn.isSelected = a
        btn.isSelected = !a
        
        let breakLine = [
            breaklinView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            breaklinView.widthAnchor.constraint(equalToConstant: 1),
            breaklinView.heightAnchor.constraint(equalToConstant: 44),
            breaklinView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)
        ]
        NSLayoutConstraint.activate(breakLine)
        
//        breaklinView1.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self).multipliedBy(0.5)
//            make.centerY.equalTo(breaklinView)
//            make.size.equalTo(CGSize(width: 100, height: 50))
//        }
//
//        breaklinView2.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self).multipliedBy(1.5)
//            make.centerY.equalTo(breaklinView)
//            make.size.equalTo(CGSize(width: 100, height: 50))
//        }
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)
    }
    
}
