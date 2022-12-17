//
//  UpdateViewController.swift
//  swapi
//
//  Created by Vamsi Allu on 17/12/22.
//

import UIKit
import CoreData

class UpdateViewController: UIViewController {

    var numberSelected = NSManagedObject();
    
    @IBOutlet var labelData: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelData.text = numberSelected.value(forKeyPath: "numberStatement") as? String
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func markAsFavorite(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return
            }
        let context = appDelegate.persistentContainer.viewContext
        numberSelected.setValue(true, forKey: "isFavorite")
              
            do {
                
                do {
                        try context.save()
                        print("saved!")
                      } catch let error as NSError  {
                        print("Could not save \(error), \(error.userInfo)")
                      } catch {
                        
                      }
                      
                    } catch {
                      print("Error with request: \(error)")
                    }
    }
}
