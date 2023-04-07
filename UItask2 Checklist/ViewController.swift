//
//  ViewController.swift
//  UItask2 Checklist
//
//  Created by mayank ranka on 27/03/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, GetTestDataDelegate{

    
    var arrayDa : [testdataParser]!
    var arr : [String] = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayDa = [testdataParser]()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        
        let datademo = GetTestData()
        datademo.getWebData()
        datademo.delegate = self
        
        print("ABC")
        }
    
    func loadTableView(){
        if self.tableView == nil {
            
        } else {
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Hello : \(arrayDa.count)")
        return arrayDa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        //        cell!.images.image = UIImage(named: arr[indexPath.row])
        let totalvalue = "\(arrayDa[indexPath.row].totalValue!)"
        let collectionvalue = "\(arrayDa[indexPath.row].collectedValue!)"
        cell.labelTitle.text = arrayDa[indexPath.row].title
        cell.labelSubTitle.text = arrayDa[indexPath.row].shortDescription
        if let urlString = arrayDa[indexPath.row].mainImageURL, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.images.image = UIImage(data: data)
                    }
                   
                }
            }.resume()
        }
            cell.labelTotalCost.text = totalvalue
            cell.labelFundedCost.text = collectionvalue
            return cell
        }
        
    
    func didRecieveData(testData: [testdataParser]) {
        arrayDa = testData
        DispatchQueue.main.async {
            self.loadTableView()
        }
      
    }

    func didRecieveError() {
        
    print("Error Occured")
        
    }
   
}

