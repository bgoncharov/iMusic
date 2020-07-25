//
//  Library.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/24/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import SwiftUI
import URLImage

struct Library: View {
    
    @State var tracks = UserDefaults.standard.savedTracks()
    @State private var showingAlert = false
    @State private var track: SearchViewModel.Cell!
    
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
                    ForEach(tracks) { track in
                        LibraryCell(cell: track).gesture(LongPressGesture().onEnded({ _tracks in
                            print("Pressed")
                            self.track = track
                            self.showingAlert = true
                        }))
                    }.onDelete(perform: delete)
                }
            }.actionSheet(isPresented: $showingAlert, content: {
                ActionSheet(title: Text("Are you sure you want to delet this track?"), buttons: [.destructive(Text("Delete"), action: {
                    print("Deliting: \(self.track.trackName)")
                    self.delete(track: self.track)
                }), .cancel()
                ])
            })
                .navigationBarTitle("Library")
        }
    }
    
    func delete(at offset: IndexSet) {
        tracks.remove(atOffsets: offset)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
    func delete(track: SearchViewModel.Cell) {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else { return }
        tracks.remove(at: myIndex)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
}

struct LibraryCell: View {
    
    var cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            URLImage(URL(string: cell.iconUrlString ?? "")!).frame(width: 60, height: 60).cornerRadius(2)
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
