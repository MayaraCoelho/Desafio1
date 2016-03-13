//
//  ViewController.swift
//  Desafio1
//
//  Created by Mayara Coelho on 3/12/16.
//  Copyright © 2016 Mayara Coelho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        // Faz a leitura do arquivo CSV no momento que a view será carregada
//        let error = NSErrorPointer()
//        let myURL = NSBundle.mainBundle().URLForResource("alunos", withExtension: "csv")
//        
//        parseCSV(myURL!, encoding: NSUTF8StringEncoding, error: error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    // função responsável pela leitura do arquivo csv.
//    func parseCSV (contentsOfURL: NSURL, encoding: NSStringEncoding, error: NSErrorPointer) ->
//        [(nome:String, matricula:String, telefone: String, email: String, uffmail: String, status: String)]?
//    {
//
//        let delimiter = ","
//        
//        var alunos:[(nome:String, matricula:String, telefone: String, email: String, uffmail: String, status: String)]?
//        
//        if let data = NSData(contentsOfURL: contentsOfURL)
//        {
//            if let content = NSString(data: data, encoding: NSUTF8StringEncoding)
//            {
//                alunos = []
//                
//                let lines:[String] = content.componentsSeparatedByCharactersInSet(NSCharacterSet.newlineCharacterSet()) as [String]
//                
//                for line in lines
//                {
//                    var values:[String] = []
//                    if line != ""
//                    {
//                        // Para uma linha com aspas duplas
//                        // Usamos NSScanner para realizar a análise
//                        if line.rangeOfString("\"") != nil
//                        {
//                            var textToScan:String = line
//                            var value:NSString?
//                            var textScanner:NSScanner = NSScanner(string: textToScan)
//                            while textScanner.string != ""
//                            {
//                                if (textScanner.string as NSString).substringToIndex(1) == "\""
//                                {
//                                    textScanner.scanLocation += 1
//                                    textScanner.scanUpToString("\"", intoString: &value)
//                                    textScanner.scanLocation += 1
//                                }
//                                else
//                                {
//                                    textScanner.scanUpToString(delimiter, intoString: &value)
//                                }
//                                
//                                values.append(value as! String)
//                                
//                                if textScanner.scanLocation < textScanner.string.characters.count
//                                {
//                                    textToScan = (textScanner.string as NSString).substringFromIndex(textScanner.scanLocation + 1)
//                                }
//                                else
//                                {
//                                    textToScan = ""
//                                }
//                                textScanner = NSScanner(string: textToScan)
//                            }
//                            
//                            
//                        }
//                        else
//                        {
//                            values = line.componentsSeparatedByString(delimiter)
//                        }
//                        
//                        // Adiciona um aluno
//                        let aluno = (nome: values[0], matricula: values[1], telefone: values[2],
//                            email: values[3], uffmail: values[4], status: values[5])
//                        
//                        alunos?.append(aluno)
//                        
//                        // Pra cada aluno adicionado, imprime (é o que vc vê na tela!)
//                        print(aluno)
//                    }
//                }
//            }
//        }
//        
//        return alunos
//    }


}

