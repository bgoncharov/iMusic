//
//  Library.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/24/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import SwiftUI

struct Library: View {
    var body: some View {
        
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            print("1234")
                        }, label:  {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9414358735, green: 0.9457926154, blue: 0.9564422965, alpha: 1)))
                                .cornerRadius(10)
                        })
                        Button(action: {
                            print("1234")
                        }, label:  {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)))
                                .background(Color.init(#colorLiteral(red: 0.9414358735, green: 0.9457926154, blue: 0.9564422965, alpha: 1)))
                                .cornerRadius(10)
                        })
                    }
                    
                }.padding().frame(height: 50)
                Divider().padding(.leading).padding(.trailing)
                List {
                    LibraryCell()
                    Text("Second")
                    Text("Third")
                }
            }
            .navigationBarTitle("Library")
        }
    }
}


struct LibraryCell: View {
    var body: some View {
        HStack {
            Image("cover_demo").resizable().frame(width: 60, height: 60).cornerRadius(2)
            VStack {
                Text("Track Name")
                Text("Artist Name")
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
