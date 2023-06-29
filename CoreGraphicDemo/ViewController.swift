//
//  ViewController.swift
//  CoreGraphicDemo
//
//  Created by Noye Samuel on 14/06/2023.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
	var pageViewController: UIPageViewController!
	var viewControllers: [LogoViewController] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let youtubeLogo = YouTubeLogoView()
		let facebookLogoView = FacebookLogoView()
		let smileyFaceView = SmileyFaceView()
		let mastercardView = MastercardLogoView()
		let bbcLogoView = BBCLogoView()
		let microsoftView = MicrosoftView()
		let olympicLogoView = OlympicLogoView()
		let googleLogoView = GoogleLogoView()
		
			// Customize the width and height for each logo view
		youtubeLogo.frame = CGRect(x: 0, y: 0, width: 50, height: 75)
		facebookLogoView.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
		smileyFaceView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		mastercardView.frame = CGRect(x: 0, y: 0, width: 150, height: 90)
		bbcLogoView.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
		microsoftView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		olympicLogoView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		googleLogoView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
		
		let youtubeLogoVC = LogoViewController(view: youtubeLogo, title: "YouTube")
		let facebookLogoVC = LogoViewController(view: facebookLogoView, title: "Facebook")
		let smileyFaceVC = LogoViewController(view: smileyFaceView, title: "Smiley Face")
		let mastercardVC = LogoViewController(view: mastercardView, title: "Mastercard")
		let bbcLogoVC = LogoViewController(view: bbcLogoView, title: "BBC")
		let microsoftVC = LogoViewController(view: microsoftView, title: "Microsoft")
		let olympicLogoVC = LogoViewController(view: olympicLogoView, title: "Olympic")
		let googleLogoVC = LogoViewController(view: googleLogoView, title: "Google")
		
		viewControllers = [youtubeLogoVC, facebookLogoVC, smileyFaceVC, mastercardVC, bbcLogoVC, microsoftVC, olympicLogoVC, googleLogoVC]
		
			// Set up the page view controller
		pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
		pageViewController.dataSource = self
		pageViewController.setViewControllers([youtubeLogoVC], direction: .forward, animated: true, completion: nil)
		
		addChild(pageViewController)
		view.addSubview(pageViewController.view)
		pageViewController.didMove(toParent: self)
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.firstIndex(where: { $0 === viewController }), index > 0 else {
			return nil
		}
		return viewControllers[index - 1]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = viewControllers.firstIndex(where: { $0 === viewController }), index < viewControllers.count - 1 else {
			return nil
		}
		return viewControllers[index + 1]
	}
}

class LogoViewController: UIViewController {
	let logoView: UIView
	
	init(view: UIView, title: String) {
		self.logoView = view
		super.init(nibName: nil, bundle: nil)
		self.title = title
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = logoView
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
		
	
		
			// Set the color for drawing the red rounded rectangle
		UIColor.red.setFill()
		
			// Define the corner radius for the rounded rectangle
		let cornerRadius: CGFloat = 20
		
			// Define the width and height of the rounded rectangle
		let roundedRectWidth = rect.width * 0.8
		let roundedRectHeight = rect.height * 0.2
		
			// Calculate the origin of the rounded rectangle
		let roundedRectOriginX = rect.width - roundedRectWidth - (rect.width * 0.1)
		let roundedRectOriginY = rect.height * 0.3
		
			// Draw the red rounded rectangle
		let roundedRectPath = UIBezierPath(roundedRect: CGRect(x: roundedRectOriginX, y: roundedRectOriginY, width: roundedRectWidth, height: roundedRectHeight), cornerRadius: cornerRadius)
		roundedRectPath.fill()
		
		
			// Set the color for drawing the white play triangle
		UIColor.white.setFill()
		
			// Define the size and position of the play triangle
		let triangleWidth = rect.width * 0.15
		let triangleHeight = rect.height * 0.1
		let triangleX = rect.width * 0.45
		let triangleY = rect.height * 0.35
		
			// Draw the white play triangle
		let trianglePath = UIBezierPath()
		trianglePath.move(to: CGPoint(x: triangleX, y: triangleY))
		trianglePath.addLine(to: CGPoint(x: triangleX, y: triangleY + triangleHeight))
		trianglePath.addLine(to: CGPoint(x: triangleX + triangleWidth, y: triangleY + (triangleHeight / 2)))
		trianglePath.close()
		trianglePath.fill()
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

class SmileyFaceView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard UIGraphicsGetCurrentContext() != nil else { return }
		
			// Set the fill color for the face
		UIColor.yellow.setFill()
		
			// Draw the face (a yellow circle)
		let facePath = UIBezierPath(ovalIn: rect)
		facePath.fill()
		
			// Set the stroke color for the eyes and mouth
		UIColor.black.setStroke()
		
			// Draw the eyes (two black circles)
		let eyeRadius = rect.width * 0.1
		let leftEyeCenter = CGPoint(x: rect.midX - rect.width * 0.2, y: rect.midY - rect.height * 0.2)
		let rightEyeCenter = CGPoint(x: rect.midX + rect.width * 0.2, y: rect.midY - rect.height * 0.2)
		
		let leftEyePath = UIBezierPath(arcCenter: leftEyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
		let rightEyePath = UIBezierPath(arcCenter: rightEyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
		
		leftEyePath.stroke()
		rightEyePath.stroke()
		
			// Draw the mouth (smile)
		let mouthPath = UIBezierPath()
		let mouthWidth = rect.width * 0.3
		let mouthHeight = rect.height * 0.2
		let mouthRect = CGRect(x: rect.midX - mouthWidth/2, y: rect.midY + rect.height * 0.1, width: mouthWidth, height: mouthHeight)
		mouthPath.move(to: CGPoint(x: mouthRect.minX, y: mouthRect.midY))
		mouthPath.addQuadCurve(to: CGPoint(x: mouthRect.maxX, y: mouthRect.midY), controlPoint: CGPoint(x: rect.midX, y: mouthRect.maxY))
		mouthPath.stroke()
	}
}

class MastercardLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		UIColor.white.setFill()
		context.fill(rect)
		let yellowCircleRadius = rect.width * 0.20
			// Set the colors for drawing
		let redColor = UIColor(red: 222/255, green: 41/255, blue: 44/255, alpha: 1.0)
		let yellowColor = UIColor(red: 255/255, green: 205/255, blue: 0/255, alpha: 0.85)
		
			// Draw the red circles
		let redCirclePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX - yellowCircleRadius + 10, y: rect.midY), radius: rect.width * 0.20, startAngle: 0, endAngle: .pi * 2, clockwise: true)
		redColor.setFill()
		redCirclePath.fill()
		
	
		
			// Draw the yellow circles
		let yellowCirclePath = UIBezierPath(arcCenter: CGPoint(x: rect.midX + 25, y: rect.midY), radius: yellowCircleRadius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
		yellowColor.setFill()
		yellowCirclePath.fill()

			// Draw the Mastercard logo text
		let logoText = "mastercard"
		let logoFont = UIFont.boldSystemFont(ofSize: 24)
		let logoTextAttributes: [NSAttributedString.Key: Any] = [
			.foregroundColor: UIColor.white,
			.font: logoFont
		]
		
		let logoTextSize = logoText.size(withAttributes: logoTextAttributes)
		let logoTextOrigin = CGPoint(x: rect.midX - logoTextSize.width/2, y: rect.midY - logoTextSize.height/2)
		logoText.draw(at: logoTextOrigin, withAttributes: logoTextAttributes)
	}
}

class MicrosoftView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		//UIColor.white.setFill()
		context.fill(rect)
		
			// Set the colors for drawing
		let colors: [UIColor] = [
			UIColor(red: 218/255, green: 37/255, blue: 28/255, alpha: 1.0), // Red
			UIColor(red: 124/255, green: 187/255, blue: 0/255, alpha: 1.0),    // Green
			UIColor(red: 0/255, green: 157/255, blue: 224/255, alpha: 1.0), // Blue
			UIColor(red: 247/255, green: 209/255, blue: 25/255, alpha: 1.0)  // Yellow
		]
		
			// Draw the squares
		let squareSize = rect.width / 3
		
		for i in 0..<4 {
			let row = i / 2
			let col = i % 2
			
			let squareRect = CGRect(x: CGFloat(col) * squareSize, y: CGFloat(row) * squareSize, width: squareSize, height: squareSize)
			
			colors[i].setFill()
			UIRectFill(squareRect)
		}
	}
}

class BBCLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		//UIColor.white.setFill()
		context.fill(rect)
		
			// Set the colors for drawing
		let redColor = UIColor(red: 0.835, green: 0.098, blue: 0.184, alpha: 1.0)
		let whiteColor = UIColor.white
		
			// Calculate the letter size and spacing
		let letterWidth = rect.width * 0.3
		let letterHeight = rect.height * 0.5
		
			// Draw the first "B" letter
		let bRect = CGRect(x: 0 , y: rect.height * 0.25, width: letterWidth, height: letterHeight)
		redColor.setFill()
		UIRectFill(bRect)
		
		let bFont = UIFont.systemFont(ofSize: letterHeight * 0.8, weight: .bold)
		let bAttributes: [NSAttributedString.Key: Any] = [
			.font: bFont,
			.foregroundColor: whiteColor
		]
		let bString = NSAttributedString(string: "B", attributes: bAttributes)
		let bSize = bString.size()
		let bOrigin = CGPoint(x: bRect.origin.x + (bRect.width - bSize.width) / 2, y: bRect.origin.y + (bRect.height - bSize.height) / 2)
		bString.draw(at: bOrigin)
		
			// Draw the second "B" letter
		let secondBRect = CGRect(x: rect.width * 0.35, y: rect.height * 0.25, width: letterWidth, height: letterHeight)
		redColor.setFill()
		UIRectFill(secondBRect)
		
		let secondBString = NSAttributedString(string: "B", attributes: bAttributes)
		let secondBSize = secondBString.size()
		let secondBOrigin = CGPoint(x: secondBRect.origin.x + (secondBRect.width - secondBSize.width) / 2, y: secondBRect.origin.y + (secondBRect.height - secondBSize.height) / 2)
		secondBString.draw(at: secondBOrigin)
		
			// Draw the "C" letter
		let cRect = CGRect(x: rect.width * 0.7, y: rect.height * 0.25, width: letterWidth, height: letterHeight)
		redColor.setFill()
		UIRectFill(cRect)
		
		let cFont = UIFont.systemFont(ofSize: letterHeight * 0.8, weight: .bold)
		let cAttributes: [NSAttributedString.Key: Any] = [
			.font: cFont,
			.foregroundColor: whiteColor
		]
		let cString = NSAttributedString(string: "C", attributes: cAttributes)
		let cSize = cString.size()
		let cOrigin = CGPoint(x: cRect.origin.x + (cRect.width - cSize.width) / 2, y: cRect.origin.y + (cRect.height - cSize.height) / 2)
		cString.draw(at: cOrigin)
	}
}

class OlympicLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		UIColor.white.setFill()
		context.fill(rect)
		
			// Define the colors of the Olympic rings
		let colors: [UIColor] = [.blue, .black, .red, .yellow, .green]
		
			// Calculate the ring properties
		let ringRadius = min(rect.width, rect.height) * 0.4
		let ringThickness = ringRadius * 0.2
		let ringCenterX = rect.midX
		let ringCenterY = rect.midY
		
			// Draw each ring
		for (index, color) in colors.enumerated() {
				// Calculate the ring position and rect
			let angle = CGFloat(index) * (CGFloat.pi * 2 / CGFloat(colors.count))
			let ringX = ringCenterX + cos(angle) * (ringRadius - ringThickness/2)
			let ringY = ringCenterY + sin(angle) * (ringRadius - ringThickness/2)
			let ringRect = CGRect(x: ringX - ringRadius, y: ringY - ringRadius, width: ringRadius * 2, height: ringRadius * 2)
			
				// Draw the ring
			context.setFillColor(color.cgColor)
			context.setStrokeColor(UIColor.white.cgColor)
			context.setLineWidth(ringThickness)
			context.addEllipse(in: ringRect)
			context.drawPath(using: .fillStroke)
		}
	}
}

class GoogleLogoView: UIView {
	
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
			// Set the background color of the view
		UIColor.white.setFill()
		context.fill(rect)
		
			// Set the colors for drawing
		let redColor = UIColor(red: 0.863, green: 0.196, blue: 0.184, alpha: 1.0)
		let blueColor = UIColor(red: 0.114, green: 0.403, blue: 0.717, alpha: 1.0)
		let yellowColor = UIColor(red: 0.976, green: 0.757, blue: 0.063, alpha: 1.0)
		let greenColor = UIColor(red: 0.341, green: 0.643, blue: 0.267, alpha: 1.0)
		
			// Draw the "G" letter
		let gRect = CGRect(x: rect.width * 0.2, y: rect.height * 0.2, width: rect.width * 0.6, height: rect.height * 0.6)
		redColor.setFill()
		UIRectFill(gRect)
		
			// Draw the "o" letter
		let oRect = CGRect(x: rect.width * 0.4, y: rect.height * 0.4, width: rect.width * 0.2, height: rect.height * 0.2)
		blueColor.setFill()
		context.fillEllipse(in: oRect)
		
			// Draw the "o" letter
		let secondORect = CGRect(x: rect.width * 0.25, y: rect.height * 0.25, width: rect.width * 0.5, height: rect.height * 0.5)
		yellowColor.setFill()
		context.fillEllipse(in: secondORect)
		
			// Draw the "g" letter
		let secondGRect = CGRect(x: rect.width * 0.35, y: rect.height * 0.35, width: rect.width * 0.3, height: rect.height * 0.3)
		greenColor.setFill()
		UIRectFill(secondGRect)
	}
}
