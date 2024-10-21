//
//  SettingsView.swift
//  hahatest
//
//  Created by Xurui Mei on 21/10/24.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
        
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingViewModel ()
    @Binding var showSignInView: Bool
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
            }
        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    SettingsView(showSignInView: .constant(false))
}
