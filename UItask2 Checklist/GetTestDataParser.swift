//
//  GetTestData.swift
//  UItask2 Checklist
//
//  Created by mayank ranka on 28/03/23.
//

import UIKit

protocol GetTestDataDelegate : NSObjectProtocol {
    func didRecieveData(testData: [testdataParser])
    func didRecieveError()
}

class GetTestData: NSObject , URLSessionDelegate, URLSessionDownloadDelegate{
  
    
    var webData : Data?
    var delegate : GetTestDataDelegate!

    var session : URLSession {
        let defaultConfig = URLSessionConfiguration.default
        defaultConfig.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        
        let session1 = URLSession(configuration: defaultConfig, delegate: self, delegateQueue: nil)
        
        return session1
    }
    
    func getWebData(){
        
        // Created an URL
        let url = URL(string: "https://testffc.nimapinfotech.com/testdata.json")
        
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do{
            webData = try Data(contentsOf: location)
            let responseString = String(data: webData!, encoding: String.Encoding.utf8)
            print("ResposeString:\(responseString!)")
            
            let result = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
            
            let jsonData = result["data"] as? [String : Any]

            if  let records = jsonData!["Records"] as? [[String : Any]] {
                var datavalue : [testdataParser] = []
                for i in 0..<records.count{
                    let user = testdataParser(dictionary: records[i])
                    datavalue.append(user)
                }
                print(datavalue)
                delegate?.didRecieveData(testData: datavalue)
                
//                for i in 0..<records.count {
//                    let testDataModel = testdataParser(dictionary: records[i])
//                    testDataArray.append(testDataModel)
//                }
//                delegate.didRecieveData(testData: testDataArray)
//                print(testDataArray[0])
//            }
                
                
                
            }
            
        }catch{
            print("Error Occurred")
    
        }
    }

}
