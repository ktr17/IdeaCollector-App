//
//  TweetList.swift
//  IdeaCollectorApp
//
//  Created by keitaro on 2020/09/17.
//  Copyright © 2020 keitaro. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct TweetList: View {
    var body: some View {
        List {
            Text("Hello").onTapGesture(perform: fetchTweet)
        }
    }
}

private func fetchTweet() {
    var property: Dictionary<String, Any> = [:]
    let path = Bundle.main.path(forResource: "API", ofType: "plist")
    let configurations = NSDictionary(contentsOfFile: path!)
    if let _: [String: Any] = configurations as? [String:Any] {
        property = configurations as! Dictionary<String, Any>
    }
    let requestUrl = property["requestUrl"] as! String
    
    AF.request(requestUrl).validate().responseJSON { response in
        guard let object = response.data else {
            return
        }
        let tweetJson = JSON(object)
        debugPrint(tweetJson[0]["text"])
    }
}

struct TweetList_Previews: PreviewProvider {
    static var previews: some View {
        TweetList()
    }
}
