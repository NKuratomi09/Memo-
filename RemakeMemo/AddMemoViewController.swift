//
//  AddMemoViewController.swift
//  RemakeMemo
//
//  Created by 倉富直城 on 2017/11/04.
//  Copyright © 2017年 com.kuratomi. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet var memoTextView :UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(_ sender: Any) {
        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray")! as! [String]
            
            if inputText != ""{
                saveMemoArray.append(inputText!)
            }else{
                let alert = UIAlertController(title: "エラー", message: "何も入力されていません", preferredStyle: .alert)
                let errorAction = UIAlertAction(title: "OK", style: .default, handler: {(action)in
                    alert.dismiss(animated: true, completion: nil)
                })
                alert.addAction(errorAction)
                self.present(alert,animated: true,completion: nil)
            }
            ud.set(saveMemoArray, forKey: "memoArray")
        }else{
            var newMemoArray = [String]()
            if inputText != nil{
                newMemoArray.append(inputText!)
            }else{
                print("メモが入っていません")
            }
            ud.set(newMemoArray, forKey: "memoArray")
        }
        ud.synchronize()
        self.navigationController?.popViewController(animated: true)

    }

}
