

import ARKit

class Sword: SCNNode {
    func loadModel() {
        guard let virtualObjectScene = SCNScene(named: "Sword.scn") else { return }
        let wrapperNode = SCNNode()
        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }
        addChildNode(wrapperNode)
    }
}
