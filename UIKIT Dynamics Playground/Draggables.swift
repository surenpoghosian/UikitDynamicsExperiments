//
//  Draggables.swift
//  UIKIT Dynamics Playground
//
//  Created by Suren Poghosyan on 24.09.23.
//

import UIKit

class DraggableViewController: UIViewController {
    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = UIColor.blue
        view.addSubview(squareView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        squareView.addGestureRecognizer(panGesture)
        
        animator = UIDynamicAnimator(referenceView: view)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: view)
        let boxLocation = gesture.location(in: squareView)
        
        if gesture.state == .began {
            let centerOffset = UIOffset(horizontal: boxLocation.x - squareView.bounds.midX, vertical: boxLocation.y - squareView.bounds.midY)
            attachmentBehavior = UIAttachmentBehavior(item: squareView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            animator.addBehavior(attachmentBehavior)
        } else if gesture.state == .changed {
            attachmentBehavior.anchorPoint = location
        } else if gesture.state == .ended {
            animator.removeBehavior(attachmentBehavior)
        }
    }
}
