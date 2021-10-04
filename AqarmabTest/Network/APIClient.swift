//
//  APIClient.swift
//  TestRxSwift
//
//  Created by AnDy on 29/06/2021.
//

import Alamofire
import RxSwift

class APIClient {
    
    // MARK: - Generate Vide Chat Token
    static func generateVideoChatToken(channelId: String) -> Observable<VideoToken> {
        return Request.requestWithResult(APIRouter.generateVideChatToken(channelId: channelId))
    }
        
}
