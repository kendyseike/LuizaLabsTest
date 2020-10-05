//
//  ResponseHandler.swift
//  LuizaLabsTest
//
//  Created by Kendy Nagao on 04/10/20.
//  Copyright © 2020 Kendy Nagao. All rights reserved.
//

enum ResponseErrors: String {
    case not_found = "Not Found Error"
    case invalid_request = "Invalid Request"
    case unexpected_error_user = "Não foi possível carregar as informações do usuário, tente novamente"
    case unexpected_error_tweets = "Não foi possível carregar os tweets, tente novamente"
    case unexpected_error_sentiment = "Não foi possível calcular o sentimento do texto, tente novamente"
    case generic_unexpected_error = "Erro inesperado :/"
}
