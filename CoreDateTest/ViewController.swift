//
//  ViewController.swift
//  CoreDateTest
//
//  Created by BenLacroix on 15/12/2014.
//  Copyright (c) 2014 Benobab. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    //Storyboard Text Field
    @IBOutlet weak var userNameTextFIeld: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    
    //Méthodes des boutons de la storyBoard
    @IBAction func loadButtonPressed(sender: UIButton) {
        //pour avoir le contexte actuel (BDD quoi)
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        var result: NSArray = context.executeFetchRequest(request, error: nil)!
        
        if(result.count > 0)
        {
            var res = result[0] as NSManagedObject
            userNameTextFIeld.text = res.valueForKey("username") as String
            passWordTextField.text = res.valueForKey("password") as String
        }
        
        
    }
    @IBAction func saveButtonPressed(sender: UIButton) {
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        //création d'un utilisateur via xcdatamodel
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("" + userNameTextFIeld.text, forKey: "username")
        newUser.setValue("" + passWordTextField.text, forKey: "password")
        context.save(nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

