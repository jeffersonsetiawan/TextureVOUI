//
//  TooNestedVC.swift
//  TextureVOUI
//
//  Created by Jefferson Setiawan on 13/09/21.
//

import AsyncDisplayKit

/// Minimal STR to reproduct Texture 2 UI Test issue that can't get the deeper element
class TooNestedVC: ASDKViewController<ASDisplayNode> {
    private let textNode: ASTextNode2 = {
        let node = ASTextNode2()
        node.attributedText = NSAttributedString(string: "Demo for too nested hierarchy")
        node.accessibilityIdentifier = "explanationTextNode"
        return node
    }()
    private let button = ASButtonNode()
    
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .systemBackground
        node.automaticallyManagesSubnodes = true
        button.setAttributedTitle(NSAttributedString(string: "Tap"), for: .normal)
        
        node.layoutSpecBlock = { [unowned self] _, _ in
            let stack = ASStackLayoutSpec.vertical()
            stack.spacing = 16
            stack.children = [textNode, button]
            
            return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), child: stack)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

