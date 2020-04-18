//
//  ViewController.swift
//  TextFieldGame
//
//  Created by Donavin Watson on 4/17/20.
//  Copyright © 2020 Don Watsy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var guessField: UITextField!
	@IBOutlet weak var messageLabel: UILabel!
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var newGame: UIButton!
	@IBOutlet weak var numOfGuessLabel: UILabel!
	@IBOutlet weak var numOfGamesLabel: UILabel!
	
	var langArray = ["C++", "Java", "JavaScript", "Python", "Swift"]
	var gamesPlayed = 0;
	var correctAns = "";
	var score = 0;
	var numberOfGuesses = 0;
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func newGame(_ sender: UIButton) {
		let randomNum = Int(arc4random()) % langArray.count;
		let i = randomNum;
		
		correctAns = langArray[i];
		print(correctAns);
		gamesPlayed = gamesPlayed + 1;
		numOfGamesLabel.text = "Games Played: \(gamesPlayed)";
	}
	@IBAction func checkAnswerButton(_ sender: UIButton) {
		// if new game wasnt started
		if correctAns == "" {
			let alert = UIAlertController(title: "Please press new game button", message: "so we can play the game.", preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
			self.present(alert,animated: true)
			
		//new game already started
		} else {
			
			numberOfGuesses = numberOfGuesses + 1;
			numOfGuessLabel.text = "Number of Guesses: \(numberOfGuesses)";
			if guessField.text == correctAns {
				let alert = UIAlertController(title: "Good Job!", message:"You guessed it.", preferredStyle: .alert)
				alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
				self.present(alert,animated: true)
				
				if numberOfGuesses == 1 {
					score = score + 10;
				}else if numberOfGuesses == 2 {
					score = score + 5;
				}else if numberOfGuesses == 3 {
					score = score + 1;
				}
		
				messageLabel.text = "";
				scoreLabel.text = "Score: \(score)";
				messageLabel.text = "Number of Guesses:";
				correctAns = "";
				numberOfGuesses = 0;
			
				// if wrong answer
			    } else {
	
				messageLabel.text = "Wrong Answer, Guess again.";
				messageLabel.textColor = UIColor.black;
			    }
			    guessField.resignFirstResponder()
			    guessField.text = "";
		}
}

}
