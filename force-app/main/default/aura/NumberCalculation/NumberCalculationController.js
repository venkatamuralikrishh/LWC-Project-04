({
	addition : function(component, event, helper) {
		helper.getData(component);
        var sum = parseInt(helper.fnum)+parseInt(helper.snum);
        component.set('v.result',sum);
	},
    substraction : function(component, event, helper) {
		helper.getData(component);
        var sum = parseInt(helper.fnum)-parseInt(helper.snum);
        component.set('v.result',sum);
	},
    multiplication : function(component, event, helper) {
		helper.getData(component);
        var sum = parseInt(helper.fnum)*parseInt(helper.snum);
        component.set('v.result',sum);
	}
})