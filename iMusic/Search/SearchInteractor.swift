//
//  SearchInteractor.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/17/20.
//  Copyright (c) 2020 Boris Goncharov. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {

  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }
    switch request{
        
    case .some:
        print("interactor .som")
        presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks)
    case .getTracks:
        print("interactor .getTracks")
        presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks)
    }
  }
  
}
