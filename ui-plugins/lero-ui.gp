import "dime-models/app.data" as data

plugin pageframe {
	styles ["ocs-ui-plugins/page_frame/page_frame.css"]
	scripts ["ocs-ui-plugins/page_frame/page_frame.js"]
	template "ocs-ui-plugins/page_frame/page_frame.html" placeholder [Placeholder]
	function onPageFrameLoad {
		primitiveParameter "userName":text
	}
}