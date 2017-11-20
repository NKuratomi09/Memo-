//
//  DetailViewController.swift
//  RemakeMemo
//
//  Created by 倉富直城 on 2017/11/04.
//  Copyright © 2017年 com.kuratomi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedRow:Int!
    var selectedMemo: String!
    @IBOutlet var memoTextView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        memoTextView.text = selectedMemo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func deleteMemo(_ sender: Any) {
        
        //アラートの追加
        let alert = UIAlertController(title: "確認", message: "本当に削除しますか？", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "はい", style: .default, handler: {(action)in
            
            //「はい」って言ったら以下実行
            let ud = UserDefaults.standard
            if ud.array(forKey: "memoArray") != nil{
                var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
                saveMemoArray.remove(at: self.selectedRow)
                ud.set(saveMemoArray, forKey: "memoArray")
                ud.synchronize()
                
                self.navigationController?.popViewController(animated: true)
            }
        })
        let noAction = UIAlertAction(title: "いいえ", style: .default, handler: {(action)in
            alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert,animated: true,completion: nil)
       
    }
}
