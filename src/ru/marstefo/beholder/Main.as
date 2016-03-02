package ru.marstefo.beholder
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IEventDispatcher;
	import robotlegs.bender.extensions.contextView.ContextView;
	import ru.marstefo.liss.net.bundles.MVCSBundleNoTraceLog;
	import robotlegs.bender.framework.impl.Context;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author liss
	 */
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
		
			Mouse.hide();
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			
			var loader:Loader = new Loader();
			loader.load(new URLRequest('assets/Iskin-0.1.0.swf'));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onDebug);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _onDebug);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onDebug);
			addChild(loader);
			
			//setup context
			/*context = Context(new Context()
			.install(MVCSBundleNoTraceLog)
			.configure(new AppConfig())
			.configure(new ContextView(this)));*/
		}	
		
		private function _onDebug(e:*):void
		{
			trace(e.toString());
			IEventDispatcher(e.currentTarget).removeEventListener(Event.COMPLETE, _onDebug);
			IEventDispatcher(e.currentTarget).removeEventListener(IOErrorEvent.IO_ERROR, _onDebug);
			IEventDispatcher(e.currentTarget).removeEventListener(SecurityErrorEvent.SECURITY_ERROR, _onDebug);
		}
	}
}