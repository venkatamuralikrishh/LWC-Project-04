({
	addTwoStrings : function(component, event, helper) {
		var fname = component.get('v.fname');
        var lname = component.get('v.lname');
        var sum = fname + lname;
        component.set('v.result',sum);
        alert(sum);
	}
})