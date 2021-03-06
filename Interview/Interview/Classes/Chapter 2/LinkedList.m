//
//  LinkedList.m
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

@interface LinkedList()

@property (strong, nonatomic) Node *head;
@property (weak, readwrite, nonatomic) Node *tail;
@property (readwrite, nonatomic) NSUInteger length;

@end

@implementation LinkedList

- (id) init {
    if (self = [super init]) {
        self.length = 0;
    }
    
    return self;
}

- (void) append:(id)data {
    Node *n = [Node new];
    n.data = data;
    
    [self appendNode:n];
}

- (void) prepend:(id)data {
    //create a new node and associate data
    Node *n = [Node new];
    n.data = data;
    
    [self prependNode:n];
}

- (void) appendNode:(Node *)node {
    
    //point tail to this node
    self.tail.next = node;
    //repoint tail to this
    self.tail = node;
    
    //if this is the only node, it's also head
    if (!self.head) {
        self.head = node;
    }
    
    self.length++;
}

- (void) prependNode:(Node *)node {
    //attempt to point to next as current head if it exists
    node.next = self.head;
    
    //head is now the new node
    self.head = node;
    
    //if this is the only node, it's also tail
    if (!self.head.next) {
        self.tail = node;
    }
    
    self.length++;
}

//TODO: fix length
- (void) updateHeadNode:(Node *)newHead tailNode:(Node *)newTail {
    self.head = newHead;
    self.tail = newTail;
}

- (void) removeNode:(Node*)node {
    
    if (node == self.head && node == self.tail) {
        //if this is the only node, just nil out the refs
        self.head = nil;
        self.tail = nil;
    } else if (node == self.head) {
        //if this is the head node, just push it forward
        self.head = self.head.next;
    } else {
        //if this is not the head node, find the node before it, and move it 1 past
        Node *n = self.head;
        
        //iterate through the list
        while (n) {
            //if this node's next is the node
            if (n.next == node) {
                
                //move n past the node to remove
                n.next = node.next;
                
                //if it didn't have a next, it was tail
                if (n.next == nil) {
                    self.tail = n;
                }
                
                break;
            }
            
            n = n.next;
        }
    }
    
    self.length--;
}

- (void) removeNode:(Node *)node previousNode:(Node *)prev {
    //if this node is head, we already have O(1) removal, leverage the other function
    if (node == self.head) {
        [self removeNode:node];
    } else {
        //this should only be called if prev is actually directly adjacent to and points to node
        NSParameterAssert(prev.next == node);
        prev.next = node.next;
        
        if (prev.next == nil) {
            self.tail = prev;
        }
        
        self.length --;
    }
}

- (NSString*) description {
    NSMutableString *string = [NSMutableString string];
    
    Node *n = self.head;
    
    while (n) {
        [string appendFormat:@"%@ -> %@", n, n.next ? @"" : @"null"];
        n = n.next;
    }
    
    return string.copy;
}

@end
