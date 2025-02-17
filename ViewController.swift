//
//  ViewController.swift
//  page72
//
//  Created by Sadyk on 18.12.2024.
//

import UIKit

class ViewController: UIViewController{
    var result:Welcome?
    var todoArray:[Todo] = []
    var selekted:IndexPath = []
    var selected = 0
   
    @IBAction func addBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Add cell", message: nil, preferredStyle: .alert)
        alert.addTextField { cellTf in
            cellTf.placeholder = "Enter"
        }
        let action = UIAlertAction(title: "Add", style: .default){ [self] (_) in
            guard let des = alert.textFields?.first?.text else {return}
            self.result!.todos.append(contentsOf: todoArray)
            self.tableView.reloadData()
            
        }
        alert.addAction(action)
        present(alert,animated: true)
    }
    
    let cell = "cell"
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      //  configUI()
        dfds()
        tableView.reloadData()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
   
        
        
        
        
        func dfds(){
        
            let jsonObject = """

{
"todos": [
{
"id": 1,
"todo": "Do something nice for someone you care about",
"completed": false,
"userId": 152
},
{
"id": 2,
"todo": "Memorize a poem",
"completed": true,
"userId": 13
},
{
"id": 3,
"todo": "Watch a classic movie",
"completed": true,
"userId": 68
},
{
"id": 4,
"todo": "Watch a documentary",
"completed": false,
"userId": 84
},
{
"id": 5,
"todo": "Invest in cryptocurrency",
"completed": false,
"userId": 163
},
{
"id": 6,
"todo": "Contribute code or a monetary donation to an open-source software project",
"completed": false,
"userId": 69
},
{
"id": 7,
"todo": "Solve a Rubik's cube",
"completed": true,
"userId": 76
},
{
"id": 8,
"todo": "Bake pastries for yourself and neighbor",
"completed": true,
"userId": 198
},
{
"id": 9,
"todo": "Go see a Broadway production",
"completed": false,
"userId": 7
},
{
"id": 10,
"todo": "Write a thank you letter to an influential person in your life",
"completed": true,
"userId": 9
},
{
"id": 11,
"todo": "Invite some friends over for a game night",
"completed": false,
"userId": 104
},
{
"id": 12,
"todo": "Have a football scrimmage with some friends",
"completed": false,
"userId": 32
},
{
"id": 13,
"todo": "Text a friend you haven't talked to in a long time",
"completed": true,
"userId": 2
},
{
"id": 14,
"todo": "Organize pantry",
"completed": false,
"userId": 46
},
{
"id": 15,
"todo": "Buy a new house decoration",
"completed": true,
"userId": 105
},
{
"id": 16,
"todo": "Plan a vacation you've always wanted to take",
"completed": true,
"userId": 162
},
{
"id": 17,
"todo": "Clean out car",
"completed": false,
"userId": 71
},
{
"id": 18,
"todo": "Draw and color a Mandala",
"completed": true,
"userId": 6
},
{
"id": 19,
"todo": "Create a cookbook with favorite recipes",
"completed": true,
"userId": 53
},
{
"id": 20,
"todo": "Bake a pie with some friends",
"completed": false,
"userId": 162
},
{
"id": 21,
"todo": "Create a compost pile",
"completed": false,
"userId": 13
},
{
"id": 22,
"todo": "Take a hike at a local park",
"completed": true,
"userId": 37
},
{
"id": 23,
"todo": "Take a class at local community center that interests you",
"completed": true,
"userId": 65
},
{
"id": 24,
"todo": "Research a topic interested in",
"completed": true,
"userId": 130
},
{
"id": 25,
"todo": "Plan a trip to another country",
"completed": false,
"userId": 140
},
{
"id": 26,
"todo": "Improve touch typing",
"completed": false,
"userId": 178
},
{
"id": 27,
"todo": "Learn Express.js",
"completed": false,
"userId": 194
},
{
"id": 28,
"todo": "Learn calligraphy",
"completed": false,
"userId": 80
},
{
"id": 29,
"todo": "Have a photo session with some friends",
"completed": true,
"userId": 91
},
{
"id": 30,
"todo": "Go to the gym",
"completed": true,
"userId": 142
}
],
"total": 254,
"skip": 0,
"limit": 30
}

"""
            
            let jsonObjectData = jsonObject.data(using: .utf8)
            let decoder = JSONDecoder()
            do{
                result =  try? JSONDecoder().decode( Welcome.self,from: jsonObjectData!)
                
                print(result)
            }catch{
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            print(result?.todos ?? 00)
            
        }
        
    }
    
    @IBAction func tapBt(_ sender: Any) {
        tableView.setEditing(true, animated: true)
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.todos.count ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as! ToDoLiTableViewCell)
        
        
        let task = result?.todos[indexPath.row]
        
        cell.titlleLabel.text = task?.todo
        cell.myImage.image = UIImage.init(systemName: "circle.fill")
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.name = (result?.todos[indexPath.row].todo)!
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? ToDoLiTableViewCell else {return}
        cell.myImage.image = UIImage.init(systemName: "checkmark.gobackward")
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            result?.todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
           
        
        }
        
        
    }
    
}

