protocol AdvanceLifeSupport{
    func performCPR()
}


class EmergencyCallHandler{
    var delegate: AdvanceLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happend?")
    }
    func medicalEmergency(){
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport{
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor : AdvanceLifeSupport{
    
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStetescope(){
        print("Listining for heart sounds")
    }
}

class Surgeon : Doctor{
    override func performCPR() {
        super.performCPR()
        print("Signs staying alive by the BeeGees")
    }
}


let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)


emilio.assessSituation()
emilio.medicalEmergency()

