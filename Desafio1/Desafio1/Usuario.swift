//
//  Usuario.swift
//  Desafio1
//
//  Created by Mayara Coelho on 3/12/16.
//  Copyright © 2016 Mayara Coelho. All rights reserved.
//

import UIKit

class Usuario: UIViewController {

    @IBOutlet weak var digiteMat: UILabel!
    
    @IBOutlet weak var matriculaNum: UITextField!
    
    var matricula : String?
    
    var alunos:[(nome:String, matricula:String, telefone: String, email: String, uffmail: String, status: String)]?
    
    var teste = []
    
    let error = NSErrorPointer()
    let myURL = NSBundle.mainBundle().URLForResource("alunos", withExtension: "csv")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Faz a leitura do arquivo CSV no momento que a view será carregada
   
        parseCSV(myURL!, encoding: NSUTF8StringEncoding, error: error)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func okButton(sender: AnyObject) {
        
        matricula = matriculaNum.text! as String
        
       var alun = parseCSV(myURL!, encoding: NSUTF8StringEncoding, error: error)
        
        for alun in alunos!
        {
            if( alun.matricula == matricula)
            {
                if(alun.status == "Ativo")
                {

                    if(alun.uffmail != "")
                    {
                        let alert = UIAlertController(title: "Você já posssui um uffmail", message: "E seus status está ativo", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)

                    }
                    else
                    {
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        
                        let criarUffMail = storyBoard.instantiateViewControllerWithIdentifier("mySegueIdentifier") as! CriarUffmail
                        self.presentViewController(criarUffMail, animated:true, completion:nil)
         
                    }
  
                }
                // o aluno não está ativo
                else
                {
                    if(alun.uffmail != "")
                    {
                        let alert = UIAlertController(title: "Você já posssui um uffmail" , message: "E seus status está inativo", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                        
                    }
                    else
                    {
                        let alert = UIAlertController(title: "Você não posssui um uffmail", message: "E seu status está inativo", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }

                }
            }
        }
        
    }
    
    // função responsável pela leitura do arquivo csv.
    func parseCSV (contentsOfURL: NSURL, encoding: NSStringEncoding, error: NSErrorPointer) ->
        [(nome:String, matricula:String, telefone: String, email: String, uffmail: String, status: String)]?
    {
        
        let delimiter = ","
        
        if let data = NSData(contentsOfURL: contentsOfURL)
        {
            if let content = NSString(data: data, encoding: NSUTF8StringEncoding)
            {
                alunos = []
                
                let lines:[String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
                
                for line in lines
                {
                    var values:[String] = []
                    if line != ""
                    {
                        // Para uma linha com aspas duplas
                        // Usamos NSScanner para realizar a análise
                        if line.rangeOfString("\"") != nil
                        {
                            var textToScan:String = line
                            var value:NSString?
                            var textScanner:NSScanner = NSScanner(string: textToScan)
                            while textScanner.string != ""
                            {
                                if (textScanner.string as NSString).substringToIndex(1) == "\""
                                {
                                    textScanner.scanLocation += 1
                                    textScanner.scanUpToString("\"", intoString: &value)
                                    textScanner.scanLocation += 1
                                }
                                else
                                {
                                    textScanner.scanUpToString(delimiter, intoString: &value)
                                }
                                
                                values.append(value as! String)
                                
                                if textScanner.scanLocation < textScanner.string.characters.count
                                {
                                    textToScan = (textScanner.string as NSString).substringFromIndex(textScanner.scanLocation + 1)
                                }
                                else
                                {
                                    textToScan = ""
                                }
                                textScanner = NSScanner(string: textToScan)
                            }
                           
                        }
                        else
                        {
                            values = line.componentsSeparatedByString(delimiter)
                        }
                        
                        // Adiciona um aluno
                        let aluno = (nome: values[0], matricula: values[1], telefone: values[2],
                            email: values[3], uffmail: values[4], status: values[5])
                        
                        if(aluno.matricula == "105457")
                        {
                            print(" FUNFAAA")
                        }
                        
                        alunos?.append(aluno)
                        
                        // Pra cada aluno adicionado, imprime
                        print(aluno)
                        
                    }
                }
            }
        }
        
        return alunos
    }
  
    
}
