//
//  CCILinkedLists.m
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "CCILinkedLists.h"

#import "LinkedList.h"
#import "Node.h"

@implementation CCILinkedLists


/*! 2.1 Write code to remove duplicates from an unsorted linked list.
 FOLLOW UP
 How would you solve this problem if a temporary buffer is not allowed?
 */

- (void) removeDupes:(LinkedList*)list {
    
    //go through the list, try to fetch each item out of a set
        //if the item was found in the set, remove this object
        //if the item was not found, add it to the set and continue forward
    
    NSMutableSet *set = [NSMutableSet set];
    
    Node *n = list.head;
    Node *prev = nil;
    
    while (n != nil) {
        
        //object not found, add it to the set
        if (![set containsObject:n.data]) {
            [set addObject:n.data];
        } else {
            //dupe, skip past this node
            prev.next = n.next;
            
            //memory management: clean everything up so it'll get ARC-released
            n.data = nil;
            n.next = nil;
        }
        
        prev = n;
        n = n.next;
    }
    
}

@end
