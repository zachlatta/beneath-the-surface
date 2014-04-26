package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _surface:FlxSprite;
	private var _player:FlxSprite;
	private var _background:FlxSprite;

	private var _playerSpeed:Float = 120;
	private var _playerJump:Float = 200;
	private var _flagWalking:Bool = false;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.mouse.visible = false;
		FlxG.cameras.flash(FlxColor.BLACK);

		_background = new FlxSprite();
		_background.loadGraphic("assets/images/background.png");
		add(_background);

		_player = new FlxSprite(132, 142);
		_player.loadGraphic("assets/images/player.png", true, true, 71, 132);
		_player.animation.add("idle", [0, 1], 4, true);
		_player.x = 284;
		_player.y = 300;
		add(_player);

		_player.animation.play("idle");

		_surface = new FlxSprite();
		_surface.loadGraphic("assets/images/surface.png");
		_surface.x = 70;
		_surface.y = 25;
		add(_surface);

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
