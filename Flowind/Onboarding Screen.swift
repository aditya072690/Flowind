import SwiftUI

struct OnboardingView: View {

    var body: some View {
            VStack {
                Spacer()
                
                Image("OnboardingView") // Replace with custom image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 387)
                    .padding()
                
                Text("Supercharge Your Productivity")
                    .font(.custom("IBMPlexSansHebrew-Regular", size: 28))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                HStack(spacing: 10) {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                    Circle()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 10, height: 10)
                }
                .padding(.bottom, 20)
                
                //            Button(action: {
                //                SignupView() // Navigate to
                //            }) {
                //                Text("Get Started")
                //                    .font(.headline)
                //                    .foregroundColor(.white)
                //                    .frame(maxWidth: .infinity)
                //                    .padding()
                //                    .background(Color.green)
                //                    .cornerRadius(10)
                //            }
                NavigationLink(destination: SignupView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .navigationBarBackButtonHidden(true)
                }
                .padding(.horizontal, 20)
                
                Spacer(minLength: 40)
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
