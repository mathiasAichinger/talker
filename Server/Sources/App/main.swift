import Vapor
import VaporMongo

let drop = Droplet()
try drop.addProvider(VaporMongo.Provider.self)

drop.preparations.append(Post.self)
drop.preparations.append(ServerTalk.self)
drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.resource("posts", PostController())
drop.resource("talks", TalkController())

drop.run()
