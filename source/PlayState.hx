package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
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

	private var _ground:FlxObject;
	private var _leftWall:FlxObject;
	private var _rightWall:FlxObject;
	private var _bounds:FlxGroup;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();

		FlxG.mouse.visible = false;
		FlxG.cameras.flash(FlxColor.BLACK);

		_background = new FlxSprite();
		_background.loadGraphic("assets/images/background.png");
		add(_background);

		_player = new FlxSprite(132, 142);
		_player.loadGraphic("assets/images/player.png", true, true, 71, 132);
		_player.animation.add("idle", [0, 1], 4, true);
		_player.x = 284;
		_player.y = 200;
		add(_player);

		_player.acceleration.y = 420;
		_player.maxVelocity.set(_playerSpeed, 420);
		_player.drag.set(_playerSpeed * 4, _playerSpeed * 4);

		_player.animation.play("idle");

		_surface = new FlxSprite();
		_surface.loadGraphic("assets/images/surface.png");
		_surface.x = 70;
		_surface.y = 25;
		add(_surface);

		_bounds = new FlxGroup();
		_ground = new FlxObject(0, FlxG.height, FlxG.width, 30);
		_leftWall = new FlxObject(-30, 0, 30, FlxG.height);
		_rightWall = new FlxObject(FlxG.width, 0, 30, FlxG.height);

		_ground.immovable = true;
		_leftWall.immovable = true;
		_rightWall.immovable = true;

		_bounds.add(_ground);
		_bounds.add(_leftWall);
		_bounds.add(_rightWall);

		add(_bounds);

		FlxG.worldBounds.set(-30, -30, FlxG.width + 60, FlxG.height + 60);
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

		FlxG.collide(_player, _bounds);

		if (FlxG.keys.anyPressed(["LEFT", "A"]))
		{
			_player.velocity.x = -_playerSpeed;
		} 

		if (FlxG.keys.anyPressed(["RIGHT", "D"]))
		{
			_player.velocity.x = _playerSpeed;
		} 

		if (FlxG.keys.anyPressed(["Z", "SPACE", "UP", "W"]))
		{
			if (_player.isTouching(FlxObject.FLOOR)) 
			{
				_player.velocity.y = -_playerJump;
			}	
		}
	}	
}
