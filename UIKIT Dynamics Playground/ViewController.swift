//
//  ViewController.swift
//  UIKIT Dynamics Playground
//
//  Created by Suren Poghosyan on 24.09.23.
//

import UIKit

class ViewController: UIViewController {
//    var animator: UIDynamicAnimator!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            let squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//            squareView.backgroundColor = UIColor.blue
//            view.addSubview(squareView)
//
//            animator = UIDynamicAnimator(referenceView: view)
//
//            let gravity = UIGravityBehavior(items: [squareView])
//            animator.addBehavior(gravity)
//
//            let collision = UICollisionBehavior(items: [squareView])
//            collision.translatesReferenceBoundsIntoBoundary = true
//            animator.addBehavior(collision)
//        }
//
//    var squareView: UIView!
//        var animator: UIDynamicAnimator!
//        var attachmentBehavior: UIAttachmentBehavior!
//        var inertiaBehavior: UIDynamicItemBehavior!
//        var gravityBehavior: UIGravityBehavior!
//        var collisionBehavior: UICollisionBehavior!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//
//            squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//            squareView.backgroundColor = UIColor.blue
//            view.addSubview(squareView)
//
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//            squareView.addGestureRecognizer(panGesture)
//
//            animator = UIDynamicAnimator(referenceView: view)
//
//            // Add gravity behavior
//            gravityBehavior = UIGravityBehavior(items: [squareView])
//            animator.addBehavior(gravityBehavior)
//
//            // Add inertia behavior
//            inertiaBehavior = UIDynamicItemBehavior(items: [squareView])
//            inertiaBehavior.resistance = 1.0
//            animator.addBehavior(inertiaBehavior)
//
//            // Add collision behavior with the bottom of the screen as the ground
//            collisionBehavior = UICollisionBehavior(items: [squareView])
//            collisionBehavior.translatesReferenceBoundsIntoBoundary = true
//            animator.addBehavior(collisionBehavior)
//        }
//
//        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
//            let location = gesture.location(in: view)
//            let boxLocation = gesture.location(in: squareView)
//
//            if gesture.state == .began {
//                let centerOffset = UIOffset(horizontal: boxLocation.x - squareView.bounds.midX, vertical: boxLocation.y - squareView.bounds.midY)
//                attachmentBehavior = UIAttachmentBehavior(item: squareView, offsetFromCenter: centerOffset, attachedToAnchor: location)
//                animator.addBehavior(attachmentBehavior)
//            } else if gesture.state == .changed {
//                attachmentBehavior.anchorPoint = location
//            } else if gesture.state == .ended {
//                animator.removeBehavior(attachmentBehavior)
//            }
//        }
    
//    var squareView: UIView!
//       var animator: UIDynamicAnimator!
//       var tapGesture: UITapGestureRecognizer!
//       var gravityBehavior: UIGravityBehavior!
//       var collisionBehavior: UICollisionBehavior!
//
//       override func viewDidLoad() {
//           super.viewDidLoad()
//
//           squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//           squareView.backgroundColor = UIColor.blue
//           view.addSubview(squareView)
//
//           // Add a UITapGestureRecognizer to the square view
//           tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//           squareView.addGestureRecognizer(tapGesture)
//
//           animator = UIDynamicAnimator(referenceView: view)
//
//           // Add gravity behavior to affect the cube
//           gravityBehavior = UIGravityBehavior(items: [squareView])
//           animator.addBehavior(gravityBehavior)
//
//           // Add collision behavior with the screen boundaries
//           collisionBehavior = UICollisionBehavior(items: [squareView])
//           collisionBehavior.translatesReferenceBoundsIntoBoundary = true
//           animator.addBehavior(collisionBehavior)
//       }
//
//       @objc func handleTap(_ gesture: UITapGestureRecognizer) {
//           if gesture.state == .ended {
//               // Apply an initial velocity when the cube is tapped
//               let initialVelocity = CGPoint(x: 0.0, y: -500.0) // Adjust the y value for desired initial upward velocity
//               squareView.frame.origin = CGPoint(x: 100, y: 100) // Reset the cube's position
//               squareView.isHidden = false // Make the cube visible
//
//               // Remove the cube from the gravity behavior temporarily
//               gravityBehavior.removeItem(squareView)
//
//               // Apply initial velocity to the cube
//               let dynamicItem = UIDynamicItemBehavior(items: [squareView])
//               dynamicItem.addLinearVelocity(initialVelocity, for: squareView)
//               animator.addBehavior(dynamicItem)
//
//               // Re-add the cube to the gravity behavior after a short delay (e.g., 1 second)
//               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                   self.gravityBehavior.addItem(self.squareView)
//               }
//           }
//       }
    
    var squareView: UIView!
       var animator: UIDynamicAnimator!
       var tapGesture: UITapGestureRecognizer!
       var gravityBehavior: UIGravityBehavior!
       var collisionBehavior: UICollisionBehavior!

       override func viewDidLoad() {
           super.viewDidLoad()

           squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
           squareView.backgroundColor = UIColor.blue
           view.addSubview(squareView)

           // Add a UITapGestureRecognizer to the square view
           tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
           squareView.addGestureRecognizer(tapGesture)

           animator = UIDynamicAnimator(referenceView: view)

           // Add gravity behavior to affect the cube
           gravityBehavior = UIGravityBehavior(items: [squareView])
           animator.addBehavior(gravityBehavior)

           // Add collision behavior with the screen boundaries
           collisionBehavior = UICollisionBehavior(items: [squareView])
           collisionBehavior.translatesReferenceBoundsIntoBoundary = true
           animator.addBehavior(collisionBehavior)
       }

       @objc func handleTap(_ gesture: UITapGestureRecognizer) {
           if gesture.state == .ended {
                 // Apply an initial velocity when the cube is tapped
                 let initialVelocity = CGPoint(x: 350.0, y: -200.0) // Adjust the values as needed
                 squareView.frame.origin = CGPoint(x: 100, y: 100) // Reset the cube's position
                 squareView.isHidden = false // Make the cube visible
                 
                 // Remove the cube from the gravity behavior temporarily
                 gravityBehavior.removeItem(squareView)
                 
                 // Apply initial velocity to the cube
                 let dynamicItem = UIDynamicItemBehavior(items: [squareView])
                 dynamicItem.addLinearVelocity(initialVelocity, for: squareView)
                 animator.addBehavior(dynamicItem)
                 
                 // Re-add the cube to the gravity behavior after a short delay (e.g., 1 second)
                 DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                     self.gravityBehavior.addItem(self.squareView)
                 }
             }
       }
}

