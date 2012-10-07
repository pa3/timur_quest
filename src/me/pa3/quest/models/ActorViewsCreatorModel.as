package me.pa3.quest.models {
import flash.geom.Rectangle;

import me.pa3.quest.views.*;

import starling.display.MovieClip;
import starling.textures.Texture;
import starling.textures.TextureAtlas;

public class ActorViewsCreatorModel {

        [Embed(source="/assets/actors/timur/timur.png")]
        private const TIMUR_WALK_SPRITE_SHEET:Class;

        [Embed(source="/assets/actors/timur/timur.xml", mimeType="application/octet-stream")]
        private const TIMUR_ANIMATION_ATLAS:Class;

        [Embed(source="/assets/actors/timur/timur.png")]
        private const MARINA_WALK_SPRITE_SHEET:Class;

        [Embed(source="/assets/actors/timur/timur.xml", mimeType="application/octet-stream")]
        private const MARINA_ANIMATION_ATLAS:Class;

        public  function createActor(actorId:String):ActorView {
            var actor:ActorView = new ActorView(actorId, new Rectangle(-20, -100, 40, 200));
			switch (actorId) {
				case "timur":
                    var texture:Texture = Texture.fromBitmap(new TIMUR_WALK_SPRITE_SHEET(), true, true, 1);
                    var xml:XML = XML(new TIMUR_ANIMATION_ATLAS());
                    var atlas:TextureAtlas = new TextureAtlas(texture, xml);
                    actor.addAnimation("move", new MovieClip(atlas.getTextures("Timur_walk"), 10));
                    actor.addAnimation("stand", new MovieClip(atlas.getTextures("Timur_stand"),  10));
					break;
				case "marina":
                    var texture:Texture = Texture.fromBitmap(new MARINA_WALK_SPRITE_SHEET(), true, true, 1);
                    var xml:XML = XML(new MARINA_ANIMATION_ATLAS());
                    var atlas:TextureAtlas = new TextureAtlas(texture, xml);
                    actor.addAnimation("move", new MovieClip(atlas.getTextures("Timur_walk"), 10));
                    actor.addAnimation("stand", new MovieClip(atlas.getTextures("Timur_stand"),  10));
                    break;
            }
            return actor;
		}
	}
}
