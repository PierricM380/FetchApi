//
//  ContentView.swift
//  FetchApi
//
//  Created by Pierric Marye on 03/01/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var photosVM: PhotoViewModel
    
    var body: some View {
        NavigationView {
            List(photosVM.photos) { photo in
                NavigationLink {
                    AlbumDetailsView(photo: photo)
                } label: {
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: photo.thumbnailUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 75, height: 75)
                        
                        Spacer()
                        
                        Text("\(photo.id)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding(.trailing, 25.0)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Album photos 📔")
            .onAppear {
                photosVM.getPhotos()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PhotoViewModel())
    }
}
