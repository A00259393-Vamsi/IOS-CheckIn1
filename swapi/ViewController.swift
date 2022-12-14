//
//  ViewController.swift
//  swapi
//
//  Created by Vamsi Allu on 2022-09-20.
//

import UIKit
import CoreData

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
                    self.saveDataToStorage()
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
                    self.saveDataToStorage()
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
                    self.saveDataToStorage()
                }
            }else if let error = error {
                
            }
        }
        let number = Number(numberValue: enteredNumber.text! , numberStatement: jokeLabel.text!, isFavorite: false);
        NumberHelper.setNumberList(number: number);
    }
    
    
    func saveDataToStorage(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
            }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "NumberEntity",
                                                    in: managedContext)!
        let numberRecord = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
        
        numberRecord.setValue(enteredNumber.text, forKeyPath: "numberValue")
        numberRecord.setValue(jokeLabel.text, forKeyPath: "numberStatement")
        numberRecord.setValue(false, forKey: "isFavorite")
        
        do {
              try managedContext.save()
            SWAPI_Helper.numbers.append(numberRecord)
            } catch let error as NSError {
              print("Could not save. \(error), \(error.userInfo)")
            }
    }
    
}

