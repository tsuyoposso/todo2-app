//
//  ViewController.swift
//  todo2-app
//
//  Created by 長坂豪士 on 2019/09/06.
//  Copyright © 2019 Tsuyoshi Nagasaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var todoList = [String]()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // +ボタンをタップしたときに呼ばれる処理
    @IBAction func tapAddButton(_ sender: Any) {
        
        // アラートダイアログの生成
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください", preferredStyle: UIAlertController.Style.alert)
        
        // テキストエリアをアラートダイアログに追加
        alertController.addTextField(configurationHandler: nil)
        // OKボタンの追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action: UIAlertAction) in
            // OKボタンがタップされた時の処理
            // オプショナルバインディング?? -> オプショナル型で入力された値が配列の先頭に入るかどうか
            if let textField = alertController.textFields?.first {
                // ToDoの配列に入力値を挿入。先頭に挿入する
                self.todoList.insert(textField.text!, at: 0)
                // テーブルに行が追加されたことをテーブルに通知する
                self.tableView.insertRows(at: [IndexPath(row:0, section: 0)], with: UITableView.RowAnimation.right)
            }
        }
        
        // OKボタンをタップされた時の処理(のインスタンスメソッド)
        alertController.addAction(okAction)
        // CANCELボタンを追加
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        // CANCELボタンがタップされた時の処理(のインスタンスメソッド)
        alertController.addAction(cancelButton)
        // アラートダイアログの表示
        present(alertController, animated: true, completion: nil)
        
        
        
    }
    
    
    // テーブルの行数を返却する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ToDoの配列の長さ(配列内の個数？)を返却する
        return todoList.count
    }
    
    // テーブルの行ごとのセルを返却する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Storyboardで指定したtodoCell識別子を利用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        // 行番号にあったToDoのタイトルを取得
        let todoTitle = todoList[indexPath.row]
        // セルのラベルにToDoのタイトルをセット
        cell.textLabel?.text = todoTitle
        return cell
    }
    




}

