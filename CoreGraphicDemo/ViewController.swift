//
//  ViewController.swift
//  CoreGraphicDemo
//
//  Created by Noye Samuel on 14/06/2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
			// Do any additional setup after loading the view.
		let youtubeLogo = YouTubeLogoView()
		let facebookLogoView = FacebookLogoView()
//		let smileyFaceView = SmileyFaceView()
		let logoWidth: CGFloat = 100
		let logoHeight: CGFloat = 80
		
		let centerX = view.bounds.width / 2 - logoWidth / 2
		let centerY = view.bounds.height / 2 - logoHeight / 2
		
		youtubeLogo.frame = CGRect(x: centerX, y: 80, width: logoWidth, height: logoHeight)
		view.addSubview(youtubeLogo)
		facebookLogoView.frame = CGRect(x:  centerX, y: 180, width: logoWidth, height: logoHeight)
		view.addSubview(facebookLogoView)
//		smileyFaceView.frame = CGRect(x: centerX, y: 280, width: 100, height: 100)
//		view.addSubview(smileyFaceView)
	}

}


class CustomView: UIView {
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else {
			return
		}
		
		context.setStrokeColor(UIColor.black.cgColor)
		context.setLineWidth(4.5)
		
		let rectangle = CGRect(x: 2, y: 2, width: 200, height: 200)
		context.addRect(rectangle)
		context.fill(rectangle)
		
		context.setStrokeColor(UIColor.yellow.cgColor)
		context.move(to: CGPoint(x: 0, y: 0))
		context.addLine(to: CGPoint(x: 200, y: 200))
		context.strokePath()
		
		context.setStrokeColor(UIColor.white.cgColor)
		context.setFillColor(UIColor.orange.cgColor)
		let cirAngle = CGRect(x: 10, y: 10, width: 150, height: 150)
		context.addEllipse(in: cirAngle)
		context.fillEllipse(in: cirAngle)
		context.strokePath()
		
	}
}

class YouTubeLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		UIColor.red.setFill()
		context.fill(rect)
		
			// Set the color for drawing the white play triangle
		UIColor.white.setFill()
		
			// Draw the white play triangle
		let trianglePath = UIBezierPath()
		trianglePath.move(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35))
		trianglePath.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.65))
		trianglePath.addLine(to: CGPoint(x: rect.width * 0.65, y: rect.height * 0.5))
		trianglePath.close()
		trianglePath.fill()
		
			// Set the color for drawing the red rounded rectangle
		UIColor.red.setFill()
		
			// Define the corner radius for the rounded rectangle
		let cornerRadius: CGFloat = 20
		
			// Draw the red rounded rectangle
		let roundedRectPath = UIBezierPath(roundedRect: CGRect(x: rect.width * 0.75, y: rect.height * 0.3, width: rect.width * 0.2, height: rect.height * 0.4), cornerRadius: cornerRadius)
		roundedRectPath.fill()
	}
}

class FacebookLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		UIColor.blue.setFill()
		context.fill(rect)
		
			// Set the color for drawing the white "f" letter
		UIColor.white.setFill()
		
			// Define the font and size for the "f" letter
		let fontSize: CGFloat = rect.height * 0.7
		let font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
		
			// Create the attributed string for the "f" letter with white color
		let attributedString = NSAttributedString(string: "f", attributes: [.font: font, .foregroundColor: UIColor.white])
		
			// Calculate the size of the "f" letter within the available rect
		let textRect = attributedString.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil)
		
			// Draw the "f" letter at the center of the view
		let drawPoint = CGPoint(x: rect.midX - textRect.midX, y: rect.midY - textRect.midY)
		attributedString.draw(at: drawPoint)
	}
}



