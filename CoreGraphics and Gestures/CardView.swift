//
//  CardView.swift
//  CoreGraphics and Gestures
//
//  Created by Maxim on 10/02/2019.
//  Copyright © 2019 Maxim. All rights reserved.
//

import UIKit

class CardView: UIView {

    private func makeAttributedString (_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.gray
        shadow.shadowOffset = CGSize(width: 2, height: 4) //!!!
        let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font, .shadow: shadow, .foregroundColor: UIColor.green ]
        return NSAttributedString (string: string, attributes: attributes)
    }
    var number: Int = 7 { didSet {setNeedsDisplay() }}
    private lazy var upperLeftCornerLabel = createLabel()
    private lazy var loweRightCornerLabel = createLabel()
    private lazy var centerLabel = createLabel()
    
    private func createLabel () -> UILabel {
        let label = UILabel ()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCornerLabel (upperLeftCornerLabel)
        configureCornerLabel(loweRightCornerLabel)
        configureCenterLabel(centerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: 20, dy: 20)
        loweRightCornerLabel.frame.origin = bounds.origin.offsetBy(dx: bounds.width-40.0, dy: bounds.height-70.0)
        centerLabel.frame.origin = bounds.origin.offsetBy(dx: bounds.midX-30, dy: bounds.midY-45)
    }
    
    private var cornerLabelString: NSAttributedString {
        return makeAttributedString(String(number), fontSize: 50)
    }
    private var centraLabelString: NSAttributedString {
        return makeAttributedString(String(number), fontSize: 90)
    }
    private func configureCornerLabel(_ label: UILabel)  {
        label.attributedText = cornerLabelString
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    private func configureCenterLabel (_ label: UILabel) {
        label.attributedText = centraLabelString
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    
    
    override func draw(_ rect: CGRect) {
        let rounded_rect = UIBezierPath(roundedRect: bounds, cornerRadius: 16)
        UIColor.red.setFill()
        rounded_rect.addClip()
        rounded_rect.fill()
        let rect = CGRect(origin: CGPoint(x: sizeOfCenter.xCoordFromOrigin , y: sizeOfCenter.yCoordFromOrigin ) , size: CGSize(width: bounds.width*sizeOfCenter.widthOfCenter, height: bounds.height*sizeOfCenter.heightofCenter))
       let path = UIBezierPath(ovalIn: rect)
        UIColor.white.setFill()
        path.fill()
        
    }

}

extension CGPoint {
    func offsetBy (dx: CGFloat, dy:CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
    }

}

extension CardView {
    private struct sizeOfCenter {
        static let widthOfCenter: CGFloat = 0.70 // 0,75
        static let heightofCenter: CGFloat = 0.74 // 0.8
        static let xCoordFromOrigin: Double = 48.0 // 50
        static let yCoordFromOrigin: Double = 70.0 // 60
    }
}
