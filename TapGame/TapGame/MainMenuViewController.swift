//  Vincent Distefanis
//  SCS 141 02
//  MainMenuViewController.swift
//  TapGame
//  Final Project


import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "toGame", sender: self)
    }
    
    }
    
