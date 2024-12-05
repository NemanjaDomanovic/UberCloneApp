//
//  HomeView.swift
//  UberCloneApp
//
//  Created by Nemanja Domanovic on 12/5/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack (alignment: .top) {
            UberMapViewRepresentable()
                .ignoresSafeArea()
            
            _LocationSearchActivationView()
                .padding(.top, 72)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
