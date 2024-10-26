//
//  SettingsView.swift
//  hahatest
//
//  Created by Xurui Mei on 21/10/24.
//

import SwiftUI
import Firebase

@MainActor
final class SettingViewModel: ObservableObject {
    
    func signOut() throws{
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "hello123@gmail.com"
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "hello123"
        try await AuthenticationManager.shared.updatePassword(password: password)
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
            Button ("Reset Password") {
                Task {
                    do {
                        print("PASSWORD RESET!")
                        try await viewModel.resetPassword()
                        print()
                    } catch {
                        print (error)
                    }
                }
            }
            Button ("Update Password") {
                Task {
                    do {
                        print("PASSWORD UPDATED!")
                        try await viewModel.updatePassword()
                        print()
                    } catch {
                        print (error)
                    }
                }
            }
            Button ("Update Email") {
                Task {
                    do {
                        print("EMAIL UPDATED!")
                        try await viewModel.updateEmail()
                        print()
                    } catch {
                        print (error)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
        
    }
    
}
    #Preview {
        SettingsView(showSignInView: .constant(false))
        
        
    }
