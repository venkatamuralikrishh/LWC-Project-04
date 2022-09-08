({
	demo1 : function(component, event, helper) {
		alert('Alert from Demo1');
        var d2 = component.get('c.demo2');
        var d3 = component.get('c.demo3');
	},
    demo2 : function(component, event, helper) {
		alert('Alert from Demo2');
	},
    demo3 : function(component, event, helper) {
		alert('Alert from Demo3');
	}
})