//
//  ContentView.swift
//  IdeaCollectorApp
//
//  Created by keitaro on 2020/09/12.
//  Copyright © 2020 keitaro. All rights reserved.
//

import SwiftUI
import Alamofire
import SwiftyJSON


struct ContentView: View {
    var body: some View {
        NavigationView{
            TweetList().navigationBarTitle("Tweet List")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
