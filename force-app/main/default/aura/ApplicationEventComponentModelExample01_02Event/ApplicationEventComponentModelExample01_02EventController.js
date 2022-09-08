({
	myAction : function(component, event, helper) {
		var res = event.getParam('sum');
        component.set('v.sum',res);
	}
})