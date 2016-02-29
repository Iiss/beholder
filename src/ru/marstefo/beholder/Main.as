package ru.marstefo.beholder
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IEventDispatcher;
	/**
	 * ...
	 * @author liss
	 */
	public class Main extends Sprite 
	{
		public function Main():void 
		{
			var loader:Loader = new Loader();
			loader.load(new URLRequest('assets/Iskin-0.1.0.swf'));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onDebug);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _onDebug);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, _onDebug);
			addChild(loader);
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