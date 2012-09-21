package me.pa3.quest.views {
	import starling.display.MovieClip;
	import starling.events.Event;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class MarinaView extends ActorView {

		[Embed(source="/assets/actors/timur/timur.png")]
		private const WALK_SPRITE_SHEET:Class;

		[Embed(source="/assets/actors/timur/timur.xml", mimeType="application/octet-stream")]
		private const ANIMATION_ATLAS:Class;

		public function MarinaView() {
			super("marina");
		}

		override protected function createAnimations():void {
			var texture:Texture = Texture.fromBitmap(new WALK_SPRITE_SHEET, true, true, 1);
			var xml:XML = XML(new ANIMATION_ATLAS);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			addAnimation("move", new MovieClip(atlas.getTextures("Timur_walk"), 10));
			addAnimation("stand", new MovieClip(atlas.getTextures("Timur_stand"),  10));
            switchAnimationTo("stand");
		}
	}
}
