/*var replyService = (function() {
	
	function add(reply, callback, error) {
		console.log("add reply");
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange() = function () {
			if (xhr.readyState == 4 && xhr.status == 200) {
				function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				}
			} else {
				function (xhr, status, er) {
					if (error) {
						error(er);
					}
				}
			}
		}
		xhr.open("post", "replies/new");
		xhr.send();
	}
	
	return {
		
	}
	
})();*/