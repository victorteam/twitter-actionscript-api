/** DirectMessageOperation.as
 * 
 * @author Denis Borisenko
 * 
 * Part of TwitterAPI project. Copyright (c) 2009.
 * http://code.google.com/p/twitter-actionscript-api/
 */
package com.dborisenko.api.twitter.net
{
	import com.dborisenko.api.twitter.data.TwitterDirectMessage;
	
	import flash.events.Event;

	public class DirectMessageOperation extends TwitterOperation
	{
		private var isSent:Boolean = true;
		
		public function DirectMessageOperation(url:String, requiresAuthentication:Boolean=true, 
			params:Object=null, isSent:Boolean=true)
		{
			super(url, requiresAuthentication, params);
			
			this.isSent = isSent;
		}
		
		[Bindable]
		public function get directMessage():TwitterDirectMessage
		{
			return data as TwitterDirectMessage;
		}
		
		public function set directMessage(value:TwitterDirectMessage):void
		{
			data = value;
		}
		
		override protected function handleResult(event:Event) : void
        {
			var xml:XML = getXML();
        	if (xml.name() == "direct_message")
        	{
	        	directMessage = new TwitterDirectMessage(xml);
	        	directMessage.isSent = isSent;
        	}
            super.handleResult(event);
        }
	}
}