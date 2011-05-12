package view
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.ui.Keyboard;
	import flash.display.Shape;
	
	
	public class ZoomCanvas extends Sprite
	{
		private var affineTransform : Matrix
		
		// Constructor
		public function ZoomCanvas()
		{
			addEventListener( Event.ADDED_TO_STAGE, registerListeners )
			createGrid()
		}
		
		
		// Transformations
		public function scaleAt( scale : Number, originX : Number, originY : Number ) : void
		{
			affineTransform = transform.matrix
			affineTransform.translate( -originX, -originY )
			affineTransform.scale( scale, scale )
			affineTransform.translate( originX, originY )
			transform.matrix = affineTransform
		}
		
		public function rotateAt( angle : Number, originX : Number, originY : Number ) : void
		{
			affineTransform = transform.matrix
			affineTransform.translate( -originX, -originY )
			affineTransform.rotate( angle )
			affineTransform.translate( originX, originY )
			transform.matrix = affineTransform
		}
		
		
		// Helpers
		private function registerListeners( event : Event ) : void
		{
			stage.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDown )
			stage.addEventListener( MouseEvent.MOUSE_UP, onMouseUp )
			stage.addEventListener( MouseEvent.MOUSE_WHEEL, onMouseWheel )
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown )            
		}
		
		private function createGrid() : void
		{
			var spacing : Number = 10
			
			for( var row : uint = 0; row < 5; row++ )
			{
				for( var column : uint = 0; column < 5; column++ )
				{
					//var circle : Circle = new Circle()
					
					//circle.x = column * ( circle.width + spacing )
					//circle.y = row * ( circle.height + spacing )
					
					//addChild( circle )
				}
			}    
		}
		
		
		// Event Handlers
		private function onMouseWheel( event : MouseEvent ) : void
		{
			var originX : Number = stage.mouseX
			var originY : Number = stage.mouseY
			if( !event.altKey )
			{
				if( event.delta > 0 )
				{                    
					scaleAt( 6/5, originX, originY ) 
				}
				else
				{                
					scaleAt( 5/6, originX, originY )
				}
			}
			else
			{
				rotateAt( event.delta / 20, originX, originY )
			}
		}
		
		private function onMouseDown( event : MouseEvent ) : void
		{
			startDrag()
		}
		
		private function onMouseUp( event : MouseEvent ) : void
		{
			stopDrag()
		}
		
		private function onKeyDown( event : KeyboardEvent ) : void
		{
			var originX : Number = stage.mouseX
			var originY : Number = stage.mouseY
			
			if( event.keyCode == Keyboard.UP )
			{
				scaleAt( 6/5, originX, originY )                            
			}
			else if( event.keyCode == Keyboard.DOWN )
			{
				scaleAt( 5/6, originX, originY )                    
			}
			else if( event.keyCode == Keyboard.LEFT )
			{
				rotateAt( -Math.PI / 60, originX, originY )                
			}
			else if( event.keyCode == Keyboard.RIGHT )
			{
				rotateAt( Math.PI / 60, originX, originY )                
			}
		}
	}    
}