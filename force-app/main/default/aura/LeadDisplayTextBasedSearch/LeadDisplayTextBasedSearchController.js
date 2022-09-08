({
	display : function(component, event, helper) {
		var l1 = component.get('v.lname');
        var act1 = component.get('c.getLeadData');
        act1.setParam('leadname',l1);
        $A.enqueueAction(act1,false);
        act1.setCallback(this,function(response) {
            var rs1 = response.getReturnValue();
            if(rs1!=null) {
                component.set('leadList1',rs1);
            }
            else {
                component.set('msg','Sorry, No records are available');
            }
        });
        component.set('v.cols',[{label : 'Lead Name', fieldName : 'Name', type : 'text' }]);
	}
})