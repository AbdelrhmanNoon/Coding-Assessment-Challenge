
import Foundation
import SwiftUI

struct CountryDetailsSceneView: View {
    
    //MARK: - Variables -
    var coordinator: CountryDetailsCoordinator?
    var detailsViewModel: CountryDetailsViewModel?
    
    init(countryDetailsCoordinator: CountryDetailsCoordinator? = nil,
         viewModel: CountryDetailsViewModel? = nil ) {
        coordinator = countryDetailsCoordinator
        detailsViewModel = viewModel
    }
    
    //MARK: - Scene View -

    var body: some View {
        VStack {
            Color.extraLightPurple
                .frame(height: 300)
                .cornerRadius(30)
                .overlay {
                    VStack {
                        makeHeaderView()
                            .padding(.top, 50)
                        Spacer()
                        AsyncImageView(url: detailsViewModel?.country?.flags?.png ?? "")
                            .frame(width: 80,height: 80)
                            .clipShape(Circle())
                            .padding(.bottom,20)
                        Text((detailsViewModel?.country?.name ?? ""))
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .ignoresSafeArea(.all)
           // makeFullNameView()
            makeDescriptionHeaderView()
            makeForkHeaderView()
            Spacer()
        }
    }
    
    //MARK: - View Builders -

    @ViewBuilder private func makeHeaderView() -> some View {
        HStack {
            Button(action: {
                coordinator?.backToHome()
            }) {
                Image("chevron-left")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .font(.title)
            }
            Spacer()
            Text("Details")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.gray)
            Spacer()
            Button(action: { }) {
                Image("notification-icon")
                    .resizable()
                    .frame(width: 24,height: 24)
                    .font(.title)
            }
        }
        .padding()
    }
    
    
    @ViewBuilder private func makeFullNameView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Country name:")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.lightPurble)
                
                Spacer()
            }
            .padding(.horizontal)
            
            Text(detailsViewModel?.country?.name ?? "")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .padding(.horizontal)

        }
       
    }
    
    @ViewBuilder private func makeForkHeaderView() -> some View {
            HStack {
                Text("Currency:")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.lightPurble)
                
                Text((detailsViewModel?.country?.currencies?.first?.name ?? "" ))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
    }
    
    @ViewBuilder private func makeDescriptionHeaderView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Capital:")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.lightPurble)
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 10)
            Text(detailsViewModel?.country?.capital ?? "")
                .multilineTextAlignment(.leading)
                .foregroundColor(.gray)
                .padding(.horizontal)
        }
    }
}

#Preview {
    CountryDetailsSceneView()
}
