//
//  RootView.swift
//  hahatest
//
//  Created by Xurui Mei on 21/10/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authuser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authuser == nil
            
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                authentificationView()
            }
        }
    }
    
}
    #Preview {
        NavigationStack{
            RootView()
        }
    }

