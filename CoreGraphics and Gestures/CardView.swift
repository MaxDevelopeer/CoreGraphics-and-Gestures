//
//  CardView.swift
//  CoreGraphics and Gestures
//
//  Created by Maxim on 10/02/2019.
//  Copyright © 2019 Maxim. All rights reserved.
//

import UIKit

class CardView: UIView {

    
    private var number: Int = 5 { didSet {setNeedsDisplay() }}
    private lazy var upperLeftCornerLabel = createLabel()
    private lazy var loweRightCornerLabel = createLabel()
    private lazy var centerLabel = createLabel()
    private var cornerLabelString: NSAttributedString {
        return makeAttributedString(String(number), fontSize: defaultValues.fontSizeOfCornerLabel, position.corner)
    }
    private var centralLabelString: NSAttributedString {
        return makeAttributedString(String(number), fontSize: defaultValues.fontSizeOfCentralLabel, position.center)
    }
    
    // MARK: - Settings of numbers on card
    private func makeAttributedString (_ string: String, fontSize: CGFloat, _ position: position) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        var attributes = [NSAttributedString.Key: Any]()
        switch position {
        case .center:
            let shadow = NSShadow()
            shadow.shadowColor = UIColor.gray
            let colourOfString = UIColor.blue
            shadow.shadowOffset = CGSize(width: defaultValues.widthOfShadow, height: defaultValues.heightOfShadow)
            attributes = [NSAttributedString.Key.font: font, .shadow: shadow, .foregroundColor: colourOfString ]
        case .corner:
            let colourOfString = UIColor.white
            attributes = [NSAttributedString.Key.font: font, .foregroundColor: colourOfString ]
        }
        return NSAttributedString (string: string, attributes: attributes)
    }
    
    private func createLabel () -> UILabel {
        let label = UILabel ()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    // MARK: - View of numbers on card
    private func configureLabel(_ label: UILabel, _ position: position)  {
        if position == .corner {
            label.attributedText = cornerLabelString
        } else {
            label.attributedText = centralLabelString
        }
        label.frame.size = CGSize.zero
        label.sizeToFit()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel (upperLeftCornerLabel, position.corner)
        configureLabel(loweRightCornerLabel, position.corner)
        configureLabel(centerLabel, position.center)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: 20, dy: 20)
        loweRightCornerLabel.frame.origin = bounds.origin.offsetBy(dx: bounds.width-50.0, dy: bounds.height-70.0)
        centerLabel.frame.origin = bounds.origin.offsetBy(dx: bounds.midX-80, dy: bounds.midY-132)
    }
    
    
    
    // MARK: - Draw view of card
    override func draw(_ rect: CGRect) {
        let rounded_rect = UIBezierPath(roundedRect: bounds, cornerRadius: defaultValues.cornerRadiusOfCard)
        UIColor.blue.setFill()
        rounded_rect.addClip()
        rounded_rect.fill()
        UIColor.white.setStroke()
        rounded_rect.lineWidth = defaultValues.lineWidth
        rounded_rect.stroke()
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

// MARK: - Constants
extension CardView {
    private struct sizeOfCenter {
        static let widthOfCenter: CGFloat = 0.70
        static let heightofCenter: CGFloat = 0.74
        static let xCoordFromOrigin: CGFloat = 48.0
        static let yCoordFromOrigin: CGFloat = 70.0
    }
    private struct defaultValues {
        static let cornerRadiusOfCard: CGFloat = 16.0
        static let lineWidth: CGFloat = 10.0
        static let fontSizeOfCornerLabel: CGFloat = 50.0
        static let fontSizeOfCentralLabel: CGFloat = 240.0
        static let widthOfShadow: Int = 2
        static let heightOfShadow: Int = 4
    }
    private struct colorOfCard {
        static let green = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        static let blue = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        static let yellow = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
        static let red = #colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1)
    }
    private enum position {
        case center
        case corner
    }
}
