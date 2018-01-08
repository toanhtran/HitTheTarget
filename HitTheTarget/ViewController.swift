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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		currentValue = lroundf(slider.value)
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
		let points = 100 - difference
		
		score += points
		
	
		let message = "You scored \(points) points"
		
		let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
		
		let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
		
		alert.addAction(action)
		
		present(alert, animated: true, completion: nil)
		
		startNewRound()
	}
	


}

