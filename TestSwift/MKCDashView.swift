//
//  MKCDashView.swift
//  MKCCAPKit
//
//  Created by zh on 2020/6/5.
//

import UIKit
//import Cupcake

enum MKCDashViewType {
    case line //虚线
}

class MKCDashView: UIView {

    var dashLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = nil
        layer.lineDashPattern  = [NSNumber(integerLiteral: 2),NSNumber(integerLiteral: 2)]
        layer.strokeColor = UIColor.lightGray.cgColor
        return layer
    }()

    var type: MKCDashViewType
    var bezierPath = UIBezierPath()
    
    init(dashType: MKCDashViewType) {
        self.type = dashType
        super.init(frame: CGRect.zero)
        bezierPath.move(to: CGPoint(x: self.bounds.size.width*0.5, y: 0))
        bezierPath.addLine(to: CGPoint(x: self.bounds.size.width*0.5, y: bounds.size.height))
        self.layer.addSublayer(self.dashLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if self.type == .line {
            
            
            dashLayer.path = bezierPath.cgPath
            bezierPath.move(to: CGPoint(x: self.bounds.size.width*0.5, y: 0))
            bezierPath.addLine(to: CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height))
        }
    }

}
