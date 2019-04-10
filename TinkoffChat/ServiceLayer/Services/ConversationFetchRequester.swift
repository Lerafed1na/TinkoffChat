//
//  ConversationFetchRequester.swift
//  TinkoffChat
//
//  Created by Valeriia Korenevich on 09/04/2019.
//  Copyright © 2019 Valeriia Korenevich. All rights reserved.
//

import Foundation
import CoreData

protocol IConversationFetchRequester: class {
    func fetchConversations() -> NSFetchRequest<Conversation>
    func fetchConversationsOnline() -> NSFetchRequest<Conversation>
    func fetchConversationBy(id: String) -> NSFetchRequest<Conversation>
}

class ConversationFetchRequester: IConversationFetchRequester {
    func fetchConversations() -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        let dateSortDescriptor = NSSortDescriptor(key: "date",
                                                  ascending: false)
        let onlineSortDescriptor = NSSortDescriptor(key: "isOnline",
                                                    ascending: false)
        request.sortDescriptors = [onlineSortDescriptor,
                                   dateSortDescriptor]
        return request
    }
    
    func fetchConversationsOnline() -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        request.predicate = NSPredicate(format: "isOnline == YES")
        return request
    }
    
    func fetchConversationBy(id: String) -> NSFetchRequest<Conversation> {
        let request: NSFetchRequest<Conversation> = Conversation.fetchRequest()
        request.predicate = NSPredicate(format: "conversationId == %@",
                                        id)
        return request
    }
}
