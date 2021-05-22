//  Vincent Distefanis
//  SCS 141 02
//  GameViewController.swift
//  TapGame
//  Final Project


import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var tapInt = 0
    var countdown = 3
    var countdownTimer = Timer()
    var gameTime = 10
    var gameTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapInt = 0
        scoreLabel.text = String(tapInt)
        
        countdown = 3
        button.setTitle(String(countdown), for: .normal)
        button.isEnabled = false
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.startGame), userInfo: nil, repeats: true)
        
        gameTime = 10
        timeLabel.text = String(gameTime)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    
    @IBAction func tapButton(_ sender: Any) {
        tapInt += 1
        scoreLabel.text = String(tapInt)
    }
    
    @objc func startGame() {
        countdown -= 1
        button.setTitle(String(countdown), for: .normal)
        
        if countdown == 0 {
            countdownTimer.invalidate()
            button.setTitle("TAP ME", for: .normal)
            button.isEnabled = true
            gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.game), userInfo: nil, repeats: true)
        }
    }
    
    @objc func game() {
        gameTime -= 1
        timeLabel.text = String(gameTime)
        
        if gameTime == 0 {
            gameTimer.invalidate()
            button.isEnabled = false
            
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameViewController.end), userInfo: nil, repeats: false)
        }
    }
    
    @objc func end() {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postPlay") as! PostPlayViewController
        
        viewController.score = scoreLabel.text
        
        self.present(viewController, animated: true, completion: nil)
        
        
    }
    
    
}

