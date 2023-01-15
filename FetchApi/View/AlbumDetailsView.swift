//
//  AlbumDetailsView.swift
//  FetchApi
//
//  Created by Pierric Marye on 03/01/2023.
//

import SwiftUI

struct AlbumDetailsView: View {
    @EnvironmentObject var photosVM: PhotoViewModel
    var photo: PhotoModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 25.0) {
            AsyncImage(url: URL(string: photo.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300, height: 300)
            
            Text(photo.title)
                .font(.title2)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}

struct AlbumDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailsView(photo: PhotoModel(
            albumId: 1,
            id: 2,
            title: "accusamus beatae ad facilis cum similique qui sunt",
            url: "https://via.placeholder.com/600/92c952",
            thumbnailUrl: "https://via.placeholder.com/150/92c952")
        )
            .environmentObject(PhotoViewModel())
    }
}
