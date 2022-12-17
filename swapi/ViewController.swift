//
//  ViewController.swift
//  swapi
//
//  Created by Vamsi Allu on 2022-09-20.
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
        SWAPI_Helper.enteredNumber = enteredNumber.text ?? ""
        SWAPI_Helper.fetchMath { data, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.jokeLabel.text = dataString
                }
            }else if let error = error {
                
            }
        }
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func getDate(_ sender: UIButton) {
        SWAPI_Helper.enteredNumber = enteredNumber.text ?? ""
        SWAPI_Helper.fetchDate { data, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.jokeLabel.text = dataString
                }
            }else if let error = error {
                
            }
        }
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func getTriviaNumber(_ sender: UIButton) {
        SWAPI_Helper.enteredNumber = enteredNumber.text ?? ""
        SWAPI_Helper.fetchNumber { data, error in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    self.jokeLabel.text = dataString
                }
            }else if let error = error {
                
            }
        }
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    @IBAction func markAsFavorite(_ sender: UIButton) {
        if let row = NumberHelper.getNumberList().firstIndex(where: {$0.numberValue == jokeLabel.text}) {
            let localNumber = NumberHelper.numberList[row];
            localNumber.isFavorite = true;
            NumberHelper.numberList[row] = localNumber;
        }
    }
    
}

