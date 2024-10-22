//
//  authentificationView.swift
//  hahatest
//
//  Created by Xurui Mei on 20/10/24.
//

import SwiftUI

struct authentificationView: View {
    
    @Binding var showSignInView: Bool
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

