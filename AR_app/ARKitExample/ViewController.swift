import ARKit
import AVFoundation
let musicFile = Bundle.main.path(forResource: "Fargo", ofType: ".mp3")
let kStartingPosition = SCNVector3(0, 0, -0.6)
let kAnimationDurationMoving: TimeInterval = 0.2
let kMovingLengthPerLoop: CGFloat = 0.05
let kRotationRadianPerLoop: CGFloat = 0.2

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    
    var sword = Sword()
    var musicEffect: AVAudioPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            try musicEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        }
        catch{
            print(error)
        }
        setupScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupConfiguration()
        addSword()
    }
    
    func addSword() {
        sword.loadModel()
        sword.position = kStartingPosition
        sword.rotation = SCNVector4Zero
        sceneView.scene.rootNode.addChildNode(sword)
    }
    
    func setupScene() {
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    func setupConfiguration() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    @IBAction func upLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.moveBy(x: 0, y: kMovingLengthPerLoop, z: 0, duration: kAnimationDurationMoving)
        execute(action: action, sender: sender)
    }
    
    @IBAction func downLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.moveBy(x: 0, y: -kMovingLengthPerLoop, z: 0, duration: kAnimationDurationMoving)
        execute(action: action, sender: sender)
    }
    
    @IBAction func moveLeftLongPressed(_ sender: UILongPressGestureRecognizer) {
        let x = -deltas().cos
        let z = deltas().sin
        moveSword(x: x, z: z, sender: sender)
    }
    
    @IBAction func moveRightLongPressed(_ sender: UILongPressGestureRecognizer) {
        let x = deltas().cos
        let z = -deltas().sin
        moveSword(x: x, z: z, sender: sender)
    }
    
    @IBAction func moveForwardLongPressed(_ sender: UILongPressGestureRecognizer) {
        let x = -deltas().sin
        let z = -deltas().cos
        moveSword(x: x, z: z, sender: sender)
    }
    
    @IBAction func moveBackLongPressed(_ sender: UILongPressGestureRecognizer) {
        let x = deltas().sin
        let z = deltas().cos
        moveSword(x: x, z: z, sender: sender)
    }
    
    @IBAction func rotateLeftLongPressed(_ sender: UILongPressGestureRecognizer) {
        rotateSword(yRadian: kRotationRadianPerLoop, sender: sender)
    }
    
    @IBAction func rotateRightLongPressed(_ sender: UILongPressGestureRecognizer) {
        rotateSword(yRadian: -kRotationRadianPerLoop, sender: sender)
    }
    
    private func rotateSword(yRadian: CGFloat, sender: UILongPressGestureRecognizer) {
        let action = SCNAction.rotateBy(x: 0, y: yRadian, z: 0, duration: kAnimationDurationMoving)
        execute(action: action, sender: sender)
    }
    
    private func moveSword(x: CGFloat, z: CGFloat, sender: UILongPressGestureRecognizer) {
        let action = SCNAction.moveBy(x: x, y: 0, z: z, duration: kAnimationDurationMoving)
        execute(action: action, sender: sender)
    }
    
    private func execute(action: SCNAction, sender: UILongPressGestureRecognizer) {
        let loopAction = SCNAction.repeatForever(action)
        if sender.state == .began {
            sword.runAction(loopAction)
        } else if sender.state == .ended {
            sword.removeAllActions()
        }
    }
    
    private func deltas() -> (sin: CGFloat, cos: CGFloat) {
        return (sin: kMovingLengthPerLoop * CGFloat(sin(sword.eulerAngles.y)), cos: kMovingLengthPerLoop * CGFloat(cos(sword.eulerAngles.y)))
    }
    @IBAction func playMusic(_ sender: Any) {
        musicEffect.currentTime = 0
        musicEffect.play()
    }
    @IBAction func stopMusic(_ sender: Any) {
        musicEffect.stop()
    }
    
}
