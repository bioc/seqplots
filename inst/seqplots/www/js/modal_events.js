var modalBinding = new Shiny.InputBinding();
$.extend(modalBinding, {
  find: function(scope) {
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    return $(scope).find("#calcModal");
=======
    return $(scope).find("#myModal");
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
  },
  getValue: function(el) {
	// no-impl
  },
  setValue: function(el, value) {
	// no-impl
  },
  subscribe: function(el, callback) {
    $(el).on("shown", function(e) {
    	//$('#publicRdata').val(' ').change(); 
    	
		//$('#plot_type').change(); 
    	callback();
    });
  },
  unsubscribe: function(el) {
<<<<<<< 0855384d43d2e83c69bb9ff96f3ed7ead8da615a
    $(el).off("#calcModal");
=======
    $(el).off("#myModal");
>>>>>>> Adds rain/ TSCAN/ GOsummaries/ geecc/ seqplots/ systemPipeR/ to the repos.
  }
});

Shiny.inputBindings.register(modalBinding);