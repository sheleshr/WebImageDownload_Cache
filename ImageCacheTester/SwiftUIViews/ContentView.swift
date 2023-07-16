//
//  ContentView.swift
//  Swiftui-component-demo
//
//  Created by Administrator on 19/06/23.
//

import SwiftUI
import UIKit
struct ContentView: View {
    var body: some View {
        List(arrMediaInfo, id: \.id) { mediaInfo in
            HStack {
                SWebImageSwiftUI(url: URL(string: mediaInfo.urlStr),image: nil)
                    .frame(width:150)
                
                Text(mediaInfo.title).fontWeight(.heavy)
                Spacer()
            }
                .frame(height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
