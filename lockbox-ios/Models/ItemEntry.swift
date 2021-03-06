/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation

struct ItemEntry : Codable, Equatable {
    var type:String
    var username:String?
    var password:String?
    
    init(type:String) {
        self.type = type
    }
    
    static func ==(lhs: ItemEntry, rhs: ItemEntry) -> Bool {
        return
            lhs.type == rhs.type &&
                lhs.password == rhs.password &&
                lhs.username == rhs.username
    }
    
    class Builder {
        private var itemEntry:ItemEntry!
        
        init() {
            self.itemEntry = ItemEntry(type:"")
        }
        
        func build() -> ItemEntry {
            return self.itemEntry
        }
        
        func type(_ type:String) -> Builder {
            self.itemEntry.type = type
            return self
        }
        
        func username(_ username:String) -> Builder {
            self.itemEntry.username = username
            return self
        }
        
        func password(_ password:String) -> Builder {
            self.itemEntry.password = password
            return self
        }
    }
}
