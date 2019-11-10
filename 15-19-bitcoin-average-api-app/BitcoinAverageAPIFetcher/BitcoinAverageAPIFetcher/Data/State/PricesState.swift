//
//  PricesState.swift
//  BitcoinAverageAPIFetcher
//
//  Created by CypherPoet on 11/9/19.
// ✌️
//

import Combine
import CypherPoetSwiftUIKit
import SatoshiVSKit


struct PricesState {
    var pricesIndexData: [BitcoinPrice] = []
}


enum PricesSideEffect: SideEffect {
    case fetchLatestIndexPrices
    
    
    func mapToAction() -> AnyPublisher<AppAction, Never> {
        switch self {
        case .fetchLatestIndexPrices:
            return Dependencies.bitcoinAverageAPIService
                .tickerDataList(for: Dependencies.supportedShitcoins)
                .replaceError(with: [])
                .map { AppAction.prices(.setCurrentPricesList(with: $0)) }
                .eraseToAnyPublisher()
        }
    }
}



enum PricesAction {
    case setCurrentPricesList(with: [BitcoinPrice])
}



// MARK: - Reducer
let pricesReducer = Reducer<PricesState, PricesAction> { state, action in
    
}
