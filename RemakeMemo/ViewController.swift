//
//  ViewController.swift
//  RemakeMemo
//
//  Created by 倉富直城 on 2017/11/04.
//  Copyright © 2017年 com.kuratomi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var memoArray = [String]()
    @IBOutlet var memoTableView :UITableView!

    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoTableView.dataSource = self
        memoTableView.delegate = self
        
        //カスタムセルの登録
        let nib = UINib(nibName: "MemoTableViewCell", bundle: Bundle.main)
        memoTableView.register(nib, forCellReuseIdentifier: "MemoCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //1,TableViewに表示するデータの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }

    //2,TableViewに表示するデータの内容(カスタムsルver)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //idをつけたセルの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell") as! MemoTableViewCell
        //表示内容を決める
        cell.memoLabel.text = memoArray[indexPath.row]
        //cellを返す
        return cell
    }
    
    /*2,TableViewに表示するデータの内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //idをつけたセルの取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell")!
        //表示内容を決める
        cell.textLabel?.text = memoArray[indexPath.row]
        //cellを返す
        return cell
    }*/
    
    func loadMemo(){
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil {
            memoArray = ud.array(forKey: "memoArray") as! [String]
            memoTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
        let detailVIewController = segue.destination as! DetailViewController
        let selectedIndexPath = memoTableView.indexPathForSelectedRow!
        detailVIewController.selectedMemo = memoArray[selectedIndexPath.row]
        detailVIewController.selectedRow = selectedIndexPath.row
        }
    }
}

