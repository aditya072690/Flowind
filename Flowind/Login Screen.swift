import SwiftUI
import Firebase
import FirebaseAuth


struct LoginView: View {
       @State private var email = ""
       @State private var password = ""
       @State private var confirmPassword = ""
       @State private var errorMessage = ""
       @State private var isSigningUp = false
    var body: some View {
        VStack {
                    Spacer().frame(height: 20)// Reduced spacer at the top
                    
                    Image("login")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 120) // Adjusted image size
                        .padding(.bottom, 10)
                    
                    Text("Create an account")
                        .font(.custom("IBMPlexSansHebrew-Bold", size: 18)) // Slightly smaller font
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text("Enter your email to sign up for this app")
                        .font(.custom("IBMPlexSansHebrew-Regular", size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    Spacer().frame(height: 10)
                    
                    // Email, password, confirm password fields
                    Group {
                        TextField("email", text: $email)
                            .autocapitalization(.none)
                            .padding()
                            .frame(height: 45)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        
                        SecureField("password", text: $password)
                            .padding()
                            .frame(height: 45)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                        
                        SecureField("confirm password", text: $confirmPassword)
                            .padding()
                            .frame(height: 45)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.top, 5)
                    }
                    
                    // Sign up button
                    Button(action: handleSignup) {
                        if isSigningUp {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(Color.green)
                                .cornerRadius(10)
                        } else {
                            Text("Sign up with email")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Error message
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                    }
                    
                    // Divider with "or continue with"
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                        
                        Text("or continue with")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color.gray.opacity(0.4))
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Social buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            // Handle Google signup
                        }) {
                            Image("Google") // Replace with Google logo
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        
                        Button(action: {
                            // Handle Apple signup
                        }) {
                            Image("applelogo")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.top, 10)
                    
                    // Terms and Privacy Policy
                    VStack {
                        Text("By clicking continue, you agree to our ")
                            .font(.custom("IBMPlexSansHebrew-Regular", size: 12))
                            .foregroundColor(.gray)
                        +
                        Text("Terms of Service")
                            .foregroundColor(.black)
                            .font(.custom("IBMPlexSansHebrew-Regular", size: 12))
                            .bold()
                        +
                        Text(" and ")
                            .foregroundColor(.gray)
                            .font(.custom("IBMPlexSansHebrew-Regular", size: 12))
                        +
                        Text("Privacy Policy")
                            .foregroundColor(.black)
                            .font(.custom("IBMPlexSansHebrew-Regular", size: 12))
                            .bold()
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 5)
                    
                    Spacer().frame(height: 10) // Reduced spacer at the bottom
                }
                .navigationBarBackButtonHidden(true)
            }
            
            // Handle Signup Logic
            func handleSignup() {
                guard !email.isEmpty, !password.isEmpty else {
                    errorMessage = "Please fill in all fields."
                    return
                }
                
                guard password == confirmPassword else {
                    errorMessage = "Passwords do not match."
                    return
                }
                
                isSigningUp = true
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    isSigningUp = false
                    if let error = error {
                        errorMessage = error.localizedDescription
                        return
                    }
                    
                    // Signup successful
                    errorMessage = ""
                    print("User signed up successfully: \(authResult?.user.email ?? "")")
                }
            }
    }

struct LoginView_PreviewView: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
