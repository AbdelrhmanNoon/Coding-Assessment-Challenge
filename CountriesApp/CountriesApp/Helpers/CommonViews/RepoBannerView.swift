
import Foundation
import SwiftUI

struct CountryBannerView: View {
    
    var isProfileAvailable = true
    var capitalname: String
    var countryName: String
    var flagAvatar: String
    @State private var isFavorited: Bool = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    AsyncImageView(url: flagAvatar)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    Text(countryName)
                        .font(.system(size: 16))
                    Spacer()
                    
                    Button {
                        isFavorited.toggle() // Toggle the state when the button is tapped
                        print("Button was tapped, isFavorited: \(isFavorited)")
                    } label: {
                        // Change the image based on the state
                        Image(isFavorited ? "favorite-icon" : "un-favorite-icon")
                            .resizable()
                            .frame(width: 30, height: 30) // Set the size of the image
                    }
                }
                
                HStack {
                    Text("Capital :")
                        .fontWeight(.medium)
                    Text(capitalname)
                        .font(.subheadline)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.lightGray, lineWidth: 2)
        )
        .frame(height: isProfileAvailable ? 150 : 120)
    }
}
