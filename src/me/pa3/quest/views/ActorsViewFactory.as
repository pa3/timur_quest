package me.pa3.quest.views {
	public class ActorsViewFactory {
		public function createActor(actorId:String):ActorView {
			switch (actorId) {
				case "timur":
					return new TimurView();
				case "marina":
					return new MarinaView();
			}
		}
	}
}
