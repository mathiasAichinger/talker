import Vapor
import VaporMongo
import TalkerFramework

let drop = Droplet()
try drop.addProvider(VaporMongo.Provider.self)

drop.preparations.append(Speaker.self)
drop.preparations.append(Talk.self)
drop.preparations.append(Feedback.self)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("talks", TalkController())
drop.resource("speakers", SpeakerController())
drop.resource("feedbacks", FeedbackController())

drop.run()
