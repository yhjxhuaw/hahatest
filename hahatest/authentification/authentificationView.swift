//
//  authentificationView.swift
//  hahatest
//
//  Created by Xurui Mei on 20/10/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth


struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    
}


@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw  URLError(.cannotFindHost)
        }
        
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
    //    gidSignInResult.
        
        guard let idToken: String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        
        let tokens = GoogleSignInResultModel( idToken: idToken, accessToken: accessToken)
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
        
    }
    
}


struct authentificationView: View {
    
  
    @Binding var showSignInView: Bool
    @StateObject private var viewModel = AuthenticationViewModel ()
    
    var body: some View {
        VStack {
            
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label:{
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                
            }
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                Task{
                    
                    do{
                        try await viewModel.signInGoogle()
                        showSignInView = false
                    } catch {
                        print (error)
                    }
                }
                
            }
            Spacer()
           
                
            }
        .padding()
        .navigationTitle("Sign In")
        }
       
    }


#Preview {
    NavigationStack{
        authentificationView(showSignInView: .constant(false))
    }
}

