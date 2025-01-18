
import Foundation
import SwiftUI

final class CountryDetailsCoordinator: RouterCoordinator {
    
    weak var parentCoordinator: RouterCoordinator?
    var childCoordinators: [RouterCoordinator] = []
    let router: RouterProtocol
    let detailsViewModel: CountryDetailsViewModel?
    
    init(router: RouterProtocol, viewModel: CountryDetailsViewModel) {
        self.router = router
        detailsViewModel = viewModel
    }
    
    func start() {
        let countryDetailsView = CountryDetailsSceneView(countryDetailsCoordinator: self,
                                                   viewModel: detailsViewModel)
        router.hideNavigation(animated: false)
        router.push(countryDetailsView,
                    onNavigateBack: { [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        })
    }
    
    func backToHome() {
        router.pop(animated: true)
    }
}
