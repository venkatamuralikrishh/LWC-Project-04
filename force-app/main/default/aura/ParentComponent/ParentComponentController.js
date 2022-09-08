({
	method : function(component, event, helper) {
        var childCmp = component.find('c');
		component.set('v.parentCmp',childCmp.get('v.valueFromChild'));
	}
})