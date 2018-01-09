//
//  ViewController.swift
//  HitTheTarget
//
//  Created by ToAnh T. Tran on 1/4/18.
//  Copyright © 2018 ToAnh T. Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var currentValue = 0
	@IBOutlet weak var slider: UISlider!
	var targetValue = 0
	@IBOutlet weak var targetLabel: UILabel!
	var score = 0
	@IBOutlet weak var scoreLabel: UILabel!
	var round = 0
	@IBOutlet weak var roundLabel: UILabel!
	@IBOutlet weak var startOverLabel: UILabel!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		currentValue = lroundf(slider.value)
		startNewGame()
	}
	
	@IBAction func startNewGame() {
		score = 0
		round = 0
		startNewRound()
	}
	
	func updateLabels(){
		targetLabel.text = String(targetValue)
		scoreLabel.text = String(score)
		roundLabel.text = String(round)
	}
	
	func startNewRound(){
		round += 1
		targetValue = 1 + Int(arc4random_uniform(100))
		currentValue = 50
		slider.value = Float(currentValue)
		updateLabels()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func showTargetNum(_ label: UILabel) {
		print("The target value is: \(targetValue)")
	}
	
	
	@IBAction func sliderMoved(_ slider: UISlider) {
		print("The value of the slider is now: \(slider.value)")
		currentValue = lroundf(slider.value)
	}
	
	@IBAction func showScore(_ label:UILabel){
		print("Your score is: \(score)")
	}
	
	@IBAction func showRound (_ label: UILabel){
		print("You are on round number: \(round)")
	}
	


	@IBAction func showAlert(){
		
		let difference = abs(targetValue - currentValue)
		var points = 100 - difference
		
		if difference == 0 {
			score += 100
		} else if difference <= 1 {
			score += 50
		}
		
		let title: String
		if difference == 0 {
			title = "Wow, you are good! Perfect bullseye! Have you played this game before?"
			points += 100
		} else if difference < 5 {
			title = "You were so close. You almost had it!"
			if difference == 1 {
				points += 50
			}
		} else if difference < 10 {
			title = "Pretty good!"
		} else {
			title = "Not even close....maybe try again with both eyes open."
		}
		
		score += points

	
		let message = "You scored \(points) points"
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Awesome", style: .default, handler: {
			action in
			self.startNewRound()
		})
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
		
	}
	


}

