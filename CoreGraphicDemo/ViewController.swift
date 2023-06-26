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
		let customView = CustomView()
		let youtubeLogo = YouTubeLogoView()
//		customView.frame = CGRect(x: 0 , y: 0, width: 100, height: 100)
//		view.addSubview(customView)
		youtubeLogo.frame = CGRect(x: view.bounds.width / 3 , y: view.bounds.height / 3, width:200, height: 100)
		view.addSubview(youtubeLogo)
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
		UIColor.white.setFill()
		context.fill(rect)
		
			// Set the color for drawing the red play triangle
		UIColor.red.setFill()
		
			// Draw the red play triangle
		let trianglePath = UIBezierPath()
		trianglePath.move(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35))
		trianglePath.addLine(to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.65))
		trianglePath.addLine(to: CGPoint(x: rect.width * 0.65, y: rect.height * 0.5))
		trianglePath.close()
		trianglePath.fill()
		
			// Set the color for drawing the white rounded rectangle
		UIColor.white.setFill()
		
			// Draw the white rounded rectangle
		let roundedRectPath = UIBezierPath(roundedRect: CGRect(x: rect.width * 0.75, y: rect.height * 0.3, width: rect.width * 0.2, height: rect.height * 0.4), cornerRadius: 8)
		roundedRectPath.fill()
	}
}
