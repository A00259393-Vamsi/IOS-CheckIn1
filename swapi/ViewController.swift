//
//  ViewController.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var enteredNumber: UITextField!
    
    @IBOutlet var jokeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        SWAPI_Helper.fetchDir()"
    }
    
    @IBAction func getMath(_ sender: UIButton) {
        jokeLabel.text = SWAPI_Helper.fetchMath(enteredNumber: enteredNumber.text ?? "")
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func getDate(_ sender: UIButton) {
        jokeLabel.text = SWAPI_Helper.fetchDate(enteredNumber: enteredNumber.text ?? "")
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func getTriviaNumber(_ sender: UIButton) {
        jokeLabel.text = SWAPI_Helper.fetchNumber(enteredNumber: enteredNumber.text ?? "")
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func markAsFavorite(_ sender: UIButton) {
        if let row = NumberHelper.getNumberList().firstIndex(where: {$0.numberValue == jokeLabel.text}) {
            var localNumber = NumberHelper.numberList[row];
            localNumber.isFavorite = true;
            NumberHelper.numberList[row] = localNumber;
        }
    }
}

