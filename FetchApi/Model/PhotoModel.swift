//
//  PhotoModel.swift
//  FetchApi
//
//  Created by Pierric Marye on 03/01/2023.
//

import Foundation
import SwiftUI

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
