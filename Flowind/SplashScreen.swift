import SwiftUI
import Lottie

struct SplashScreen: View {
    @State private var textOffset: CGFloat = 0.0 // Start off-screen to the left
    @State private var textOpacity: Double = 0.0 // Start fully transparent
    @State private var isAnimationComplete = false // Control navigation

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.white // Background color
                        .ignoresSafeArea()

                    VStack {
                        Spacer()
                        HStack {
                            Image("logo") // Logo asset
                                .resizable()
                                .frame(width: 40, height: 40)

                            Text("Flowind")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.green)
                                .offset(x: textOffset)
                                .opacity(textOpacity)
                                .onAppear {
                                    withAnimation(.easeOut(duration: 1.5)) {
                                        textOffset = 20 // Move to the center
                                        textOpacity = 1.0 // Fade in
                                    }
                                }
                        }
                        Spacer()
                    }
                }
                .onAppear {
                    // Wait for 7 seconds, then mark the animation as complete
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                        isAnimationComplete = true
                    }
                }
                .navigationDestination(isPresented: $isAnimationComplete) {
                    OnboardingView() // Navigate to OnboardingView
                }
            }
        }
    }
}

struct OnboardingScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Flowind!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        .background(Color.green.opacity(0.1).ignoresSafeArea())
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
