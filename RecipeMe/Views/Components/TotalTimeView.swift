//
//  TotalTimeView.swift
//  RecipeMe
//
//  Created by Goyo Vargas on 5/21/22.
//

import SwiftUI

struct TotalTimeView: View {
    let totalTime: Int
    
    var body: some View {
        HStack {
            Image(systemName: "clock")
            Text("\(totalTime) min")
        }
    }
}

struct TotalTimeView_Previews: PreviewProvider {
    static var previews: some View {
        TotalTimeView(totalTime: 30)
    }
}
