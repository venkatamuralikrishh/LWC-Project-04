({
	addition : function(component, event, helper) {
		var fn = component.get('v.fno');
        var sn = component.get('v.sno');
        var add = parseInt(fn)+parseInt(sn);
        component.set('v.sum',add);
        var act = $A.get('e.c:ApplicationEventComponentModelExample01Event');
        act.setParams({'sum' : add});
        act.fire();
	},
    substraction : function(component, event, helper) {
		var fn = component.get('v.fno');
        var sn = component.get('v.sno');
        var diff = parseInt(fn)-parseInt(sn);
        component.set('v.diff',diff);
        var act = $A.get('e.c:ApplicationEventComponentModelExample01Event');
        act.setParams({'sub' : diff});
        act.fire();
	},
    multiplication : function(component, event, helper) {
		var fn = component.get('v.fno');
        var sn = component.get('v.sno');
        var multi = parseInt(fn)*parseInt(sn);
        component.set('v.mul',multi);
        var act = $A.get('e.c:ApplicationEventComponentModelExample01Event');
        act.setParams({'mul' : multi});
        act.fire();
	}
})