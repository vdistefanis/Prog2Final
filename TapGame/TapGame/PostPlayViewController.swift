//  Vincent Distefanis
//  SCS 141 02
//  PostPlayViewController.swift
//  TapGame
//  Final Project


import UIKit

class PostPlayViewController: UIViewController {
    
    @IBOutlet weak var scoreWas: UILabel!
    @IBOutlet weak var result: UILabel!
    var score:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        result.text = score
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: "Confirm", message: "Do You Want to Play Again?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("Pressed Cancel")}))
       

        actionSheet.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in  self.dismiss(animated: true, completion: nil)
                                                self.presentingViewController?.dismiss(animated: true, completion: nil)}))
        
        present(actionSheet, animated: true)
    }
   
    
    @IBAction func replayButton(_ sender: Any) {
        showActionSheet()
    }
    
}
