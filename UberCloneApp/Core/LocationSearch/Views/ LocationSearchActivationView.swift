//
//   LocationSearchActivationView.swift
//  UberCloneApp
//
//  Created by Nemanja Domanovic on 12/5/24.
//

import SwiftUI

struct _LocationSearchActivationView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Gde idete?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64,
        height: 50)
        .background(
            RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .shadow(color: .black, radius: 6)
        )
    }
}

#Preview {
    _LocationSearchActivationView()
}
