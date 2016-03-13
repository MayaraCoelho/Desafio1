//
//  CriarUffmail.swift
//  Desafio1
//
//  Created by Mayara Coelho on 3/13/16.
//  Copyright © 2016 Mayara Coelho. All rights reserved.
//

import UIKit

class CriarUffmail: UIViewController {

    var perfil : Usuario

    required init?(coder aDecoder: NSCoder) {
        self.perfil = Usuario()
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
